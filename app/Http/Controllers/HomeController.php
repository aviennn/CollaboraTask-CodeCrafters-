<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Task;
use App\Models\User;
use App\Models\Team;
use App\Models\Widget; 
use Carbon\Carbon;
use DB;
use Illuminate\Support\Facades\Log;
use App\Models\Invitation;

class HomeController extends Controller
{
   public function index()
{
    // Admin Dashboard logic
    $totalTasks = Task::count();
    $totalUsers = User::count();
    $totalTeams = Team::count();  // Total number of teams

   $activeUsers = DB::table('activity_log')
        ->where('created_at', '>=', now()->subMinutes(15))
        ->distinct('causer_id')
        ->count('causer_id');

    // Fetch tasks with deadlines this week
    $startOfWeek = Carbon::now()->startOfWeek();
    $endOfWeek = Carbon::now()->endOfWeek();
    $tasks = Task::whereBetween('due_date', [$startOfWeek, $endOfWeek])->get();

    // Fetch recent individual tasks (excluding tasks associated with a team)
    $recentIndividualTasks = Task::whereNull('team_id')
        ->orderBy('created_at', 'desc')
        ->limit(5)
        ->with('user')
        ->get();

    // Fetch recent team tasks (only tasks associated with a team)
    $recentTeamTasks = Task::whereNotNull('team_id')
        ->orderBy('created_at', 'desc')
        ->limit(5)
        ->with('team', 'user')
        ->get();

    // Task progress and priority stats
    $taskData = Task::select('status', \DB::raw('count(*) as total'))
        ->groupBy('status')
        ->pluck('total', 'status')
        ->all();
    $taskPriorities = [
        'high' => Task::where('priority', 'high')->count(),
        'medium' => Task::where('priority', 'medium')->count(),
        'low' => Task::where('priority', 'low')->count(),
    ];
    $taskStatusCounts = [
        'all' => $totalTasks,
        'not started' => $taskData['not started'] ?? 0,
        'in progress' => $taskData['in progress'] ?? 0,
        'done' => $taskData['done'] ?? 0,
    ];

    $user = Auth::user();  // Get the authenticated user
    $dashboardOrder = $user->dashboard_layout ? json_decode($user->dashboard_layout, true) : null;
    return view('admin.dashboard', compact(
        'totalTasks', 
        'totalUsers', 
        'totalTeams',  
        'tasks', 
        'taskData', 
        'taskStatusCounts', 
        'taskPriorities', 
        'recentIndividualTasks',  
        'recentTeamTasks',
        'dashboardOrder',
        'activeUsers' // Pass the active users count to the view
    ));
}

public function fetchActiveUsersCount()
{
    $activeUsers = DB::table('activity_log')
        ->select('causer_id')
        ->where('created_at', '>=', now()->subMinutes(15))
        ->where(function ($query) {
            $query->where('description', 'User logged in')
                  ->orWhere('description', '!=', 'User logged out'); // Include logins or other activities, exclude logouts
        })
        ->where('causer_id', '!=', 2) // Exclude the admin user with ID 2
        ->distinct()
        ->count('causer_id');

    return response()->json(['activeUsers' => $activeUsers]);
}


public function fetchActiveUsersDetails()
{
    try {
        $activeUsers = DB::table('activity_log')
            ->where('activity_log.created_at', '>=', now()->subMinutes(15))
            ->where('activity_log.description', '!=', 'User logged out') // Exclude logout events
            ->where('activity_log.causer_id', '!=', 2) // Exclude the admin user with ID 2
            ->join('users', 'activity_log.causer_id', '=', 'users.id')
            ->distinct('causer_id')
            ->select('users.name', 'users.email', 'users.profile_photo_path')
            ->get()
            ->map(function ($user) {
                // Create full URL for profile photo or default image if not set
                $user->profile_photo_url = $user->profile_photo_path 
                    ? asset('storage/' . $user->profile_photo_path) 
                    : asset('dist/img/avatar5.png');
                return $user;
            });

        return response()->json(['activeUsers' => $activeUsers]);
    } catch (\Exception $e) {
        Log::error('Error fetching active users details:', ['error' => $e->getMessage()]);
        return response()->json(['error' => 'Failed to fetch active users details.'], 500);
    }
}


public function userDashboard()
{
    $user = Auth::user(); // Get the currently authenticated user
    $userTeamsCount = $user->teams()->count();

    // Fetch pending invitations count
    $pendingInvitationsCount = Invitation::where('invitee_id', $user->id)
                                         ->where('status', 'pending')
                                         ->count();

    // Fetch the teams the user is part of
    $userTeams = $user->teams;

    // Fetch this week's tasks for the user
    $startOfWeek = Carbon::now()->startOfWeek();
    $endOfWeek = Carbon::now()->endOfWeek();
   $tasks = Task::where(function ($query) use ($user) {
        // Include personal tasks and team tasks assigned to the user
        $query->where('user_id', $user->id)
              ->orWhereHas('assignments', function ($subQuery) use ($user) {
                  $subQuery->where('user_id', $user->id);
              });
    })
    ->whereBetween('due_date', [$startOfWeek, $endOfWeek])  // Restrict to tasks due this week
    ->get();

    // Fetch recent individual and team tasks
    $recentIndividualTasks = Task::where('user_id', $user->id)
        ->whereNull('team_id')
        ->orderBy('created_at', 'desc')
        ->limit(5)
        ->get();

    $recentTeamTasks = Task::whereHas('team', function ($query) use ($user) {
            $query->whereHas('members', function ($subQuery) use ($user) {
                $subQuery->where('user_id', $user->id);
            });
        })
        ->where(function ($query) use ($user) {
            $query->where('user_id', $user->id)
                  ->orWhereHas('assignments', function ($subQuery) use ($user) {
                      $subQuery->where('user_id', $user->id);
                  });
        })
        ->orderBy('created_at', 'desc')
        ->limit(5)
        ->with(['team', 'assignments'])  // Include 'assignments' relationship to fetch assigned users
        ->get();

    // Calculate total tasks including both personal and team-assigned tasks
    $totalTasks = Task::where(function ($query) use ($user) {
        $query->where('user_id', $user->id)
              ->orWhereHas('assignments', function ($subQuery) use ($user) {
                  $subQuery->where('user_id', $user->id);
              });
    })->count();

    // Calculate task statuses for both personal and assigned team tasks
    $taskData = Task::select('status', \DB::raw('count(*) as total'))
        ->where(function ($query) use ($user) {
            $query->where('user_id', $user->id)
                  ->orWhereHas('assignments', function ($subQuery) use ($user) {
                      $subQuery->where('user_id', $user->id);
                  });
        })
        ->groupBy('status')
        ->pluck('total', 'status')
        ->all();

    // Calculate task priorities for both personal and assigned team tasks
    $taskPriorities = [
        'high' => Task::where(function ($query) use ($user) {
            $query->where('user_id', $user->id)
                  ->orWhereHas('assignments', function ($subQuery) use ($user) {
                      $subQuery->where('user_id', $user->id);
                  });
        })->where('priority', 'high')->count(),
        'medium' => Task::where(function ($query) use ($user) {
            $query->where('user_id', $user->id)
                  ->orWhereHas('assignments', function ($subQuery) use ($user) {
                      $subQuery->where('user_id', $user->id);
                  });
        })->where('priority', 'medium')->count(),
        'low' => Task::where(function ($query) use ($user) {
            $query->where('user_id', $user->id)
                  ->orWhereHas('assignments', function ($subQuery) use ($user) {
                      $subQuery->where('user_id', $user->id);
                  });
        })->where('priority', 'low')->count(),
    ];

    // Combine personal and team tasks in taskStatusCounts
    $taskStatusCounts = [
        'all' => $totalTasks,
        'not started' => $taskData['not started'] ?? 0,
        'in progress' => $taskData['in progress'] ?? 0,
        'done' => $taskData['done'] ?? 0,
    ];

    $latestSession = \App\Models\SessionDuration::where('user_id', $user->id)
        ->latest('login_time')
        ->first();

    // Fetch the saved dashboard layout if it exists
    $dashboardOrder = $user->dashboard_layout ? json_decode($user->dashboard_layout, true) : null;

    // Fetch user notifications
    $notifications = $user->notifications;
    $unreadNotifications = $user->unreadNotifications;

    // Fetch user widgets (including Notes)
    $widgets = Widget::where('user_id', $user->id)->with('notes')->get();

    return view('dashboard', compact(
        'user',
        'totalTasks', 
        'tasks', 
        'taskData', 
        'taskStatusCounts', 
        'taskPriorities', 
        'recentIndividualTasks',  
        'recentTeamTasks',
        'userTeams', 
        'userTeamsCount',
        'dashboardOrder',
        'notifications',
        'unreadNotifications',
        'latestSession',
        'widgets',
        'pendingInvitationsCount'  // Pass pending invitations count to the view
    ));
}



}