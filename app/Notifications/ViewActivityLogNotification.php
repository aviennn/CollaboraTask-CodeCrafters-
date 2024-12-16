<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\DatabaseMessage;

class ViewActivityLogNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $teamLeaderName;

    public function __construct($teamLeaderName)
    {
        $this->teamLeaderName = $teamLeaderName;
    }

    public function via($notifiable)
    {
        return ['database'];
    }

    public function toDatabase($notifiable)
    {
        return new DatabaseMessage([
            'message' => "{$this->teamLeaderName} has viewed your activity log.",
            'team_leader_name' => $this->teamLeaderName,
            'viewed_at' => now(),
        ]);
    }
}
