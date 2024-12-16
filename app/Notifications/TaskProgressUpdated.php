<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;

class TaskProgressUpdated extends Notification
{
    use Queueable;

    protected $task;

    public function __construct($task)
    {
        $this->task = $task;
    }

    public function via($notifiable)
    {
        return ['database'];
    }

    public function toDatabase($notifiable)
    {
        return [
            'message' => "Task '{$this->task->name}' has been updated to status: '{$this->task->status}'",
            'task_id' => $this->task->id,
            'team_name' => $this->task->team->name ?? 'Unknown Team',
            'team_id' => $this->task->team->id ?? null,  // Add team_id for route
        ];
    }
}
