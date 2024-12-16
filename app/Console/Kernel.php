<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use Illuminate\Support\Facades\Log;
use Carbon\Carbon;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        \App\Console\Commands\SendTaskOverdueNotifications::class,
        \App\Console\Commands\SendTaskDueReminders::class,
        \App\Console\Commands\ClearOldSessions::class,
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        // Schedule the task: send task due date reminders every day at midnight
        $schedule->command('tasks:send-due-reminders')
            ->dailyAt('00:00')
            ->before(function () {
                Log::info("Running tasks:send-due-reminders at " . now());
            })
            ->onSuccess(function () {
                Log::info("tasks:send-due-reminders completed successfully.");
            })
            ->onFailure(function () {
                Log::error("tasks:send-due-reminders failed to run.");
            });

        // Schedule the overdue task notification to run daily
        $schedule->command('tasks:send-overdue-notifications')
            ->dailyAt('00:00')
            ->before(function () {
                Log::info("Running tasks:send-overdue-notifications at " . now());
            })
            ->onSuccess(function () {
                Log::info("tasks:send-overdue-notifications completed successfully.");
            })
            ->onFailure(function () {
                Log::error("tasks:send-overdue-notifications failed to run.");
            });

        // Schedule the old session clearing command
        $schedule->command('sessions:clear-old')
            ->daily()
            ->before(function () {
                Log::info("Running sessions:clear-old at " . now());
            })
            ->onSuccess(function () {
                Log::info("sessions:clear-old completed successfully.");
            })
            ->onFailure(function () {
                Log::error("sessions:clear-old failed to run.");
            });
            
          
    }
    
    

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__ . '/Commands');

        require base_path('routes/console.php');
    }
}
