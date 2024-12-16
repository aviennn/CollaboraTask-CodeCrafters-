<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class InvitationResponseNotification extends Notification
{
    use Queueable;

    protected $teamName;
    protected $response;
    protected $userName;

    /**
     * Create a new notification instance.
     *
     * @param string $teamName
     * @param string $response
     * @param string $userName
     */
    public function __construct($teamName, $response, $userName)
    {
        $this->teamName = $teamName;
        $this->response = $response;
        $this->userName = $userName;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param mixed $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail', 'database']; // Can send via mail or database (to be viewed in-app)
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param mixed $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->greeting('Hello!')
            ->line("{$this->userName} has {$this->response} your invitation to join the team: {$this->teamName}.")
            ->action('View Team', url('/teams/' . $this->teamName))
            ->line('Thank you for using our application!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param mixed $notifiable
     * @return array
     */
           public function toArray($notifiable)
        {
            return [
                'message' => "{$this->userName} has {$this->response} your invitation to join {$this->teamName}:",
                'team_name' => $this->teamName,
                'response' => $this->response,
                'user_name' => $this->userName,
            ];
        }
}
