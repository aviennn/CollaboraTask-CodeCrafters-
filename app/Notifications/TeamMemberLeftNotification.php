<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use App\Models\Team;

class TeamMemberLeftNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected $team;
    protected $memberName;

    public function __construct(Team $team, $memberName)
    {
        $this->team = $team;
        $this->memberName = $memberName;
    }

    public function via($notifiable)
    {
        return ['mail', 'database'];
    }

    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject('Team Member Left: ' . $this->team->name)
            ->line($this->memberName . ' has left the team "' . $this->team->name . '".')
            ->action('View Team', route('teams.show', ['team' => $this->team->id]))
            ->line('Thank you for using our application!');
    }

    public function toArray($notifiable)
    {
        return [
            'message' => $this->memberName . ' has left the team: ' . $this->team->name,
            'team_id' => $this->team->id,  // Using ID for routing
            'team_name' => $this->team->name,
            'member_name' => $this->memberName,
        ];
    }
}
