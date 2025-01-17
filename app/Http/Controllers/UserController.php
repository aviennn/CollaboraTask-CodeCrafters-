<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\RedirectResponse;
use App\Notifications\ViewActivityLogNotification;
use Spatie\Activitylog\Models\Activity;




class UserController extends Controller
{
    public function index()
    {
        // Retrieve all users
        $users = User::withCount([
            'tasks',
            'tasks as tasks_not_started_count' => function ($query) {
                $query->where('status', 'not started');
            },
            'tasks as tasks_in_progress_count' => function ($query) {
                $query->where('status', 'in progress');
            },
            'tasks as tasks_done_count' => function ($query) {
                $query->where('status', 'done');
            }
        ])->get();

        // Return view with users data
        return view('admin.users.index', compact('users'));
    }

    
    public function saveDashboardLayout(Request $request)
    {
        // Get the currently authenticated user
        $user = auth()->user();

        // Save the new order as a JSON-encoded string in the 'dashboard_layout' column
        $user->dashboard_layout = json_encode($request->order);
        $user->save();

        // Return a success response
        return response()->json(['success' => true]);
    }

    // For Admin Dashboard Layout
    public function showAdminDashboard()
    {
        $user = auth()->user();

        // Load the saved layout if it exists
        $dashboardOrder = $user->dashboard_layout ? json_decode($user->dashboard_layout, true) : null;

        return view('admin.dashboard', compact('dashboardOrder'));
    }

    // For User Dashboard Layout
    public function showUserDashboard()
    {
        $user = auth()->user();

        // Load the saved layout if it exists
        $dashboardOrder = $user->dashboard_layout ? json_decode($user->dashboard_layout, true) : null;

        // Fetch relevant data for the user dashboard
        $userTeamsCount = $user->teams()->count();
        $recentIndividualTasks = $user->tasks()->recent()->limit(5)->get();
        $recentTeamTasks = $user->teamTasks()->recent()->limit(5)->get();
        $taskStatusCounts = $this->getUserTaskStatusCounts($user);
        $taskPriorities = $this->getUserTaskPriorities($user);
        $tasks = $this->getUserTasksDueThisWeek($user);

        return view('dashboard', compact(
            'dashboardOrder', 
            'userTeamsCount', 
            'recentIndividualTasks', 
            'recentTeamTasks', 
            'taskStatusCounts', 
            'taskPriorities', 
            'tasks'
        ));
    }

    // Helper Methods for User Dashboard Data (example placeholders)
    private function getUserTaskStatusCounts($user) {
        return [
            'all' => $user->tasks()->count(),
            'not started' => $user->tasks()->where('status', 'not started')->count(),
            'in progress' => $user->tasks()->where('status', 'in progress')->count(),
            'done' => $user->tasks()->where('status', 'done')->count(),
        ];
    }

    private function getUserTaskPriorities($user) {
        return [
            'high' => $user->tasks()->where('priority', 'high')->count(),
            'medium' => $user->tasks()->where('priority', 'medium')->count(),
            'low' => $user->tasks()->where('priority', 'low')->count(),
        ];
    }

    private function getUserTasksDueThisWeek($user) {
        $startOfWeek = now()->startOfWeek();
        $endOfWeek = now()->endOfWeek();

        return $user->tasks()
                    ->whereBetween('due_date', [$startOfWeek, $endOfWeek])
                    ->get();
    }

    public function resetDashboardLayout(Request $request)
{
    // Get the authenticated user
    $user = auth()->user();

    // Default layout (use your actual component IDs here)
    $defaultLayout = json_encode([
        'teams-box',
        'task-status-box',
        'priority-box',
        'individual-task-box',
        'team-task-box',
        'task-progress-box',
        'deadlines-box',
    ]);

    // Set the layout to default
    $user->dashboard_layout = $defaultLayout;
    $user->save();

    return response()->json(['success' => true, 'message' => 'Layout has been reset to default.']);
}


   public function show($id)
{
    $user = User::withCount([
        'tasks',
        'tasks as tasks_not_started_count' => function ($query) {
            $query->where('status', 'not started');
        },
        'tasks as tasks_in_progress_count' => function ($query) {
            $query->where('status', 'in progress');
        },
        'tasks as tasks_done_count' => function ($query) {
            $query->where('status', 'done');
        }
    ])->findOrFail($id);

    // Retrieve activities for the user
    $activities = $user->activities()->latest()->get();

    // Return the correct view path
    return view('admin.users.show', compact('user', 'activities'));
}


    public function create()
    {
        return view('admin.users.create');
    }
    public function edit($id)
    {
        $user = User::findOrFail($id);
        return view('admin.users.edit', compact('user'));
    }

   public function update(Request $request, $id)
{
    $request->validate([
        'name' => 'required|string|max:255',
        'email' => 'required|string|email|max:255|unique:users,email,' . $id,
        'password' => [
            'nullable',
            'string',
            'confirmed',
            'min:8',
            'regex:/[a-z]/',     // At least one lowercase letter
            'regex:/[A-Z]/',     // At least one uppercase letter
            'regex:/[0-9]/',     // At least one number
            'regex:/[\W_]/',     // At least one special character
        ],
    ], [
        'password.min' => 'The password must be at least 8 characters long.',
        'password.regex' => 'The password must include at least one uppercase letter, one lowercase letter, one number, and one special character.',
        'password.confirmed' => 'The password confirmation does not match.',
    ]);

    $user = User::findOrFail($id);
    $user->name = $request->name;
    $user->email = $request->email;

    if ($request->filled('password')) {
        $user->password = Hash::make($request->password);
    }

    $user->save();

    return redirect()->route('admin.users.index')->with('success', 'User updated successfully.');
}

