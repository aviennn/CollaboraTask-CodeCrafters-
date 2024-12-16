<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Task;
use App\Models\TaskAttachment;
use App\Models\Checklist;
use App\Models\Team;
use Illuminate\Support\Facades\Storage;
use App\Notifications\TaskAssigned;
use App\Models\User;
use App\Notifications\TaskProgressUpdated;
use Spatie\Activitylog\Models\Activity;
use App\Events\TaskCreated;
use App\Notifications\BadgeUnlocked;
use App\Models\Badge;
use App\Services\RewardService;
use Illuminate\Support\Facades\DB;
use App\Services\TeamService;
use App\Services\PointsService;
use App\Notifications\TaskRejectedNotification;
use App\Notifications\TaskResubmittedNotification;
use App\Notifications\TaskApprovedNotification;
use Illuminate\Support\Facades\Notification;


class TaskController extends Controller
{
    protected $rewardService;
    protected $teamService;
    protected $pointsService;
   public function __construct(RewardService $rewardService, TeamService $teamService, PointsService $pointsService)
{
    $this->rewardService = $rewardService;
    $this->teamService = $teamService;
    $this->pointsService = $pointsService;
}

    
public function index(Request $request, $status = null)
{
    $user = Auth::user();
    $userId = $user->id;

    $query = $user->usertype == 'admin' 
        ? Task::with('user', 'team', 'assignments') 
        : Task::where(function ($q) use ($userId) {
            $q->where('user_id', $userId)
              ->orWhereHas('assignments', function ($subQuery) use ($userId) {
                  $subQuery->where('user_id', $userId);
              });
        })->with('user', 'team', 'assignments');

    $teamQuery = $user->usertype == 'admin' 
        ? Task::whereNotNull('team_id')->with('team', 'user', 'assignments') 
        : Task::whereHas('team.members', function ($query) use ($userId) {
            $query->where('user_id', $userId);
        })->where(function ($q) use ($userId) {
            $q->where('user_id', $userId)
              ->orWhereHas('assignments', function ($subQuery) use ($userId) {
                  $subQuery->where('user_id', $userId);
              });
        })->with('team', 'user', 'assignments');

    if ($status && $status !== 'all') {
        $query->where('status', $status);
        $teamQuery->where('status', $status);
    } elseif ($request->filled('status')) {
        $query->where('status', $request->input('status'));
        $teamQuery->where('status', $request->input('status'));
    }

    if ($request->filled('priority')) {
        $query->where('priority', $request->input('priority'));
        $teamQuery->where('priority', $request->input('priority'));
    }
    if ($request->filled('due_date')) {
        $dueDate = $request->input('due_date');
        if ($dueDate === 'overdue') {
            $query->where('due_date', '<', now());
            $teamQuery->where('due_date', '<', now());
        } elseif ($dueDate === 'dueToday') {
            $query->whereDate('due_date', '=', now()->toDateString());
            $teamQuery->whereDate('due_date', '=', now()->toDateString());
        } elseif ($dueDate === 'dueThisWeek') {
            $query->whereBetween('due_date', [now()->startOfWeek(), now()->endOfWeek()]);
            $teamQuery->whereBetween('due_date', [now()->startOfWeek(), now()->endOfWeek()]);
        }
    }

    if ($request->filled('start_date') && $request->filled('end_date')) {
        $query->whereBetween('due_date', [$request->input('start_date'), $request->input('end_date')]);
        $teamQuery->whereBetween('due_date', [$request->input('start_date'), $request->input('end_date')]);
    } elseif ($request->filled('start_date')) {
        $query->where('due_date', '>=', $request->input('start_date'));
        $teamQuery->where('due_date', '>=', $request->input('start_date'));
    } elseif ($request->filled('end_date')) {
        $query->where('due_date', '<=', $request->input('end_date'));
        $teamQuery->where('due_date', '<=', $request->input('end_date'));
    }

    $allTasks = $query->get();
    $teamTasks = $teamQuery->get();

    if ($user->usertype == 'admin') {
        $tasksNotStarted = Task::where('status', 'not started')->with('user', 'team', 'assignments')->get();
        $tasksInProgress = Task::where('status', 'in progress')->with('user', 'team', 'assignments')->get();
        $tasksDone = Task::where('status', 'done')->with('user', 'team', 'assignments')->get();
    } else {
        $tasksNotStarted = Task::where('status', 'not started')
            ->where(function ($q) use ($userId) {
                $q->where('user_id', $userId)
                  ->orWhereHas('assignments', function ($subQuery) use ($userId) {
                      $subQuery->where('user_id', $userId);
                  });
            })
            ->with('user', 'team', 'assignments')
            ->get();

        $tasksInProgress = Task::where('status', 'in progress')
            ->where(function ($q) use ($userId) {
                $q->where('user_id', $userId)
                  ->orWhereHas('assignments', function ($subQuery) use ($userId) {
                      $subQuery->where('user_id', $userId);
                  });
            })
            ->with('user', 'team', 'assignments')
            ->get();

        $tasksDone = Task::where('status', 'done')
            ->where(function ($q) use ($userId) {
                $q->where('user_id', $userId)
                  ->orWhereHas('assignments', function ($subQuery) use ($userId) {
                      $subQuery->where('user_id', $userId);
                  });
            })
            ->with('user', 'team', 'assignments')
            ->get();
    }

    return view('tasks.index', compact('allTasks', 'tasksNotStarted', 'tasksInProgress', 'tasksDone', 'teamTasks'));
}




    
   public function assignTask(Request $request, Task $task)
{
    $request->validate([
        'user_ids' => 'required|array',
        'user_ids.*' => 'exists:users,id',
    ]);

    $userIds = $request->input('user_ids');

    $task->assignments()->sync($userIds);

    foreach ($task->assignments as $user) {
        $user->notify(new TaskAssigned($task));
    }

    activity()
        ->causedBy(Auth::user())
        ->performedOn($task)
        ->withProperties([
            'task_name' => $task->name,
            'assigned_to' => $task->assignments->pluck('name')->toArray()
        ])
        ->log('Assigned task: ' . $task->name . ' to multiple users');

    return redirect()->back()->with('message', 'Task assigned to multiple users and notifications sent.');
}



