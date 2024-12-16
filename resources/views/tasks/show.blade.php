<x-app-layout>
    <x-slot name="header">
    <div class="d-flex justify-content-between align-items-center">
    <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                {{ __('Task Details') }}
            </h2>
            <!-- Back Button aligned with Task Details text -->
            <a href="javascript:void(0);" id="task-details-back-btn" onclick="history.back();" class="btn btn-danger btn-sm">
                <i class="fas fa-arrow-left"></i> Back
            </a>
        </div>
    </x-slot>
    
<style>
    .assigned-to {
    display: flex;
    align-items: center; /* Vertically center align */
}

.assigned-to img {
    vertical-align: middle; /* Ensure the image is aligned */
    margin-right: 8px; /* Space between image and text */
}

.button-group a,
.button-group button {
    min-width: 100px; /* Ensures buttons have a consistent width */
    text-align: center;
}

.list-group-item {
    border: none;
    background-color: #f9f9f9; /* Light background for a cleaner look */
    padding: 15px;
    border-radius: 8px;
}

.button-group {
    gap: 10px;
}




</style>
@if(session('error'))
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        {{ session('error') }}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
@endif

@if(session('success'))
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        {{ session('success') }}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
@endif
    <div class="py-12">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card shadow mb-4">
                         @if(session('error'))
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        {{ session('error') }}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
@endif

                        <!-- Header Section with Task Title and Edit Button (aligned to the far right) -->
                        <div class="card-header py-3 d-flex justify-content-between align-items-center">
                            <h6 id="task-header-title" class="m-0 font-weight-bold text-primary">Task Details</h6>
                            <div class="ml-auto"> <!-- Added ml-auto to push button to far right -->
  <!-- Edit Button -->
@if(Auth::user()->usertype == 'admin' || Auth::id() == $task->user_id || ($task->team && Auth::id() == $task->team->creator_id) || $task->assignments->contains(Auth::id()))

    <!-- Conditional Checks for Team and Personal Tasks -->
    @if(($task->team && $task->approval_status !== 'approved') || (!$task->team && $task->status !== 'done'))
        <!-- If it's a team task that isn't approved, or a personal task that isn't done -->
        <button id="edit-task-btn" class="btn btn-sm btn-primary">
            <i class="fas fa-edit"></i> Edit
        </button>
    @else
        <!-- Display a disabled button if edits are not allowed -->
        <button id="edit-task-btn" class="btn btn-sm btn-primary" disabled>
            <i class="fas fa-edit"></i> Edit
        </button>
    @endif
@endif
</div>            </div>

                        <div class="card-body">
                            <!-- Approval Status Label -->
    @if($task->team && $task->approval_status === 'approved')
        <div class="alert alert-info" role="alert">
            <strong>Notice:</strong> This team task is approved and available for viewing only.
        </div>
    @elseif(!$task->team && $task->status === 'done')
        <div class="alert alert-info" role="alert">
            <strong>Notice:</strong> This personal task is marked as done and can no longer be updated.
        </div>
        
         @elseif($task->team && $task->approval_status === 'rejected')
        <div class="alert alert-warning" role="alert">
            <strong>Task Rejected:</strong> {{ $task->rejection_remarks }}
        </div>
    @endif
    
                            <div id="task-details">
<!-- New line to indicate if the task is personal or team-based -->
        <p><strong>Type:</strong> 
            @if ($task->team_id)
                Team Task from {{ $task->team->name }}
            @else
                @if (Auth::user()->usertype == 'admin')
                    Personal Task created by {{ $task->user->name }}
                @else
                    Your Personal Task
                @endif
            @endif
        </p>                      <p><strong>Name:</strong> {{ $task->name }}</p>
                                          <!-- Only display "Assigned To" for team tasks -->
        @if ($task->assignments->isNotEmpty())
            <p><strong>Assigned To:</strong></p>
            <ul class="list-group">
                @foreach ($task->assignments as $assignedUser)
                    <li class="list-group-item d-flex align-items-center">
                        <img src="{{ $assignedUser->profile_photo_url }}" 
                             alt="Profile Photo" 
                             class="rounded-circle" 
                             style="width: 25px; height: 25px; object-fit: cover; margin-right: 8px;">
                        <span>{{ $assignedUser->name }}</span>
                    </li>
                @endforeach
            </ul>
        @else
            <p><strong>Assigned To:</strong> Not assigned</p>
        @endif



                                <p><strong>Priority:</strong> {{ ucfirst($task->priority) }}</p>
                                  <!-- Status Update Section -->
                               <form id="task-status-form" method="POST" action="{{ route('user.tasks.updateStatus', $task->id) }}">
    @csrf
    @method('PATCH')
    
    <div class="form-group">
        <label for="status">Status</label>
        <select name="status" id="status" class="form-control" required>
            <option value="not started" {{ $task->status == 'not started' ? 'selected' : '' }}>Not Started</option>
            <option value="in progress" {{ $task->status == 'in progress' ? 'selected' : '' }}>In Progress</option>
            <option value="done" {{ $task->status == 'done' ? 'selected' : '' }}>Done</option>
        </select>
    </div>
    
    <button type="submit" class="btn btn-primary">Update Status</button>
