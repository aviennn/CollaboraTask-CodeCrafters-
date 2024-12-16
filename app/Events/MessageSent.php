<?php

namespace App\Events;

use App\Models\Message;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class MessageSent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $message;

    public function __construct(Message $message)
    {
        // Ensure the user relationship is loaded
        $this->message = $message->load('user');
    }

    public function broadcastOn()
    {
        // Broadcasting on a private channel for the team
        return new PrivateChannel('team.' . $this->message->team_id);
    }

    public function broadcastWith()
{
    // Safeguard to avoid undefined properties if user data is missing
    return [
        'id' => $this->message->id,
        'team_id' => $this->message->team_id,
        'user_id' => $this->message->user_id,
        'message' => $this->message->message,
        'created_at' => $this->message->created_at,
        'user' => [
            'name' => $this->message->user->name ?? 'Anonymous',
            'profile_photo_path' => $this->message->user->profile_photo_path ?? 'avatar5.png',
        ],
    ];
}

}