    public function calendarView()
{
    return view('tasks.calendar');  
}

public function fetchEvents()
{
    $user = auth()->user();

    if ($user->usertype == 'admin') {
        
        $tasks = Task::with('user', 'checklists', 'attachments', 'team')->get();
    } else {
        
        $tasks = Task::with('user', 'checklists', 'attachments', 'team')
            ->where(function ($query) use ($user) {
                $query->where('user_id', $user->id)
                      ->orWhereHas('assignments', function ($query) use ($user) {
                          $query->where('user_id', $user->id); 
                      })
                      ->orWhereHas('team.members', function ($query) use ($user) {
                          $query->where('user_id', $user->id); 
                      });
            })
            ->get();
    }

    $events = [];

    foreach ($tasks as $task) {
        $events[] = [
            'id' => $task->id,
            'title' => $task->name,
            'start' => $task->due_date->toDateString(),
            'description' => $task->description,
            'status' => $task->status,
            'due_date' => $task->due_date->toDateString(),
            'priority' => $task->priority,
            'points' => $task->points,
            'assignedTo' => $task->assignments->pluck('name')->implode(', ') ?? 'N/A', // Display all assigned users
            'type' => $task->team_id ? 'Team Task from ' . $task->team->name : 'Personal Task',
            'checklist' => $task->checklists->map(function ($checklist) {
                return [
                    'item' => $checklist->item,
                    'completed' => $checklist->completed, 
                ];
            }),
            'attachments' => $task->attachments->map(function ($attachment) {
                return [
                    'file_path' => $attachment->file_path,
                ];
            }),
            'url' => route('user.tasks.show', $task->id),
        ];
    }

    // Return the events as JSON for FullCalendar
    return response()->json($events);
}





public function updateDueDate(Request $request, $id)
{
    $request->validate([
        'due_date' => 'required|date',
    ]);

    $task = Task::findOrFail($id);

    if (Auth::user()->usertype != 'admin' && $task->user_id != Auth::id()) {
        return response()->json(['message' => 'Unauthorized'], 403);
    }

    $task->due_date = $request->due_date;
    $task->save();

    return response()->json(['status' => 'success', 'message' => 'Due date updated successfully']);
}


public function storeFromCalendar(Request $request)
{
    try {
        // Validate the incoming request data
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'due_date' => 'required|date',
            'priority' => 'required|string|in:low,medium,high',
            'attachments.*' => 'nullable|file|max:2048',
            'checklists' => 'nullable|array',  
            'checklists.*' => 'nullable|string',  
        ]);

        // Create a new task
        $task = new Task();
        $task->name = $validatedData['name'];
        $task->description = $validatedData['description'] ?? '';
        $task->due_date = $validatedData['due_date'];
        $task->user_id = Auth::id();
        $task->status = 'not started';
        $task->priority = $validatedData['priority'];
        $task->save();

        // Handle checklist items if provided
        if ($request->has('checklists')) {
            $checklistItems = array_filter($request->checklists); // Filter out empty checklist items
            foreach ($checklistItems as $checklistItem) {
                if (!empty($checklistItem)) {
                    $task->checklists()->create(['item' => $checklistItem]);
                }
            }
        }

        // Handle file uploads if provided
        if ($request->hasFile('attachments')) {
            foreach ($request->file('attachments') as $file) {
                $filename = $file->getClientOriginalName();
                $path = $file->storeAs('attachments', $filename, 'public');
                $task->attachments()->create(['file_path' => $path]);
            }
        }