</form>
@if($task->team)
    <div class="alert alert-warning mt-3" role="alert" style="margin-top: 10px;">
        <strong>Note:</strong> For team tasks, once you mark this task as "Done," it will be pending for approval. You can continue to edit or update it until it is either approved or rejected.
    </div>
@else
    <div class="alert alert-info mt-3" role="alert" style="margin-top: 10px;">
        <strong>Note:</strong> For personal tasks, once you mark this task as "Done," further edits or updates will no longer be possible.
    </div>
@endif



                                <p><strong>Due Date:</strong> {{ \Carbon\Carbon::parse($task->due_date)->format('M d, Y') }}</p>
                                <p><strong>Date Started:</strong> {{ $task->date_started ? \Carbon\Carbon::parse($task->date_started)->format('Y-m-d') : 'N/A' }}</p>
                                <p><strong>Description:</strong> {{ $task->description }}</p>
                                @if ($task->status == 'done')
                                    <p><strong>Duration:</strong> {{ $task->duration ?? 'N/A' }}</p>
                                @endif


                       <!-- Checklist Section -->
<h6 class="font-weight-bold">Checklist:</h6>

<!-- Add Checklist Form (Visible only to admins, team leaders for team tasks, and users for personal tasks) -->
@if(Auth::user()->usertype == 'admin' || Auth::id() == $task->user_id || ($task->team && Auth::id() == $task->team->creator_id))
    <form method="POST" action="{{ route('user.tasks.addChecklistItem', $task->id) }}">
        @csrf
        <div class="input-group mb-3">
            <input type="text" name="item" class="form-control" placeholder="Add a checklist item" required>
            <div class="input-group-append">
                <button class="btn btn-primary" type="submit">Add</button>
            </div>
        </div>
    </form>
@endif

<ul class="list-group mb-3">
    @foreach ($task->checklists as $checklist)
        <li class="list-group-item d-flex justify-content-between align-items-center">
            <!-- Checklist Item -->
            <div id="checklist-view-{{ $checklist->id }}" style="display: block;">
                <!-- Checkbox for marking completion (all users involved in the task can check/uncheck) -->
                <input type="checkbox" class="form-check-input me-2"
                       onchange="updateChecklistItem({{ $task->id }}, {{ $checklist->id }}, this)"
                       {{ $checklist->is_completed ? 'checked' : '' }}
                       @if($task->approval_status === 'approved' || !(
                           Auth::user()->usertype == 'admin' || 
                           Auth::id() == $task->user_id || 
                           ($task->team && Auth::id() == $task->team->creator_id) || 
                           $task->assignments->contains(Auth::id())
                       ))
                           disabled
                       @endif
                >

                <!-- Display Checklist Item Text -->
                <span>{{ $checklist->item }}</span>

                <!-- Edit Button (Visible to checklist creator, team leader, or admin, or task owner for personal tasks) -->
                @if($checklist->created_by == Auth::id() || Auth::user()->usertype == 'admin' || 
                   (!$task->team && Auth::id() == $task->user_id) || 
                   ($task->team && Auth::id() == $task->team->creator_id))
                    <button onclick="toggleEditMode({{ $checklist->id }})" class="btn btn-sm btn-link">Edit</button>
                @endif
            </div>

            <!-- Edit Mode (Visible to checklist creator, team leader, or admin) -->
            <div id="checklist-edit-{{ $checklist->id }}" style="display: none;">
                <input type="text" id="checklist-item-input-{{ $checklist->id }}" class="form-control" value="{{ $checklist->item }}">
                <button onclick="saveChecklistItem({{ $task->id }}, {{ $checklist->id }})" class="btn btn-sm btn-primary">Save</button>
                <button onclick="toggleEditMode({{ $checklist->id }})" class="btn btn-sm btn-secondary">Cancel</button>
            </div>
            
            <!-- Delete Button (Visible to checklist creator, team leader, or admin, or task owner for personal tasks) -->
            @if($checklist->created_by == Auth::id() || Auth::user()->usertype == 'admin' || 
               (!$task->team && Auth::id() == $task->user_id) || 
               ($task->team && Auth::id() == $task->team->creator_id))
                <form method="POST" action="{{ route('user.tasks.deleteChecklistItem', [$task->id, $checklist->id]) }}" style="display: inline;">
                    @csrf
                    @method('DELETE')
                    <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                </form>
            @endif
        </li>
    @endforeach
