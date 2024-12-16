<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Team;
use App\Models\User;
use App\Models\Task;
use Illuminate\Support\Facades\Auth;
use App\Models\Invitation;
use App\Notifications\TeamInvitation;
use Spatie\Activitylog\Models\Activity;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;
use App\Notifications\TeamMemberLeftNotification;


class TeamController extends Controller
{
    public function index()
    {
        $teams = Auth::user()->usertype == 'admin' ? Team::all() : Auth::user()->teams;

        // Fetch pending invitations for the authenticated user
        $invitations = Invitation::where('invitee_id', Auth::id())
                                  ->where('status', 'pending')
                                  ->get();
    
        return view('teams.index', compact('teams', 'invitations'));    }

    public function create()
    {
        $users = User::where('usertype', '!=', 'admin')->where('id', '!=', Auth::id())->get(); // Exclude admin and creator
    return view('teams.create', compact('users'));
    }
    
    
    
public function store(Request $request)
{
    $request->validate([
        'name' => [
            'required',
            'string',
            'max:50', 
            'regex:/^[a-zA-Z0-9\s]+$/' 
        ],
        'description' => 'nullable|string',
        'members' => 'required|array', 
        'has_rewards' => 'required|boolean', 
        'team_image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
    ], [
        'name.regex' => 'The team name can only contain letters, numbers, and spaces.',
        'name.max' => 'The team name must not exceed 50 characters.',
    ]);

    
    $imagePath = null;
    
    
    if ($request->hasFile('team_image')) {
        $imagePath = $request->file('team_image')->store('team_images', 'public');
    }

    
    $team = Team::create([
        'name' => $request->name,
        'description' => $request->description,
        'creator_id' => Auth::id(), 
        'has_rewards' => $request->has_rewards,
        'image' => $imagePath,
    ]);

    $team->members()->attach(Auth::id(), [
        'level' => 0,
        'xp' => 0,
        'total_points' => 0,
    ]);

    foreach ($request->members as $userId) {
        $user = User::where('usertype', '!=', 'admin')->find($userId); // Exclude admin from invitations
        if ($user) {
            Invitation::create([
                'team_id' => $team->id,
                'inviter_id' => Auth::id(),
                'invitee_id' => $user->id,
                'email' => $user->email,
                'status' => 'pending',
            ]);
            try {
                $user->notify(new \App\Notifications\TeamInvitation($team, Auth::user()));
            } catch (\Exception $e) {
                \Log::error("Failed to send invitation email: " . $e->getMessage());
            }
        }
    }

    activity()
        ->causedBy(Auth::user())
        ->performedOn($team)
        ->withProperties(['name' => $team->name])
        ->log('Created a team: ' . $team->name);

    return redirect()->route('user.teams.index')->with('success', 'Team created and invitations sent successfully.');
}






public function show(Request $request, $id)
{
    $team = Team::with(['members', 'creator'])->findOrFail($id);

    $userTeamData = $team->members()->where('user_id', Auth::id())->first();

    $totalPoints = DB::table('team_members')
        ->where('team_id', $team->id)
        ->where('user_id', Auth::id())
        ->value('total_points') ?? 0;

    $query = $team->tasks();
    $startDate = $request->input('start_date');
    $endDate = $request->input('end_date');

    if ($startDate && $endDate) {
        $query->whereBetween('created_at', [$startDate, $endDate]);
    }

    $completedTasks = $team->tasks()->where('status', 'done')->count();
    $totalTasks = $team->tasks()->count();
    $taskCompletionPercentage = $totalTasks > 0 ? ($completedTasks / $totalTasks) * 100 : 0;
    $notStarted = $team->tasks()->where('status', 'not started')->count();
    $inProgress = $team->tasks()->where('status', 'in progress')->count();
    $done = $team->tasks()->where('status', 'done')->count();
    $lowPriority = $team->tasks()->where('priority', 'low')->count();
    $mediumPriority = $team->tasks()->where('priority', 'medium')->count();
    $highPriority = $team->tasks()->where('priority', 'high')->count();
    $overdue = $team->tasks()->where('due_date', '<', now())->count();
    $dueThisWeek = $team->tasks()->whereBetween('due_date', [now()->startOfWeek(), now()->endOfWeek()])->count();
    $dueToday = $team->tasks()->whereDate('due_date', now())->count();

    if (Auth::user()->usertype != 'admin' && !$team->members->contains(Auth::id())) {
        return redirect('/dashboard')->with('error', 'Unauthorized access to this team.');
    }

    if (Auth::user()->usertype == 'admin' || Auth::id() == $team->creator_id) {
        $tasks = $team->tasks()
            ->with('assignments')  
            ->where('status', 'done')
            ->where('approval_status', 'pending')
            ->get();
    } else {
        $tasks = $team->tasks()
            ->with('assignments') 
            ->whereHas('assignments', function($query) {
                $query->where('user_id', Auth::id());
            })
            ->get();
    }

    $tasksPendingApproval = [];
    $tasksToGrade = [];
    
    if (Auth::user()->usertype == 'admin' || Auth::id() == $team->creator_id) {
        $tasksPendingApproval = $team->tasks()
            ->with('assignments')
            ->where('status', 'done')
            ->where('approval_status', 'pending')
            ->get();

        if ($team->has_rewards) {
            $tasksToGrade = $team->tasks()
                ->with('assignments')
                ->where('approval_status', 'approved')
                ->where('is_graded', false)
                ->get();
        }
    }

    return view('teams.show', compact(
        'team', 
        'tasks', 
        'taskCompletionPercentage',
        'notStarted',
        'inProgress',
        'done',
        'lowPriority',
        'mediumPriority',
        'highPriority',
        'overdue',
        'dueThisWeek',
        'dueToday',
        'tasksPendingApproval',
        'tasksToGrade',
        'userTeamData',
        'totalPoints' // Pass totalPoints to the view
    ));
}





public function leave($teamId)
{
    $team = Team::findOrFail($teamId);

    // Check if the user is a member of the team
    if (!$team->members->contains(Auth::id())) {
        return redirect()->back()->with('error', 'You are not a member of this team.');
    }

    // Detach the user from the team
    $team->members()->detach(Auth::id());

    // Notify the creator or inviter about the member leaving
    $creator = $team->creator; // Assuming 'creator' relationship is set up correctly
    if ($creator) {
        $creator->notify(new TeamMemberLeftNotification($team, Auth::user()->name));
    }

    return redirect()->route('teams.index')->with('success', 'You have successfully left the team.');
}



public function edit($id)
{
    $team = Team::with('members')->findOrFail($id);

    // Check if the user is either admin or the creator of the team
    if (Auth::user()->usertype != 'admin' && Auth::id() != $team->creator_id) {
        return redirect()->route('user.teams.index')->with('error', 'You do not have permission to edit this team.');
    }

    // Exclude admin and creator from the list
    $users = User::where('usertype', '!=', 'admin')->where('id', '!=', Auth::id())->get();
    return view('teams.edit', compact('team', 'users'));
}


public function update(Request $request, $id)
{
    $team = Team::findOrFail($id);

    // Check user permission
    if (Auth::user()->usertype != 'admin' && Auth::id() != $team->creator_id) {
        return redirect()->route('user.teams.index')->with('error', 'You do not have permission to update this team.');
    }

    $request->validate([
        'name' => 'required|string|max:255',
        'description' => 'nullable|string',
        'members' => 'required|array',
        'has_rewards' => 'required|boolean',
        'team_image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
    ]);

    // Handle team image update
    if ($request->hasFile('team_image')) {
        // Delete the old image if it exists
        if ($team->image) {
            Storage::delete('public/' . $team->image);
        }
        // Store the new image and update the path
        $imagePath = $request->file('team_image')->store('team_images', 'public');
        $team->image = $imagePath;
    }

    // Get the original and updated members lists (excluding the creator)
    $originalMembers = $team->members->pluck('id')->toArray();
    $updatedMembers = array_diff($request->members, [Auth::id()]);
    $addedMembers = array_diff($updatedMembers, $originalMembers);
    $removedMembers = array_diff($originalMembers, $updatedMembers);

    // Update the team data
    $team->update([
        'name' => $request->name,
        'description' => $request->description,
        'has_rewards' => $request->has_rewards,
    ]);

    // Sync existing members only
    $team->members()->syncWithoutDetaching(array_intersect($updatedMembers, $originalMembers));

    // Handle invitations for newly added members
    foreach ($addedMembers as $userId) {
        // Fetch the user first
        $user = User::find($userId);

        // Check if an invitation already exists and the user exists
        $existingInvitation = Invitation::where([
            'team_id' => $team->id,
            'invitee_id' => $userId,
            'status' => 'pending',
        ])->exists();

        if (!$existingInvitation && $user) {
            // Create invitation and send notification
            Invitation::create([
                'team_id' => $team->id,
                'inviter_id' => Auth::id(),
                'invitee_id' => $userId,
                'email' => $user->email,
                'status' => 'pending',
            ]);

            // Notify the new member
            $user->notify(new TeamInvitation($team, Auth::user()));
        }
    }

    // Log activity with detailed changes if any
    $changes = [];
    if ($team->wasChanged('name')) {
        $changes[] = "Team name changed from '{$team->getOriginal('name')}' to '{$team->name}'";
    }
    if ($team->wasChanged('description')) {
        $changes[] = "Description updated";
    }
    if ($team->wasChanged('has_rewards')) {
        $changes[] = "Rewards option changed from '" . ($team->getOriginal('has_rewards') ? 'enabled' : 'disabled') . "' to '" . ($team->has_rewards ? 'enabled' : 'disabled') . "'";
    }

    if (!empty($addedMembers)) {
        $addedNames = User::whereIn('id', $addedMembers)->pluck('name')->toArray();
        $changes[] = "Invitations sent to new members: " . implode(', ', $addedNames);
    }

    if (!empty($removedMembers)) {
        $removedNames = User::whereIn('id', $removedMembers)->pluck('name')->toArray();
        $changes[] = "Members removed: " . implode(', ', $removedNames);
    }

    if (!empty($changes)) {
        activity()
            ->causedBy(Auth::user())
            ->performedOn($team)
            ->withProperties(['changes' => $changes])
            ->log('Updated team: ' . $team->name . ' with changes: ' . implode(', ', $changes));
    }

    return redirect()->route('user.teams.index')->with('success', 'Team updated successfully.');
}





    