        return response()->json(['status' => 'success', 'task' => $task]);

    } catch (\Exception $e) {
        return response()->json(['status' => 'error', 'message' => $e->getMessage()], 500);
    }
}

    public function create()
    {
        return view('tasks.create');
    }

    public function store(Request $request)
{
    $request->validate([
        'name' => 'required|string|max:255',
        'priority' => 'required|string',
        'description' => 'nullable|string',
        'due_date' => 'required|date',
        'attachments.*' => 'nullable|file|mimes:pdf,jpg,jpeg,png,gif,xlsx,xls,doc,docx|max:2048',
        'checklists' => 'nullable|array',
        'checklists.*' => 'nullable|string|max:255',
    ], [
        'attachments.*.mimes' => 'Only PDF, JPG, JPEG, PNG, GIF, Excel, and Word files are allowed as attachments.',
        'attachments.*.max' => 'Each attachment must not exceed 2MB in size.',
    ]);

    try {
        // Create the task
        $task = new Task();
        $task->user_id = Auth::id();
        $task->name = $request->name;
        $task->priority = $request->priority;
        $task->description = $request->description;
        $task->status = 'not started';
        $task->due_date = $request->due_date;
        $task->save();

        // Handle checklists
        if ($request->has('checklists')) {
            foreach ($request->checklists as $item) {
                if (!empty($item)) {
                    $task->checklists()->create(['item' => $item]);
                }
            }
        }

        // Handle file attachments with additional MIME type verification
        if ($request->hasFile('attachments')) {
            foreach ($request->file('attachments') as $file) {
                // Open file and verify MIME type using finfo
                $finfo = new \finfo(FILEINFO_MIME_TYPE);
                $mimeType = $finfo->file($file->getPathname());

                // Check if MIME type matches allowed types
                $allowedMimeTypes = ['application/pdf', 'image/jpeg', 'image/png', 'image/gif', 'application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'];

                if (!in_array($mimeType, $allowedMimeTypes)) {
                    return redirect()->back()->with('error', 'Invalid file type detected. Please upload only valid file types.');
                }

                $filename = $file->getClientOriginalName();
                $path = $file->storeAs('attachments', $filename, 'public');
                $task->attachments()->create(['file_path' => $path]);
            }
        }

        // Log activity
        activity()
            ->causedBy(Auth::user())
            ->performedOn($task)
            ->withProperties(['name' => $task->name])
            ->log('Created a task: ' . $task->name);

        // Broadcast the TaskCreated event
        broadcast(new TaskCreated($task))->toOthers();

        // Return with success message
        return redirect()->route('user.tasks.index')->with('success', 'Task ' . $task->name . ' created successfully!');

    } catch (\Exception $e) {
        // Log the error for debugging
        \Log::error('Task creation failed: ' . $e->getMessage());

        // Return with an error flash message
        return redirect()->back()->with('error', 'There was an error creating the task. Please try again.');
    }
}

    

   public function edit($id)
{
    $task = Task::findOrFail($id);
    $team = $task->team;
    $users = $team ? $team->members : User::all(); // Fetch all team members or all users

    // Check authorization
    if (!Auth::user()->can('edit', $task)) {
        abort(403, 'Unauthorized action.');
    }

    return view('tasks.edit', compact('task', 'users'));
}


  public function update(Request $request, $id)
{
    $task = Task::findOrFail($id);

    // Check if the task is rejected and requires resubmission
    if ($task->approval_status === 'rejected' && !$task->resubmit_for_approval) {
        return redirect()->back()->with('error', 'You must resubmit this task for approval before changing its status.');
    }

    // Restrict updates if the task is approved or graded
    if ($task->approval_status === 'approved' || $task->is_graded || $task->status === 'done') {
        return redirect()->back()->with('error', 'This task has been approved and/or graded, and can no longer be updated.');
    }

    // Validate request data
    $request->validate([
        'name' => 'sometimes|required|string|max:255',
        'priority' => 'sometimes|required|string',
        'description' => 'nullable|string',
        'status' => 'required|string',
        'due_date' => 'sometimes|required|date',
        'attachments.*' => 'nullable|file|mimes:pdf,jpg,jpeg,png,gif,xlsx,xls,doc,docx|max:2048',
        'assignee' => 'sometimes|exists:users,id',
    ], [
        'attachments.*.mimes' => 'Only PDF, JPG, JPEG, PNG, GIF, Excel, and Word files are allowed as attachments.',
        'attachments.*.max' => 'Each attachment must not exceed 2MB in size.',
    ]);

    // Authorization: Check if the user is admin, team creator, assigned user, or task owner
    $isAssignedUser = $task->assignments->contains(Auth::id());
    $isAdminOrCreator = Auth::user()->usertype == 'admin' || ($task->team && Auth::id() == $task->team->creator_id);
    $isTaskOwner = $task->user_id == Auth::id();

    if ($isAdminOrCreator || $isAssignedUser || $isTaskOwner) {
        if ($request->has('assignee') && $isAdminOrCreator) {
            $task->user_id = $request->assignee;
        }
        if ($request->has('name')) {
            $task->name = $request->name;
        }
        if ($request->has('priority')) {
            $task->priority = $request->priority;
        }
        if ($request->has('due_date')) {
            $task->due_date = $request->due_date;
        }
    } else {
        return redirect()->back()->with('error', 'Unauthorized to update this task.');
    }

    if ($request->has('description')) {
        $task->description = $request->description;
    }

    // Update status and dates
    if ($request->status == 'in progress' && !$task->date_started) {
        $task->date_started = now();
    }

    if ($request->status == 'done' && !$task->date_completed) {
        $task->date_completed = now();
        if ($task->team) {
            $task->approval_status = 'pending';
        }
        if ($task->date_started) {
            $task->duration = $task->date_started->diffForHumans($task->date_completed, true);
        }
        // Reset the resubmit flag when submitted for approval
        $task->resubmit_for_approval = false;
    } elseif ($request->status != 'done') {
        $task->date_completed = null;
        $task->duration = null;
    }

    // Save the task and log changes
    $originalStatus = $task->getOriginal('status');
    $task->status = $request->status;
    $task->save();

    if ($request->hasFile('attachments')) {
        foreach ($request->file('attachments') as $file) {
            // Validate the actual file MIME type
            if (!in_array($file->getMimeType(), ['application/pdf', 'image/jpeg', 'image/png', 'image/gif', 'application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'])) {
                return redirect()->back()->with('error', 'One or more attachments have an unsupported file type.');
            }

            $filename = $file->getClientOriginalName();
            $path = $file->storeAs('attachments', $filename, 'public');
            $task->attachments()->create(['file_path' => $path]);
        }
    }

    // Log changes
    $changes = [];
    if ($task->wasChanged('name')) {
        $changes[] = "Task name changed from '{$task->getOriginal('name')}' to '{$task->name}'";
    }
    if ($task->wasChanged('priority')) {
        $changes[] = "Priority changed from '{$task->getOriginal('priority')}' to '{$task->priority}'";
    }
    if ($task->wasChanged('due_date')) {
        $changes[] = "Due date changed from '{$task->getOriginal('due_date')}' to '{$task->due_date}'";
    }
    if ($originalStatus !== $task->status) {
        $changes[] = "Status changed from '{$originalStatus}' to '{$task->status}'";
    }
    if ($task->wasChanged('description')) {
        $changes[] = "Description updated";
    }

    if (!empty($changes)) {
        activity()
            ->causedBy(Auth::user())
            ->performedOn($task)
            ->withProperties(['changes' => $changes])
            ->log('Updated task: ' . $task->name . ' with changes: ' . implode(', ', $changes));
    }

    if ($originalStatus !== $task->status && $task->team && $task->team->creator) {
        $teamLeader = $task->team->creator;
        $teamLeader->notify(new TaskProgressUpdated($task));
    }

    $redirectRoute = $task->team ? route('user.teams.show', $task->team_id) : route('user.tasks.index');

    return redirect($redirectRoute)->with('success', 'Task updated successfully.');
}





    

