<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\MailMessage;

class TaskResubmittedNotification extends Notification
{
    use Queueable;

    protected $task;

    public function __construct($task)
    {
        $this->task = $task;
    }

    public function via($notifiable)
    {
        return ['database']; // Adjust based on your notification channels
    }

    /*//public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->subject('Task Resubmitted for Approval')
                    ->line('The task "' . $this->task->name . '" has been resubmitted for your approval.')
                    ->action('View Task', url(route('user.tasks.show', $this->task->id)))
                    ->line('Thank you for using our application!');
    }
*/
    public function toArray($notifiable)
    {
        return [
            'task_id' => $this->task->id,
            'task_name' => $this->task->name,
            'message' => 'A task has been resubmitted for your approval',
            'team_id' => $this->task->team_id,
        ];
    }
}