</ul>



                                <div class="mb-4">
                                    <strong>Progress: </strong>
                                    <div class="progress">
                                        @php
                                            $total = $task->checklists->count();
                                            $completed = $task->checklists->where('is_completed', true)->count();
                                            $percentage = $total > 0 ? ($completed / $total) * 100 : 0;
                                        @endphp
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: {{ $percentage }}%;" aria-valuenow="{{ $percentage }}" aria-valuemin="0" aria-valuemax="100">{{ round($percentage, 2) }}%</div>
                                    </div>
                                </div>

                                <!-- Attachments Section -->
<p><strong>Attachments:</strong></p>
<ul class="list-group">
    @foreach ($task->attachments as $attachment)
        <li class="list-group-item">
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-center">
                <span>{{ basename($attachment->file_path) }}</span>
                <div class="button-group mt-2 mt-md-0 d-flex flex-wrap justify-content-center justify-content-md-end">
                    <a href="{{ route('user.tasks.downloadAttachment', [$task->id, $attachment->id]) }}" class="btn btn-sm btn-success mx-1 my-1">
                        <i class="fas fa-download"></i> Download
                    </a>
                    <a href="{{ Storage::url($attachment->file_path) }}" target="_blank" class="btn btn-sm btn-warning mx-1 my-1">
                        <i class="fas fa-binoculars"></i> Preview
                    </a>
                    @if(Auth::user()->usertype == 'admin' || Auth::id() == $task->user_id || ($task->team && Auth::id() == $task->team->creator_id) || $task->assignments->contains(Auth::id()))
                        <form method="POST" action="{{ route('user.tasks.removeAttachment', [$task->id, $attachment->id]) }}" style="display: inline;">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-sm btn-danger mx-1 my-1">
                                <i class="fas fa-trash"></i> Remove
                            </button>
                        </form>
                    @endif
                </div>
            </div>
        </li>
    @endforeach
</ul>


                            </div>
@if($task->approval_status === 'rejected')
    <form action="{{ route('user.tasks.resubmitForApproval', $task->id) }}" method="POST" style="display: inline;">
        @csrf
        <button type="submit" class="btn btn-warning">Resubmit for Approval</button>
    </form>