public function destroy($id)
{
    $task = Task::findOrFail($id);
    $user = Auth::user();

    // Check if the user is authorized to delete the task
    $isAdmin = $user->usertype == 'admin';
    $isTaskCreator = $task->user_id == $user->id;
    $isTeamLeader = $task->team && $task->team->creator_id == $user->id;

    // Only allow deletion if the user is an admin, task creator, or team leader
    if ($isAdmin || $isTaskCreator || $isTeamLeader) {
        activity()
            ->causedBy($user)
            ->performedOn($task)
            ->withProperties(['name' => $task->name, 'description' => $task->description])
            ->log('Task deleted: ' . $task->name);

        $task->delete();
        return response()->json(['success' => 'Task deleted successfully']);
    }

    // Unauthorized action
    return response()->json(['error' => 'Unauthorized action.'], 403);
}



public function show($id)
{
    $task = Task::findOrFail($id);

    // Check authorization
    if (Auth::user()->usertype != 'admin' && $task->user_id != Auth::id()) {
        if (!$task->team || !$task->team->members->contains(Auth::id())) {
            return redirect('/dashboard')->with('error', 'Unauthorized access to this task.');
        }
    }

    // Fetch only team members if the task belongs to a team, otherwise fetch the task owner
    $users = $task->team ? $task->team->members : collect([$task->user]);

    return response()
        ->view('tasks.show', compact('task', 'users'))
        ->header('Cache-Control', 'no-store, no-cache, must-revalidate, max-age=0')
        ->header('Pragma', 'no-cache')
        ->header('Expires', 'Sat, 01 Jan 2000 00:00:00 GMT');
}