    public function destroy($id)
{
    $team = Team::findOrFail($id);

    if (Auth::user()->usertype != 'admin' && $team->creator_id != Auth::id()) {
        return redirect()->route('user.teams.index')->with('error', 'You do not have permission to delete this team.');
    }

    try {
        $teamName = $team->name; // Store the team name for the flash message

        // Detach all members from the team
        $team->members()->detach();

        // Delete the team
        $team->delete();

        // Redirect with success message including the team name
        return redirect()->route('user.teams.index')->with('success', "Team '{$teamName}' deleted successfully.");

    } catch (\Exception $e) {
        // Log the error for debugging
        \Log::error('Error deleting team: ' . $e->getMessage());

        // Redirect back with an error message
        return redirect()->route('user.teams.index')->with('error', 'There was an issue deleting the team. Please try again.');
    }
}


  public function viewAnalytics($team_id, $user_id)
{
    $team = Team::findOrFail($team_id);
    $user = User::findOrFail($user_id);

    // Fetch the specific user's team data from the pivot table
    $userTeamData = $team->members()->where('user_id', $user_id)->first();

    // Retrieve the user's total points from the pivot table for the specific team
    $totalPoints = $userTeamData ? $userTeamData->pivot->total_points : 0;

    // Task Statistics (using assignments relationship)
    $totalTasks = $team->tasks()->whereHas('assignments', function ($query) use ($user_id) {
        $query->where('user_id', $user_id);
    })->count();

    $completedTasks = $team->tasks()->whereHas('assignments', function ($query) use ($user_id) {
        $query->where('user_id', $user_id);
    })->where('status', 'done')->count();

    $inProgressTasks = $team->tasks()->whereHas('assignments', function ($query) use ($user_id) {
        $query->where('user_id', $user_id);
    })->where('status', 'in progress')->count();

    $notStartedTasks = $team->tasks()->whereHas('assignments', function ($query) use ($user_id) {
        $query->where('user_id', $user_id);
    })->where('status', 'not started')->count();

    // Tasks completed on time vs. overdue tasks
    $tasksCompletedOnTime = $team->tasks()->whereHas('assignments', function ($query) use ($user_id) {
        $query->where('user_id', $user_id);
    })->where('status', 'done')
        ->whereColumn('due_date', '>=', 'date_completed')
        ->count();

    $tasksOverdue = $team->tasks()->whereHas('assignments', function ($query) use ($user_id) {
        $query->where('user_id', $user_id);
    })->where('status', 'done')
        ->whereColumn('due_date', '<', 'date_completed')
        ->count();

    // Task completion rate for each user (completed / total)
    $completionRate = $totalTasks > 0 ? ($completedTasks / $totalTasks) * 100 : 0;

    // Average time taken to complete tasks
    $averageCompletionTime = $team->tasks()->whereHas('assignments', function ($query) use ($user_id) {
        $query->where('user_id', $user_id);
    })->whereNotNull('date_started')
        ->whereNotNull('date_completed')
        ->get()
        ->map(function ($task) {
            return $task->date_started->diffInHours($task->date_completed);
        })->avg();

    // Task priorities handled by users (high, medium, low)
    $highPriorityTasks = $team->tasks()->whereHas('assignments', function ($query) use ($user_id) {
        $query->where('user_id', $user_id);
    })->where('priority', 'high')->count();

    $mediumPriorityTasks = $team->tasks()->whereHas('assignments', function ($query) use ($user_id) {
        $query->where('user_id', $user_id);
    })->where('priority', 'medium')->count();

    $lowPriorityTasks = $team->tasks()->whereHas('assignments', function ($query) use ($user_id) {
        $query->where('user_id', $user_id);
    })->where('priority', 'low')->count();

    // Count tasks based on grading
    $countGood = $team->tasks()->whereHas('assignments', function ($query) use ($user_id) {
        $query->where('user_id', $user_id);
    })->where('grade', 'good')->count();

    $countVeryGood = $team->tasks()->whereHas('assignments', function ($query) use ($user_id) {
        $query->where('user_id', $user_id);
    })->where('grade', 'very good')->count();

    $countExcellent = $team->tasks()->whereHas('assignments', function ($query) use ($user_id) {
        $query->where('user_id', $user_id);
    })->where('grade', 'excellent')->count();

    // Fetch redeemed rewards for the user within this team
    $redeemedRewards = $user->rewards()->where('team_id', $team_id)->get();

    // Pass data to the view
    return view('teams.analytics', compact(
        'user', 'team', 'userTeamData', 'totalTasks', 'completedTasks', 'inProgressTasks', 
        'notStartedTasks', 'tasksCompletedOnTime', 'tasksOverdue', 'completionRate', 
        'averageCompletionTime', 'highPriorityTasks', 'mediumPriorityTasks', 'lowPriorityTasks', 
        'totalPoints', 'countGood', 'countVeryGood', 'countExcellent', 'redeemedRewards'
    ));
}




}