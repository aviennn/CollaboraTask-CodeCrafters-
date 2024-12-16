<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class FeedbackSubmitted extends Notification
{
    use Queueable;

    protected $feedback;
    protected $user;

    /**
     * Create a new notification instance.
     *
     * @param  $feedback  The feedback object
     * @param  $user  The user who submitted the feedback
     */
    public function __construct($feedback, $user)
    {
        $this->feedback = $feedback;
        $this->user = $user;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database'];  // Store the notification in the database
    }

    /**
     * Get the database representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toDatabase($notifiable)
    {
        return [
        'message' => "by {$this->user->name} in '{$this->feedback->category}'. category ",
        'feedback_id' => $this->feedback->id,
        'feedback_url' => route('feedback.index'), // Link to the feedback index page
        'category' => $this->feedback->category,
        'comment' => $this->feedback->comment,
        'submitted_at' => $this->feedback->created_at->format('Y-m-d H:i:s'),
    ];
    }
}