public function updateStatus(Request $request, $id)
{
    $request->validate([
        'status' => 'required|string',
    ]);

    $task = Task::findOrFail($id);
    $user = Auth::user();

    // Restrict status updates based on task type
    if ($task->team) {
        // Team Task: Restrict updates if the task is approved or graded
        if ($task->approval_status === 'approved' || $task->is_graded) {
            return response()->json(['error' => 'This team task has been approved and/or graded, and its status can no longer be updated.'], 403);
        }
    } else {
        // Personal Task: Restrict updates if the task is marked as "done"
        if ($task->status === 'done') {
            return response()->json(['error' => 'This personal task is marked as done and can no longer be updated.'], 403);
        }
    }
    
    if ($task->approval_status === 'rejected' && !$task->resubmit_for_approval) {
    return response()->json(['error' => 'You must resubmit this task for approval before changing its status.'], 403);
}

    // Authorization: Allow if user is admin, task owner, team creator, or assigned user
    $isOwner = $task->user_id == $user->id;
    $isAssignedUser = $task->assignments->contains($user->id);
    $isAdminOrCreator = $user->usertype == 'admin' || ($task->team && $task->team->creator_id == $user->id);

    if (!$isAdminOrCreator && !$isOwner && !$isAssignedUser) {
        \Log::warning('Unauthorized attempt to update task status by User ID: ' . $user->id);
        return response()->json(['error' => 'Unauthorized action.'], 403);
    }

    // Capture the original status before the update
    $originalStatus = $task->getOriginal('status');

    // Update task status logic based on status type
    if ($request->status == 'in progress' && !$task->date_started) {
        $task->date_started = now();  // Record the start time when the task moves to "in progress"
    } elseif ($request->status == 'done' && !$task->date_completed) {
        $task->date_completed = now();  // Record the completion time when the task moves to "done"

        // Calculate the duration if the task has a start date
        if ($task->date_started) {
            $task->duration = $task->date_started->diffForHumans($task->date_completed, true);  // Human-readable duration
        }

        // Check if the task was previously rejected, and reset approval status
        if ($task->team && $task->approval_status === 'rejected') {
            $task->approval_status = 'pending';
            $task->rejection_remarks = null;  // Clear rejection remarks
        } elseif ($task->team) {
            // Set approval status to pending for team leaders to review (only for team tasks)
            $task->approval_status = 'pending';
        }

        // Automatically trigger reward logic upon task completion
        $rewardService = new RewardService();
        $rewardService->handleTaskCompletionRewards($task->user);  // Call the reward service
    } elseif ($request->status == 'not started') {
        // Reset start and completion dates if moving back to "not started"
        $task->date_started = null;
        $task->date_completed = null;
        $task->duration = null;
    }

    // Save the new status
    $task->status = $request->status;
    if (!$task->save()) {
        \Log::error("Failed to save updated status for Task ID: {$task->id}");
        return response()->json(['error' => 'Failed to update task status.'], 500);
    }

    // Capture changes in the status and log the meaningful change
    $changes = [];
    if ($originalStatus !== $task->status) {
        $changes[] = "Status changed from '{$originalStatus}' to '{$task->status}'";
    }

    // Log the activity with detailed changes
    if (!empty($changes)) {
        activity()
            ->causedBy($user)
            ->performedOn($task)
            ->withProperties(['changes' => $changes])
            ->log('Updated task: ' . $task->name . ' with changes: ' . implode(', ', $changes));
    }

    // Notify the team leader about the task status update if it's part of a team
    if ($task->team && $task->team->creator) {
        $teamLeader = $task->team->creator;
        $teamLeader->notify(new TaskProgressUpdated($task));  // Send the notification
    }

    // Return the updated data for the front-end
    return response()->json([
        'success' => true,
        'message' => 'Task status updated successfully.',
        'data' => [
            'date_started' => $task->date_started ? $task->date_started->format('Y-m-d H:i:s') : null,
            'duration' => $task->duration ?? 'N/A',
            'status' => ucfirst($task->status),
            'approval_status' => ucfirst($task->approval_status) // For displaying in UI
        ]
    ]);
}

