<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\BroadcastMessage;
use Illuminate\Notifications\Notification;
use App\Models\UserAdminMessage;

class NewUserAdminMessageNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $message;

    public function __construct(UserAdminMessage $message)
    {
        $this->message = $message;
    }

    public function via($notifiable)
    {
        return ['broadcast', 'database']; // Broadcasting and storing in the database
    }

    public function toBroadcast($notifiable)
    {
        $avatarPath = $this->message->user->profile_photo_path 
            ? asset('storage/' . $this->message->user->profile_photo_path) 
            : asset('dist/img/avatar5.png');

        return new BroadcastMessage([
            'message_id' => $this->message->id,
            'message_body' => $this->message->message,
            'sender_name' => $this->message->user->name,
            'sender_avatar' => $avatarPath, // Add avatar path for broadcast notifications
        ]);
    }

    public function toArray($notifiable)
    {
        $avatarPath = $this->message->user->profile_photo_path 
            ? asset('storage/' . $this->message->user->profile_photo_path)
            : asset('dist/img/avatar5.png');

        return [
            'message_id' => $this->message->id,
            'message_body' => $this->message->message,
            'sender_name' => $this->message->user->name,
            'sender_avatar' => $avatarPath,
        ];
    }
}
