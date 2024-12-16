<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Task;

class SendTaskDueReminders extends Command
{
    // Command name to call from CLI
    protected $signature = 'tasks:send-due-reminders';

    // Command description
    protected $description = 'Send reminders for tasks that are due in 1 week, 3 days, or tomorrow';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        try {
            // Call the method to send due date reminders
            Task::sendDueDateReminder();

            $this->info('Task due date reminders have been sent successfully.');
        } catch (\Exception $e) {
            // Log any errors encountered during the command execution
            \Log::error('Failed to send due reminders: ' . $e->getMessage());
            $this->error('An error occurred while sending due reminders.');
        }

        return 0;
    }
}