public function resubmitForApproval($id)
{
    $task = Task::findOrFail($id);
    $user = Auth::user();

    // Authorization: Only allow if user is admin, task creator, or assigned user
    $isOwner = $task->user_id == $user->id;
    $isAssignedUser = $task->assignments->contains($user->id);
    $isAdminOrCreator = $user->usertype == 'admin' || ($task->team && $task->team->creator_id == $user->id);

    if (!$isAdminOrCreator && !$isOwner && !$isAssignedUser) {
        abort(403, 'Unauthorized action.');
    }

    // Check if the task is currently in a rejected state
    if ($task->approval_status !== 'rejected') {
        return redirect()->back()->with('error', 'This task is not in a rejected state and cannot be resubmitted.');
    }

    // Reset approval status, clear rejection remarks, and set resubmit flag
    $task->approval_status = 'pending';
    $task->rejection_remarks = null;
    $task->resubmit_for_approval = true;
    
    if (!$task->save()) {
        \Log::error("Failed to resubmit Task ID {$task->id} for approval.");
        return redirect()->back()->with('error', 'There was an issue resubmitting the task for approval. Please try again.');
    }
    // Notify the team leader
    if ($task->team && $task->team->creator) {
        $teamLeader = $task->team->creator;
        $teamLeader->notify(new TaskResubmittedNotification($task));
    }

    // Log the activity for tracking
    activity()
        ->causedBy($user)
        ->performedOn($task)
        ->withProperties(['approval_status' => 'pending'])
        ->log('Resubmitted task for approval: ' . $task->name);
        
        

    return redirect()->route('user.tasks.show', $task->id)->with('success', 'Task resubmitted for approval successfully.');
}


  public function downloadAttachment($id, $attachmentId)
{
    $task = Task::findOrFail($id);
    $attachment = TaskAttachment::findOrFail($attachmentId);
    $user = Auth::user();

    // Check if the user is authorized to download the attachment
    $isAssignedUser = $task->assignments->contains($user->id);
    $isAdminOrCreatorOrTeamMember = $user->usertype == 'admin' || 
                                    $task->user_id == $user->id || 
                                    ($task->team && $task->team->creator_id == $user->id) ||
                                    ($task->team && $task->team->members->contains($user));

    if (!$isAdminOrCreatorOrTeamMember && !$isAssignedUser) {
        abort(403, 'Unauthorized action.');
    }

    if (!$attachment) {
        abort(404);
    }

    return Storage::disk('public')->download($attachment->file_path);
}



public function removeAttachment($id, $attachmentId)
{
    $task = Task::findOrFail($id);
    $attachment = TaskAttachment::findOrFail($attachmentId);
    $user = Auth::user();

    // Restrict attachment deletion if the task is marked as done
    if ($task->status === 'done') {
        return redirect()->route('user.tasks.show', $task->id)
            ->with('error', 'This task is marked as done, and attachments can no longer be removed.');
    }

    // Check if the user is authorized to remove the attachment
    $isTaskCreator = $task->user_id == $user->id;
    $isAssignedUser = $task->assignments->contains($user->id); // Check if the user is assigned to the task
    $isAdminOrTeamLeader = $user->usertype == 'admin' || ($task->team && $task->team->creator_id == $user->id);

    if (!$isAdminOrTeamLeader && !$isTaskCreator && !$isAssignedUser) {
        abort(403, 'Unauthorized action.');
    }

    Storage::disk('public')->delete($attachment->file_path);
    $attachment->delete();

    return redirect()->route('user.tasks.show', $task->id)->with('success', 'Attachment removed successfully.');
}



public function addChecklistItem(Request $request, $taskId)
{
    $request->validate([
        'item' => 'required|string|max:255',
    ]);

    $task = Task::findOrFail($taskId);
    $user = Auth::user();

    // Restrict adding checklist items if the task is approved, graded, or marked as done
    if ($task->approval_status === 'approved' || $task->is_graded || $task->status === 'done') {
        return redirect()->back()->with('error', 'This task has been approved, graded, or marked as done, and checklist items can no longer be added.');
    }

    // Check if the user is the task creator, assigned user, admin, or team leader
    $isTaskCreator = $task->user_id == $user->id;
    $isAssignedUser = $task->assignments->contains($user->id);
    $isAdminOrTeamLeader = $user->usertype == 'admin' || ($task->team && $task->team->creator_id == $user->id);

    if (!$isAdminOrTeamLeader && !$isTaskCreator && !$isAssignedUser) {
        abort(403, 'Unauthorized action.');
    }

    // Create the checklist item with the current user's ID as `created_by`
    $task->checklists()->create([
        'item' => $request->item,
        'created_by' => $user->id, // Store the ID of the user adding the checklist item
    ]);

    return redirect()->route('user.tasks.show', $taskId)->with('success', 'Checklist item added successfully.');
}


