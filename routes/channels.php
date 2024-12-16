<?php

use Illuminate\Support\Facades\Broadcast;

Broadcast::channel('team.{teamId}', function ($user, $teamId) {
    \Log::info('Broadcast auth check', ['user' => $user->id, 'team' => $teamId]);

    // Check if the user is an admin or part of the team
    return $user->usertype === 'admin' || $user->teams->contains($teamId);
});

// Channel for user-specific notifications
Broadcast::channel('App.Models.User.{userId}', function ($user, $userId) {
    return (int) $user->id === (int) $userId;  // Allow users to listen only to their own notifications
});

Broadcast::channel('user-to-admin.{userId}', function ($user, $userId) {
    return (int) $user->id === (int) $userId; // Ensure users can listen to their private channels
});

Broadcast::channel('admin-to-user.{userId}', function ($user, $userId) {
    \Log::info('Authorizing admin-to-user channel', ['user_id' => $user->id, 'usertype' => $user->usertype, 'channel_user_id' => $userId]);
    return $user->usertype === 'admin'; // Only admins can broadcast to any user
});

