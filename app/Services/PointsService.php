<?php

namespace App\Services;

use App\Models\Task;
use App\Models\User;
use App\Models\Reward;

class PointsService
{
    /**
     * Adjust the points of a task and save the changes.
     *
     * @param Task $task
     * @param int $pointsToAdd
     * @return Task
     */
    public function adjustTaskPoints(Task $task, int $pointsToAdd): Task
    {
        $task->points += $pointsToAdd;
        $task->save();
        return $task;
    }

    /**
     * Deduct points from a user's tasks within a specific team.
     *
     * @param User $user
     * @param int $teamId
     * @param int $pointsToDeduct
     * @return int Remaining points that could not be deducted (if any)
     */
    public function deductUserPoints(User $user, int $teamId, int $pointsToDeduct): int
{
    $remainingPoints = $pointsToDeduct;

    // Fetch tasks where the user is assigned in the specified team, ordered by completion date
   $tasks = $user->assignedTasks()
              ->where('team_id', $teamId)
              ->where('status', 'done')
              ->orderBy('date_completed')
              ->get();

    foreach ($tasks as $task) {
        if ($remainingPoints <= 0) break;

        // Calculate the user's share of points for tasks with multiple assignees
        $assignedUsersCount = $task->assignments->count();
        $userShare = $assignedUsersCount > 1 ? floor($task->points / $assignedUsersCount) : $task->points;

        if ($userShare >= $remainingPoints) {
            // Deduct the required points from this task's share for the user
            $task->points -= $remainingPoints;
            $task->save();
            $remainingPoints = 0;
        } else {
            // Deduct all points from this task's share for the user and move on to the next
            $remainingPoints -= $userShare;
            $task->points -= $userShare;
            $task->save();
        }
    }

    return $remainingPoints;
}


    /**
     * Check if a user has enough points to redeem a reward and deduct them if possible.
     *
     * @param User $user
     * @param Reward $reward
     * @return bool True if points were deducted successfully, false otherwise.
     */
    public function deductPointsForReward(User $user, Reward $reward): bool
    {
        // Calculate total points earned by the user for tasks within the reward's team
        $userPoints = $user->tasks()
                           ->where('team_id', $reward->team_id)
                           ->where('status', 'done')
                           ->sum('points');

        // Check if the user has enough points
        if ($userPoints < $reward->points_required) {
            return false;
        }

        // Deduct points using the existing `deductUserPoints` method
        $remainingPoints = $this->deductUserPoints($user, $reward->team_id, $reward->points_required);

        // Return true if all required points were successfully deducted
        return $remainingPoints === 0;
    }
}