public function updateChecklistItem(Request $request, $taskId, $checklistId)
{
    try {
        // Validate the input
        $request->validate([
            'is_completed' => 'nullable|boolean',
            'item' => 'nullable|string|max:255',
        ]);

        // Find the checklist item and ensure it belongs to the specified task
        $checklist = Checklist::where('task_id', $taskId)->findOrFail($checklistId);
        $task = $checklist->task;
        $user = Auth::user();

        // Restrict updates if the task is approved or marked as done
        if ($task->approval_status === 'approved' || $task->status === 'done') {
            return response()->json(['success' => false, 'message' => 'This task is marked as done or has been approved, and checklist items can no longer be updated.'], 403);
        }

        // Check if the user is authorized to update the checklist item
        $isTaskCreator = $task->user_id == $user->id;
        $isAssignedUser = $task->assignments->contains($user->id);
        $isAdminOrTeamLeader = $user->usertype == 'admin' || ($task->team && optional($task->team)->creator_id == $user->id);

        if (!$isAdminOrTeamLeader && !$isTaskCreator && !$isAssignedUser) {
            return response()->json(['success' => false, 'message' => 'Unauthorized action.'], 403);
        }

        // Proceed to update the checklist item
        $updateData = array_filter([
            'is_completed' => $request->is_completed,
            'item' => $request->item,
        ], function ($value) {
            return !is_null($value);
        });

        $checklist->update($updateData);

        return response()->json(['success' => true, 'message' => 'Checklist item updated successfully.']);

    } catch (\Exception $e) {
        \Log::error("Error updating checklist item ID: {$checklistId} in task ID: {$taskId}: " . $e->getMessage());
        return response()->json(['success' => false, 'message' => 'Failed to update the checklist item.'], 500);
    }
}



  public function deleteChecklistItem($taskId, $checklistId)
{
    $checklist = Checklist::where('task_id', $taskId)->findOrFail($checklistId);
    $task = $checklist->task;
    $user = Auth::user();

    // Restrict deletion if the task is approved or marked as done
    if ($task->approval_status === 'approved' || $task->status === 'done') {
        return redirect()->route('user.tasks.show', $taskId)
                         ->with('error', 'This task is marked as done or has been approved, and checklist items can no longer be deleted.');
    }

    // Check if the user is authorized to delete the checklist item
    $isAssignedUser = $task->assignments->contains($user->id);
    $isAdminOrCreator = $user->usertype == 'admin' || ($task->user_id == $user->id) || ($task->team && $task->team->creator_id == $user->id);

    if (!$isAdminOrCreator && !$isAssignedUser) {
        return redirect()->route('user.tasks.show', $taskId)->with('error', 'Unauthorized action.');
    }

    $checklist->delete();

    return redirect()->route('user.tasks.show', $taskId)->with('success', 'Checklist item deleted successfully.');
}



  public function storeForTeam(Request $request, $teamId)
{
    $team = Team::findOrFail($teamId);

    // Check if the user is the team creator or an admin
    if (Auth::user()->usertype != 'admin' && Auth::id() != $team->creator_id) {
        return redirect()->route('teams.show', $teamId)->with('error', 'Unauthorized to assign tasks to this team.');
    }

    // Validate the request
    $request->validate([
        'name' => 'required|string|max:255',
        'priority' => 'required|string',
        'description' => 'nullable|string',
        'due_date' => 'required|date',
        'attachments.*' => 'nullable|file|max:2048',
        'checklists' => 'nullable|array',
        'checklists.*' => 'nullable|string|max:255',
        'assignees' => 'required|array',  // Array of selected user IDs
        'assignees.*' => 'exists:users,id'  // Ensure each assignee exists in the users table
    ]);

    // Create a new task with a default user_id for the creator
    $task = new Task();
    $task->user_id = Auth::id();  // Set the task creator as the default user
    $task->name = $request->name;
    $task->priority = $request->priority;
    $task->description = $request->description;
    $task->status = 'not started';  // Set the initial status to "Not Started"
    $task->due_date = $request->due_date;
    $task->team_id = $teamId;
    $task->save();

    // Assign multiple users to the task
    $task->assignments()->sync($request->assignees);

    // Handle checklists
    if ($request->has('checklists')) {
        foreach ($request->checklists as $item) {
            if (!empty($item)) {
                $task->checklists()->create(['item' => $item]);
            }
        }
    }

    // Handle attachments
    if ($request->hasFile('attachments')) {
        foreach ($request->file('attachments') as $file) {
            $filename = $file->getClientOriginalName();
            $path = $file->storeAs('attachments', $filename, 'public');
            $task->attachments()->create(['file_path' => $path]);
        }
    }

    // Notify each assigned user
    foreach ($request->assignees as $userId) {
        $user = User::find($userId);
        $user->notify(new TaskAssigned($task));
    }

    return redirect()->route('user.teams.show', $teamId)->with('success', 'Task created and assigned to selected members successfully.');
}

    
 public function grade(Request $request, $id)
{
    $task = Task::findOrFail($id);
    $team = $task->team;

    $isAdminOrCreator = Auth::user()->usertype == 'admin' || ($team && Auth::id() == $team->creator_id);

    if (!$team || !$team->has_rewards) {
        return redirect()->route('user.teams.show', $task->team_id)->with('error', 'Grading is not allowed for teams without points and rewards.');
    }

    if ($task->is_graded) {
        return redirect()->route('user.teams.show', $task->team_id)->with('error', 'This task has already been graded.');
    }

    if ($isAdminOrCreator && $task->approval_status == 'approved') {
        $request->validate([
            'grade' => 'required|string|in:good,very good,excellent',
        ]);

        $totalPoints = match ($request->grade) {
            'excellent' => 50,
            'very good' => 30,
            'good' => 10,
            default => 0,
        };

        // Calculate points per user by dividing total points among all assigned users
        $assignedUsersCount = $task->assignments->count();
        $pointsPerUser = $assignedUsersCount > 0 ? floor($totalPoints / $assignedUsersCount) : 0;

        // Update task details
        $task->points += $totalPoints;
        $task->grade = $request->grade;
        $task->is_graded = true;
        $task->save();

        // Distribute points to each assigned user
        foreach ($task->assignments as $assignedUser) {
            // Update total_points in the team_members table for each assigned user in this team
            DB::table('team_members')
                ->where('team_id', $task->team_id)
                ->where('user_id', $assignedUser->id)
                ->increment('total_points', $pointsPerUser);

            // Log each grading action for each assigned user
            activity()
                ->causedBy(Auth::user())
                ->performedOn($task)
                ->withProperties([
                    'task_name' => $task->name,
                    'grade' => $request->grade,
                    'points' => $pointsPerUser,
                    'user' => $assignedUser->name,
                ])
                ->log("Task graded: {$task->name} as {$request->grade} for {$assignedUser->name}");
        }

        return redirect()->route('user.teams.show', $task->team_id)->with('success', 'Task graded successfully and points distributed among assigned users.');
    }

    return redirect()->route('user.teams.show', $task->team_id)->with('error', 'Unauthorized to grade this task.');
}


    


