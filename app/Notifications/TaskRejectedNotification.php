<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Messages\BroadcastMessage;
use Illuminate\Notifications\Notification;
use App\Models\Task;

class TaskRejectedNotification extends Notification implements ShouldQueue
{
    use Queueable;

    public $task;
    public $rejectionRemarks;

    public function __construct(Task $task, $rejectionRemarks)
    {
        $this->task = $task;
        $this->rejectionRemarks = $rejectionRemarks;
    }

    public function via($notifiable)
    {
        return ['database', 'broadcast'];
    }

  public function toArray($notifiable)
{
    return [
        'task_id' => $this->task->id,
        'task_name' => $this->task->name,
        'team_name' => $this->task->team->name ?? 'N/A',
        'rejection_remarks' => $this->rejectionRemarks,
        'message' => $this->message ?? 'Your task has been rejected', // Default message
    ];
}
}

