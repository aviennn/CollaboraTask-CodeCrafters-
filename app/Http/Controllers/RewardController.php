<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Reward;
use App\Models\Team;
use Illuminate\Support\Facades\Auth;
use App\Services\PointsService; 
use App\Notifications\RewardRedeemedNotification;
use Illuminate\Support\Facades\DB;

class RewardController extends Controller
{
    protected $pointsService;
    public function __construct(PointsService $pointsService)
    {
        $this->pointsService = $pointsService;
    }
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string',
            'points_required' => 'required|integer|min:0',
            'team_id' => 'required|exists:teams,id',
        ]);
    
        // Assign the newly created reward to $reward
        $reward = Reward::create([
            'name' => $request->name,
            'description' => $request->description,
            'points_required' => $request->points_required,
            'team_id' => $request->team_id,
        ]);
    
        activity()
        ->causedBy(Auth::user())
        ->performedOn($reward)
        ->withProperties(['name' => $reward->name, 'points_required' => $reward->points_required])
        ->log('Created a reward: ' . $reward->name . ' for team ' . $reward->team->name);
    
        return redirect()->route('user.teams.show', $request->team_id)->with('success', 'Reward added successfully.');
    }
    

    public function update(Request $request, $id)
    {
        $reward = Reward::findOrFail($id);

        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'required|string',
            'points_required' => 'required|integer|min:0',
        ]);

        $reward->update([
            'name' => $request->name,
            'description' => $request->description,
            'points_required' => $request->points_required,
        ]);
        
        activity()
        ->causedBy(Auth::user())
        ->performedOn($reward)
        ->withProperties(['name' => $reward->name, 'points_required' => $reward->points_required])
        ->log('Updated the reward: ' . $reward->name . ' for team ' . $reward->team->name);

        return redirect()->route('user.teams.show', $reward->team_id)->with('success', 'Reward updated successfully.');
    }

    public function destroy($id)
    {
        $reward = Reward::findOrFail($id);
        $reward->delete();
        $teamName = $reward->team->name; 

        activity()
        ->causedBy(Auth::user())
        ->performedOn($reward)
        ->withProperties(['name' => $reward->name])
        ->log('Deleted the reward: ' . $reward->name . ' from team ' . $teamName);
        
        return redirect()->route('user.teams.show', $reward->team_id)->with('success', 'Reward deleted successfully.');
    }

   public function redeem($id)
{
    $reward = Reward::findOrFail($id);
    $user = Auth::user();
    $team = $reward->team;
    $teamLeader = $team->creator;  // Assuming 'creator' is a relationship in the Team model

    // Retrieve the user's total points for this specific team from the team_members table
    $userTotalPoints = DB::table('team_members')
        ->where('team_id', $team->id)
        ->where('user_id', $user->id)
        ->value('total_points') ?? 0;

    // Check if the user has enough points
    if ($userTotalPoints >= $reward->points_required) {
        // Deduct points from team_members
        DB::table('team_members')
            ->where('team_id', $team->id)
            ->where('user_id', $user->id)
            ->decrement('total_points', $reward->points_required);

        // Attach the redeemed reward to the user
        $user->rewards()->attach($reward->id, ['redeemed_at' => now()]);

        // Notify the team leader if they exist
        if ($teamLeader) {
            $teamLeader->notify(new RewardRedeemedNotification($reward, $team, $user));
        }

        session()->flash('success', 'Reward "' . $reward->name . '" redeemed successfully!');
        return redirect()->route('user.teams.show', $reward->team_id);
    } else {
        session()->flash('error', 'Not enough points to redeem this reward.');
        return redirect()->route('user.teams.show', $reward->team_id);
    }
}

    

}