public function approveOrReject(Request $request, $id)
{
    $task = Task::with('assignments')->findOrFail($id);
    $team = $task->team;
    $user = Auth::user();
    $isAdminOrCreator = $user->usertype == 'admin' || ($team && $user->id == $team->creator_id);

    if (!$isAdminOrCreator) {
        abort(403, 'Unauthorized action.');
    }

    $request->validate([
        'approval_status' => 'required|string|in:approved,rejected',
        'rejection_remarks' => 'nullable|string',
    ]);

    // Logging original assignments for debugging
    \Log::info("Task {$task->id} original assignments: " . $task->assignments->pluck('id'));

    // Update the task's approval status
    $task->approval_status = $request->approval_status;

    if ($task->approval_status === 'approved' && $team->has_rewards) {
        $totalPoints = $task->calculatePoints();
        $assignedUsersCount = $task->assignments->count();

        if ($assignedUsersCount > 0) {
            $pointsPerUser = $totalPoints / $assignedUsersCount;

            foreach ($task->assignments as $assignedUser) {
                $this->teamService->awardXPForTaskCompletion($assignedUser->id, $task, $pointsPerUser);

                DB::table('team_members')
                    ->where('team_id', $task->team_id)
                    ->where('user_id', $assignedUser->id)
                    ->increment('total_points', $pointsPerUser);

                // Logging awarded points and assignee for debugging
                \Log::info("Awarded {$pointsPerUser} points to user {$assignedUser->id} for task {$task->id}");
            }
        }
        // Notify all assigned users of the approval
        Notification::send($task->assignments, new TaskApprovedNotification($task));

    } elseif ($task->approval_status === 'rejected') {
        // Set task status back to 'in progress' if rejected
        $task->status = 'in progress';
        $task->rejection_remarks = $request->rejection_remarks;
        $task->resubmit_for_approval = false; // Ensure resubmission is required before further updates

       // Send rejection notification
            Notification::send($task->assignments, new TaskRejectedNotification($task, $request->rejection_remarks));
        }
    
    
    $task->save();

    activity()
        ->causedBy($user)
        ->performedOn($task)
        ->withProperties([
            'task_name' => $task->name,
            'approval_status' => $task->approval_status,
            'rejection_remarks' => $request->rejection_remarks ?? null
        ])
        ->log('Task ' . $task->approval_status . ': ' . $task->name);

    // Logging final assignments for debugging
    \Log::info("Task {$task->id} final assignments after approval: " . $task->assignments->pluck('id'));

    return redirect()->route('user.teams.show', $task->team_id)->with('success', 'Task approval status updated successfully.');
}





    public function fetchTasksByPriorityStatus()
{
    $tasks = Task::where('user_id', Auth::id()) // Fetch only user's tasks
        ->get()
        ->groupBy(function($task) {
            if ($task->priority == 'high' && ($task->status == 'not started' || $task->status == 'in progress')) {
                return 'do-first';
            } elseif ($task->priority == 'medium' && ($task->status == 'not started' || $task->status == 'in progress')) {
                return 'schedule';
            } elseif ($task->priority == 'high' && $task->status == 'done') {
                return 'delegate';
            } elseif ($task->priority == 'low' && ($task->status == 'in progress' || $task->status == 'done')) {
                return 'delegate';
            } else {
                return 'eliminate';
            }
        });

    return response()->json($tasks);
}

    public function updateTaskCategory(Request $request, Task $task)
    {
        // Validate that the input has valid priority and status values
        $validatedData = $request->validate([
            'priority' => 'required|in:low,medium,high',
            'status' => 'required|in:not started,in progress,done',
        ]);
    
        // Update the task's priority and status
        $task->priority = $validatedData['priority'];
        $task->status = $validatedData['status'];
        $task->save();
    
        return response()->json(['success' => true, 'message' => 'Task updated successfully.']);
    }
    

}