@endif
                            <div id="edit-task-form" style="display: none;">
                            


                            <form id="edit-task-form" method="POST" action="{{ route('user.tasks.update', $task->id) }}" enctype="multipart/form-data">
                            
                                    @csrf
                                    @method('PUT')

                                    @php
                                        $isAdminOrCreator = Auth::user()->usertype == 'admin' || ($task->team && Auth::id() == $task->team->creator_id);
                                        $isOwnTask = !$task->team && Auth::id() == $task->user_id;
                                    @endphp

                                    <div class="form-group">
                                        <label for="name">Task Name</label>
                                        <input type="text" name="name" id="name" class="form-control" value="{{ $task->name }}" {{ !$isAdminOrCreator && !$isOwnTask ? 'readonly' : '' }}>
                                    </div>
                                    <div class="form-group">
                                        <label for="priority">Priority</label>
                                        <select name="priority" id="priority" class="form-control" {{ !$isAdminOrCreator && !$isOwnTask ? 'disabled' : '' }}>
                                            <option value="low" {{ $task->priority == 'low' ? 'selected' : '' }}>Low</option>
                                            <option value="medium" {{ $task->priority == 'medium' ? 'selected' : '' }}>Medium</option>
                                            <option value="high" {{ $task->priority == 'high' ? 'selected' : '' }}>High</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="due_date">Due Date</label>
                                        <input type="date" name="due_date" id="due_date" class="form-control" value="{{ $task->due_date ? $task->due_date->format('Y-m-d') : '' }}" {{ !$isAdminOrCreator && !$isOwnTask ? 'readonly' : '' }}>
                                    </div>
                                    <div class="form-group">
        <label for="status">Status</label>
        <select name="status" id="status" class="form-control" required>
            <option value="not started" {{ $task->status == 'not started' ? 'selected' : '' }}>Not Started</option>
            <option value="in progress" {{ $task->status == 'in progress' ? 'selected' : '' }}>In Progress</option>
            <option value="done" {{ $task->status == 'done' ? 'selected' : '' }}>Done</option>
        </select>
    </div>
                                    <div class="form-group">
                                        <label for="description">Description</label>
                                        <textarea name="description" id="description" class="form-control">{{ $task->description }}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="attachments">Attachments</label>
                                        <input type="file" name="attachments[]" id="attachments" class="form-control" multiple>
                                    </div>
                                    <div class="form-group">
        <label for="date_started">Date Started</label>
        <input type="text" name="date_started" id="date_started" class="form-control" value="{{ $task->date_started ? \Carbon\Carbon::parse($task->date_started)->format('Y-m-d') : 'N/A' }}" readonly>
    </div>

    @if($isAdminOrCreator)
    <div class="form-group">
        <label for="assignee">Assign To</label>
        <select name="assignee" id="assignee" class="form-control">
            @foreach($users as $user)
                <option value="{{ $user->id }}" {{ $task->user_id == $user->id ? 'selected' : '' }}>{{ $user->name }}</option>
            @endforeach
        </select>
    </div>
@endif

<div class="form-group d-flex justify-content-between">
    <button type="submit" class="btn btn-primary">Update Task</button>
    <button type="button" class="btn btn-danger" id="edit-task-back-btn">
        <i class="fas fa-arrow-left"></i> Back
    </button>
</div>

                                </form>
                            </div>
                        </div>  
                        <!--end of card body-->
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>

<!-- Ensure you have the necessary FontAwesome and SB Admin 2 scripts included 
<link href="{{ asset('vendor/fontawesome-free/css/all.min.css') }}" rel="stylesheet" type="text/css">
<script src="{{ asset('vendor/jquery/jquery.min.js') }}"></script>
<script src="{{ asset('vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ asset('vendor/jquery-easing/jquery.easing.min.js') }}"></script>
<script src="{{ asset('vendor/bootstrap/js/sb-admin-2.min.js') }}"></script> -->

