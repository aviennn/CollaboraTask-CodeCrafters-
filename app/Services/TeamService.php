<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use App\Models\Task;

class TeamService
{
    public function awardXPForTaskCompletion($userId, Task $task, $pointsGained)
{
    $xpGained = $pointsGained; // Assuming XP is equal to the points gained
    $teamId = $task->team_id;

    // Ensure points are divided equally if multiple users are assigned to the task
   $assignedUsers = $task->assignments()->wherePivot('user_id', $userId)->exists();
    if ($assignedUsers > 1) {
        $xpGained = floor($xpGained / $assignedUsersCount); // Distribute points evenly
    }

    // Increment XP in the team_members table for this specific team and user
    DB::table('team_members')
        ->where('team_id', $teamId)
        ->where('user_id', $userId)
        ->increment('xp', $xpGained);

    // Increment total_points in the team_members table for this specific team and user
    DB::table('team_members')
        ->where('team_id', $teamId)
        ->where('user_id', $userId)
        ->increment('total_points', $xpGained); // Using xpGained for both

    \Log::info("Awarded {$xpGained} XP and {$xpGained} points to user {$userId} for team {$teamId}");

    // Check if the user should level up within this team
    $this->checkLevelUp($teamId, $userId);
}


    protected function checkLevelUp($teamId, $userId)
    {
        $xpThreshold = 100; // Set the XP required per level

        // Retrieve the user's current level and XP for the specific team
        $teamMember = DB::table('team_members')
                        ->where('team_id', $teamId)
                        ->where('user_id', $userId)
                        ->first();

        if (!$teamMember) {
            \Log::warning("No team member record found for user {$userId} in team {$teamId}");
            return; // Exit if the teamMember record does not exist
        }

        \Log::info("Current XP for user {$userId} in team {$teamId}: {$teamMember->xp}");

        // While the user's XP exceeds the threshold, level them up
        while ($teamMember->xp >= $xpThreshold) {
            \Log::info("User {$userId} in team {$teamId} has enough XP to level up.");

            // Increment the level
            DB::table('team_members')
                ->where('team_id', $teamId)
                ->where('user_id', $userId)
                ->increment('level');

            // Subtract the threshold from XP
            $newXp = $teamMember->xp - $xpThreshold;
            DB::table('team_members')
                ->where('team_id', $teamId)
                ->where('user_id', $userId)
                ->update(['xp' => $newXp]);

            \Log::info("Leveled up user {$userId} in team {$teamId}. New XP: {$newXp}");

            // Refresh teamMember data to check if further level-ups are possible
            $teamMember = DB::table('team_members')
                            ->where('team_id', $teamId)
                            ->where('user_id', $userId)
                            ->first();
        }
    }
}
