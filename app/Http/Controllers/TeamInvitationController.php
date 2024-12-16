<?php
namespace App\Http\Controllers;

use App\Models\Invitation;
use Illuminate\Support\Facades\Auth;
use App\Notifications\InvitationResponseNotification;

class TeamInvitationController extends Controller
{
    // Show all pending invitations for the logged-in user
   public function index()
{
    $invitations = Invitation::with(['team', 'inviter'])
                              ->where('invitee_id', Auth::id())
                              ->where('status', 'pending')
                              ->get();

    return view('teams.invitations', compact('invitations'));
}


   public function accept($invitationId)
{
    $invitation = Invitation::findOrFail($invitationId);

    if ($invitation->invitee_id != Auth::id() || $invitation->status != 'pending') {
        return redirect()->route('user.teams.index')->with('error', 'Invalid invitation.');
    }

    $invitation->status = 'accepted';
    $invitation->save();

    // Check if the team still exists before adding the user
    if ($invitation->team) {
        $invitation->team->members()->attach(Auth::id(), [
            'level' => 0,
            'xp' => 0,
            'total_points' => 0,
        ]);
    }

    // Set up the team name and inviter name with graceful fallbacks
    $teamName = $invitation->team ? $invitation->team->name : 'Unknown Team';
    $inviter = $invitation->inviter;

    // Send notification if the inviter still exists and handle potential email errors
    if ($inviter) {
        try {
            $inviter->notify(new InvitationResponseNotification($teamName, 'accepted', Auth::user()->name));
        } catch (\Exception $e) {
            \Log::error('Notification failed: ' . $e->getMessage());
        }
    }

    return redirect()->route('user.teams.index')->with('success', 'You have successfully joined the team.');
}


public function reject($invitationId)
{
    $invitation = Invitation::findOrFail($invitationId);

    if ($invitation->invitee_id != Auth::id() || $invitation->status != 'pending') {
        return redirect()->route('user.teams.index')->with('error', 'Invalid invitation.');
    }

    $invitation->status = 'rejected';
    $invitation->save();

    // Set up the team name and inviter name with graceful fallbacks
    $teamName = $invitation->team ? $invitation->team->name : 'Unknown Team';
    $inviter = $invitation->inviter;

    // Send notification if the inviter still exists and handle potential email errors
    if ($inviter) {
        try {
            $inviter->notify(new InvitationResponseNotification($teamName, 'rejected', Auth::user()->name));
        } catch (\Exception $e) {
            \Log::error('Notification failed: ' . $e->getMessage());
        }
    }

    return redirect()->back()->with('success', 'You have rejected the team invitation.');
}

}