<script>
   document.addEventListener('DOMContentLoaded', function () {
        var editTaskBtn = document.getElementById('edit-task-btn');
        var taskTitle = document.getElementById('task-title');
        var taskHeaderTitle = document.getElementById('task-header-title');
        var taskDetailsBackBtn = document.getElementById('task-details-back-btn'); // Task Details Back Button
        var editTaskBackBtn = document.getElementById('edit-task-back-btn'); // Edit Task Back Button

        // Initially hide the Edit Task back button
        if (editTaskBackBtn) {
            editTaskBackBtn.style.display = 'none';
        }

        // Toggle between task details and edit form
        if (editTaskBtn) {
            editTaskBtn.addEventListener('click', function (event) {
                event.preventDefault();
                document.getElementById('task-details').style.display = 'none';
                document.getElementById('edit-task-form').style.display = 'block';
                editTaskBtn.style.display = 'none'; // Hide Edit button
                taskTitle.textContent = 'Edit Task';
                taskHeaderTitle.textContent = 'Edit Task';

                // Show Edit Task back button and hide Task Details back button
                if (editTaskBackBtn) {
                    editTaskBackBtn.style.display = 'inline-block';
                }
                if (taskDetailsBackBtn) {
                    taskDetailsBackBtn.style.display = 'none';
                }
            });
        }

        // Toggle from Edit Task form back to Task Details
        if (editTaskBackBtn) {
            editTaskBackBtn.addEventListener('click', function () {
                document.getElementById('edit-task-form').style.display = 'none';
                document.getElementById('task-details').style.display = 'block';
                editTaskBtn.style.display = 'inline-block'; // Show Edit button
                taskTitle.textContent = 'Task Details';
                taskHeaderTitle.textContent = 'Task Details';

                // Show Task Details back button and hide Edit Task back button
                if (taskDetailsBackBtn) {
                    taskDetailsBackBtn.style.display = 'inline-block';
                }
                if (editTaskBackBtn) {
                    editTaskBackBtn.style.display = 'none';
                }
            });
        }

        // Update checklist item completion status
        window.updateChecklistItem = function(taskId, checklistId, checkbox) {
            fetch(`/tasks/${taskId}/checklists/${checklistId}`, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({
                    is_completed: checkbox.checked  // Pass the checkbox state to the server
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    console.log('Checklist item updated successfully:', data.message);

                    // Update the progress bar if needed
                    var totalItems = {{ $task->checklists->count() }};
                    var completedItems = document.querySelectorAll('input[type="checkbox"]:checked').length;
                    var percentage = totalItems > 0 ? (completedItems / totalItems) * 100 : 0;
                    var progressBar = document.querySelector('.progress-bar');
                    progressBar.style.width = percentage + '%';
                    progressBar.setAttribute('aria-valuenow', percentage);
                    progressBar.textContent = Math.round(percentage) + '%';
                } else {
                    console.error('Failed to update checklist item:', data.message);
                    alert('Failed to update the checklist item.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred while updating the checklist item.');
            });
        };

        // Toggle edit mode for checklist items
        window.toggleEditMode = function(checklistId) {
            const viewElement = document.getElementById(`checklist-view-${checklistId}`);
            const editElement = document.getElementById(`checklist-edit-${checklistId}`);
            if (viewElement && editElement) {
                viewElement.style.display = viewElement.style.display === 'none' ? 'block' : 'none';
                editElement.style.display = editElement.style.display === 'none' ? 'block' : 'none';
            }
        };

        // Save the edited checklist item
        window.saveChecklistItem = function(taskId, checklistId) {
            const inputField = document.getElementById(`checklist-item-input-${checklistId}`);
            const updatedText = inputField.value;

            fetch(`/tasks/${taskId}/checklists/${checklistId}`, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({ item: updatedText })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    // Update the checklist item display
                    const checklistView = document.getElementById(`checklist-view-${checklistId}`);
                    if (checklistView) {
                        const label = checklistView.querySelector('span');
                        if (label) {
                            label.textContent = updatedText;
                        }
                    }
                    toggleEditMode(checklistId); // Toggle back to view mode
                } else {
                    alert('Failed to update the checklist item.');
                }
            })
            .catch(error => console.error('Error updating checklist item:', error));
        };
    });

    // Handle task status update via AJAX
    document.addEventListener('DOMContentLoaded', function () {
    var taskStatusForm = document.getElementById('task-status-form');

    if (taskStatusForm) {
        taskStatusForm.addEventListener('submit', function (event) {
            event.preventDefault();  // Prevent normal form submission

            var status = document.getElementById('status').value;
            var taskId = '{{ $task->id }}';

            // Send the data via AJAX
            fetch('/tasks/' + taskId + '/status', {
                method: 'PATCH',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}',
                },
                body: JSON.stringify({
                    status: status
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    // Update the status dropdown
                    document.getElementById('status').value = data.data.status.toLowerCase();

                    // Display the success message
                    const messageElement = document.createElement('p');
                    messageElement.textContent = data.message;
                    messageElement.classList.add('text-success');
                    taskStatusForm.appendChild(messageElement);

                    // Update date_started and duration dynamically
                    if (data.data.date_started) {
                        document.querySelector('p[data-date-started]').textContent = 'Date Started: ' + data.data.date_started;
                        document.getElementById('date_started').value = data.data.date_started;
                    }

                    if (data.data.duration) {
                        document.querySelector('p[data-duration]').textContent = 'Duration: ' + data.data.duration;
                    }

                    // Clear the message after a few seconds
                    setTimeout(() => messageElement.remove(), 3000);
                } else if (data.error) {
                    // Display error message
                    const errorElement = document.createElement('p');
                    errorElement.textContent = data.error;
                    errorElement.classList.add('text-danger');
                    taskStatusForm.appendChild(errorElement);

                    setTimeout(() => errorElement.remove(), 3000);
                }
            })
            .catch(error => {
                console.error('Error updating task status:', error);
            });
        });
    }
});

</script>

