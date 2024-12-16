<?php
// app/Console/Commands/ClearOldSessions.php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class ClearOldSessions extends Command
{
    protected $signature = 'sessions:clear-old';
    protected $description = 'Clear session records older than a specified number of days';

    public function handle()
    {
        $cutoffDate = Carbon::now()->subDays(7); // Adjust as needed
        DB::table('session_durations')->where('last_activity', '<', $cutoffDate)->delete();
        $this->info('Old sessions cleared successfully.');
    }
}
