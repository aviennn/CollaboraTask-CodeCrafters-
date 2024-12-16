<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Task;

class SendTaskOverdueNotifications extends Command
{
    // Define the command signature and description
    protected $signature = 'tasks:send-overdue-notifications';
    protected $description = 'Send notifications for tasks that are overdue.';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        try {
            // Call the Task model method to send overdue notifications
            Task::sendOverdueNotifications();

            $this->info('Overdue task notifications have been sent successfully.');
        } catch (\Exception $e) {
            // Log any errors encountered during the command execution
            \Log::error('Failed to send overdue notifications: ' . $e->getMessage());
            $this->error('An error occurred while sending overdue notifications.');
        }

        return 0;
    }
}
