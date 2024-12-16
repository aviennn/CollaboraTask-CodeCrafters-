<?php

namespace App\Events;

use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
use App\Models\UserAdminMessage;

class UserMessageSent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $message;

    public function __construct(UserAdminMessage $message)
    {
        $this->message = $message->load('user');
    }

    // The channels the event should broadcast on
    public function broadcastOn()
    {
        // Broadcasting to a channel named after the user ID that the admin listens to
        return new PrivateChannel('user-to-admin.' . $this->message->user_id);
    }

    public function broadcastWith()
{
    return [
        'message' => $this->message->message,
        'sender_name' => $this->message->user->name ?? 'Unknown',
        'created_at' => $this->message->created_at->toDateTimeString(),
        'file_url' => $this->message->file_url,
        'original_file_name' => $this->message->original_file_name
    ];
}
}