    public function destroy($id)
    {
        $user = User::findOrFail($id);
        $user->delete();

        return redirect()->route('admin.users.index')->with('success', 'User deleted successfully.');
    }

  public function store(Request $request): RedirectResponse
{
    $request->validate([
        'name' => ['required', 'string', 'max:255', 'unique:users,name'], // Add unique validation for name
        'email' => ['required', 'string', 'email', 'max:255', 'unique:users,email'],
        'password' => [
            'required',
            'string',
            'confirmed',
            'min:8',
            'regex:/[a-z]/',
            'regex:/[A-Z]/',
            'regex:/[0-9]/',
            'regex:/[\W_]/',
        ],
    ], [
        'name.unique' => 'The name has already been taken.', // Custom message for duplicate names
        'password.min' => 'The password must be at least 8 characters long.',
        'password.regex' => 'The password must include at least one uppercase letter, one lowercase letter, one number, and one special character.',
        'password.confirmed' => 'The password confirmation does not match.',
    ]);

    // Create the user
    $user = User::create([
        'name' => $request->name,
        'email' => $request->email,
        'password' => Hash::make($request->password),
    ]);

    // Redirect with success message
    return redirect()->route('admin.users.index')->with('success', 'User created successfully!');
}



    public function settings()
    {
        return view('user.settings'); // Adjust this to point to the correct view file
    }
    

    public function updateSettings(Request $request)
    {
        $request->validate([
            'theme_presets' => 'nullable|string',
            'font_family' => 'nullable|string',
            'font_size' => 'nullable|string',
            'font_color' => 'nullable|string',
            'background_color' => 'nullable|string',
            'navbar_color' => 'nullable|string',
            'sidebar_color' => 'nullable|string',
        ]);
    
        $user = Auth::user();
    
        // Apply custom user settings if available
        if ($request->has('font_family')) {
            $user->font_family = $request->font_family;
        }
    
        if ($request->has('font_size')) {
            $user->font_size = $request->font_size;
        }
    
        if ($request->has('font_color')) {
            $user->font_color = $request->font_color;
        }
    
        if ($request->has('background_color')) {
            $user->background_color = $request->background_color;
        }
    
        if ($request->has('navbar_color')) {
            $user->navbar_color = $request->navbar_color;
        }
    
        if ($request->has('sidebar_color')) {
            $user->sidebar_color = $request->sidebar_color;
        }
    
        // Apply theme settings only if a theme preset is selected
        if ($request->has('theme_presets') && config('themes.' . $request->theme_presets)) {
            $theme = config('themes.' . $request->theme_presets);
    
            // Only apply theme settings if corresponding user input is not present
            $user->background_color = $request->background_color ?? $theme['background_color'];
            $user->font_color = $request->font_color ?? $theme['font_color'];
            $user->font_size = $request->font_size ?? $theme['font_size'];
            $user->navbar_color = $request->navbar_color ?? $theme['navbar_color'];
            $user->sidebar_color = $request->sidebar_color ?? $theme['sidebar_color'];
            $user->font_family = $request->font_family ?? $theme['font_family'];
        }
    
        $user->save();
    
        return redirect()->back()->with('success', 'Settings updated successfully.');
    }




public function resetTheme(Request $request)
{
    $user = Auth::user();

    $user->font_family = 'Arial';
    $user->font_size = '16px';
    $user->navbar_color = '#00355b';  // Default navbar color
    $user->sidebar_color = '#00355b'; // Custom sidebar color for reset theme
    $user->background_color = '#ffffff';    // Default body/content-wrapper color
    $user->font_color = '#000000';    // Default font color
    $user->save();

    return redirect()->back()->with('success', 'Theme reset to default.');
}

public function viewActivityLog($userId)
{
    $user = User::findOrFail($userId);
    $authUser = auth()->user();
    $team = $user->teams()->first(); // Retrieve the first team the user belongs to

    // Check if the team exists
    if (!$team) {
        abort(404, 'Team not found for the user.');
    }

    // Retrieve the team leader
    $teamLeader = User::find($team->creator_id);

    if (!$teamLeader) {
        abort(404, 'Team leader not found.');
    }

    // Authorization check: Ensure only the team leader or an admin can view the activity log
    if ($authUser->id !== $teamLeader->id && !$authUser->isAdmin()) {
        abort(403, 'Unauthorized access. You do not have permission to view this activity log.');
    }

    // Send the notification with the correct team leader's name
    $user->notify(new ViewActivityLogNotification($authUser->name));

    // Log the action
    activity()
        ->causedBy($authUser)
        ->performedOn($user)
        ->withProperties(['team' => $team->name])
        ->log("Viewed activity log of {$user->name}");

    // Retrieve the paginated activities for the user
    $activities = Activity::where('causer_id', $user->id)->latest()->get();

    // Return the view
    return view('analytics.activity-log', compact('user', 'team', 'activities'));
}


    
    
}
