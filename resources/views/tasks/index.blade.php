<x-app-layout>
    <x-slot name="header">
    <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Tasks') }}
        </h2>
    </x-slot>


    <div class="py-12">
    <div class="container-fluid">
        <!-- Container for List View and Kanban View buttons -->
       <div id="flash-message-container">
    @if (session('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            {{ session('success') }}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    @endif

    @if (session('error'))
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            {{ session('error') }}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    @endif
</div>


        <div class="container-fluid d-flex flex-wrap justify-content-between align-items-center mb-4">
            <div class="d-flex mb-3 flex-wrap">
                <!-- Toggle between List View and Kanban View -->
                <button class="btn btn-success mb-2 mr-2" id="listViewButton">
                    <i class="fas fa-list"></i> List View
                </button>
                <button class="btn btn-info mb-2 mr-2" id="kanbanViewButton">
                    <i class="fas fa-th"></i> Kanban View
                </button>
                <button class="btn btn-warning mb-2 mr-2" id="teamViewButton">
                    <i class="fas fa-users"></i> Team View
                </button>
            </div>
            <div>
                <!-- Create Task Button -->
                @if (Auth::user()->usertype !== 'admin')
                    <a href="{{ route('user.tasks.create') }}" class="btn btn-success mb-2">
                        <i class="fas fa-plus"></i> Create Task
                    </a>
                @endif
            </div>
        </div>

      <!-- Filter Options Form -->
<form method="GET" action="{{ route('user.tasks.filter') }}">
    <div class="row mb-4">
        <!-- Priority Filter -->
        <div class="col-md-2 col-sm-6 mb-2">
            <select class="form-control" name="priority">
                <option value="">Filter by Priority</option>
                <option value="high" {{ request('priority') == 'high' ? 'selected' : '' }}>High Priority</option>
                <option value="medium" {{ request('priority') == 'medium' ? 'selected' : '' }}>Medium Priority</option>
                <option value="low" {{ request('priority') == 'low' ? 'selected' : '' }}>Low Priority</option>
            </select>
        </div>

        <!-- Status Filter -->
        <div class="col-md-2 col-sm-6 mb-2">
            <select class="form-control" name="status">
                <option value="">Filter by Status</option>
                <option value="not started" {{ request('status') == 'not started' ? 'selected' : '' }}>Not Started</option>
                <option value="in progress" {{ request('status') == 'in progress' ? 'selected' : '' }}>In Progress</option>
                <option value="done" {{ request('status') == 'done' ? 'selected' : '' }}>Done</option>
            </select>
        </div>

        <!-- Due Date Filter -->
        <div class="col-md-2 col-sm-6 mb-2">
            <select class="form-control" name="due_date">
                <option value="">Filter by Due Date</option>
                <option value="overdue" {{ request('due_date') == 'overdue' ? 'selected' : '' }}>Overdue</option>
                <option value="dueToday" {{ request('due_date') == 'dueToday' ? 'selected' : '' }}>Due Today</option>
                <option value="dueThisWeek" {{ request('due_date') == 'dueThisWeek' ? 'selected' : '' }}>Due This Week</option>
            </select>
        </div>

        <!-- Start Date Filter -->
        <div class="col-md-2 col-sm-6 mb-2">
            <input type="date" class="form-control" name="start_date" placeholder="From Date" value="{{ request('start_date') }}">
        </div>

        <!-- End Date Filter -->
        <div class="col-md-2 col-sm-6 mb-2">
            <input type="date" class="form-control" name="end_date" placeholder="To Date" value="{{ request('end_date') }}">
        </div>

        <!-- Apply Button -->
        <div class="col-md-2 col-sm-6 mb-2 d-flex align-items-center">
            <button type="submit" class="btn btn-primary w-100">Apply Filters</button>
        </div>
    </div>
</form>

        <!-- Unified Task List View -->
        <div id="listView" style="display: none;">
            <div class="card card-primary card-outline shadow mb-4">
                <!-- AdminLTE Styled Header -->
                <div class="card-header">
                    <h3 class="card-title">All Tasks</h3>
                    <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                            <i class="fas fa-minus"></i>
                        </button>
                    </div>
                </div>

                <!-- Card body with table -->
                <div class="card-body p-0">
                    <div class="table-responsive p-2">
                        <table class="table table-bordered table-hover table-striped table-sm" id="dataTableUnified" width="100%" cellspacing="0">
                           <thead class="thead-light">
    <tr>
        <th>Name</th>
        @if (Auth::user()->usertype == 'admin')
            <th>User</th>
        @endif
        <th>Priority</th>
        <th>Status</th>
        <th>Due Date</th>
        <!-- Commented out extra columns -->
        <!-- 
        <th>Date Started</th>
        <th>Duration</th>
        <th>Attachment</th> -->
        <th>Actions</th>
    </tr>
</thead>
<tbody>
    @foreach ($allTasks as $task)
        <tr data-id="{{ $task->id }}">
            <td>{{ $task->name }}</td>
            @if (Auth::user()->usertype == 'admin')
                <td>{{ $task->user ? $task->user->name : 'Unknown' }}</td>
            @endif
            <td>
                <span class="badge" 
                    data-priority="{{ $task->priority }}" 
                    style="background-color: {{ $task->priority == 'high' ? '#ff6b6b' : ($task->priority == 'medium' ? '#feca57' : '#1dd1a1') }}; color: white;">
                    {{ ucfirst($task->priority) }}
                </span>
            </td>
          <td>
    @php
        // Check if the task is overdue (past due date and not marked as 'done')
        $dueDate = \Carbon\Carbon::parse($task->due_date);
        $isOverdue = $task->status !== 'done' && $dueDate->isPast();
    @endphp

    <span class="badge"
        data-status="{{ $isOverdue ? 'overdue' : $task->status }}"
        style="background-color: {{ $isOverdue ? '#e74c3c' : ($task->status == 'not started' ? '#54a0ff' : ($task->status == 'in progress' ? '#f6b93b' : '#78e08f')) }}; color: white;">
        {{ $isOverdue ? 'Overdue' : ucfirst($task->status) }}
    </span>
</td>
 <td>
                                        @php
                                                $dueDate = \Carbon\Carbon::parse($task->due_date);
                                                $today = \Carbon\Carbon::today();
                                            @endphp

                                            <span class="@if($dueDate->isPast()) text-danger @endif">
                                                {{ $dueDate->format('M d, Y') }}
                                            </span>
                                        </td>
            <!-- Removed Due Date, Date Started, Duration, and Attachments columns -->
            <td class="text-center">
                <div class="d-flex justify-content-center align-items-center">
                    <a href="{{ route('user.tasks.show', $task->id) }}" class="btn btn-xs btn-info custom-width">
                        <i class="fas fa-eye"></i>
                    </a>
                    <button type="button" class="btn btn-xs btn-danger custom-width" onclick="confirmDelete({{ $task->id }})">
                        <i class="fas fa-trash"></i>
                    </button>
                </div>
            </td>
        </tr>
    @endforeach
</tbody>

                        </table>
                    </div>
                </div>
            </div>
        </div>
         <!-- Kanban View -->
         <div id="kanbanView" style="display: none;">
                <div class="row">
                    <!-- Not Started Column -->
                    <div class="col-md-4 kanban-column" id="notStarted">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3" style="background-color: #54a0ff;">
                                <h6 class="m-0 font-weight-bold text-white">Not Started</h6>
                            </div>
                            <div class="card-body">
                                @foreach ($tasksNotStarted as $task)
                                    <div class="card task-card" draggable="true" id="task-{{ $task->id }}">
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between">
                                                <h6 class="card-title font-weight-bold text-uppercase">{{ $task->name }}</h6>
                                                <div>
                                                    <a href="{{ route('user.tasks.show', $task->id) }}" class="text-primary mr-2">
                                                        <i class="fas fa-eye"></i>
                                                    </a>
                                                    <button type="button" class="btn btn-sm" style="color: red;" onclick="confirmDelete({{ $task->id }})">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <p class="card-text">{{ $task->description }}</p>
                                            <p class="card-text">
                                                <span class="badge
                                                    @if($task->priority == 'high') badge-danger
                                                    @elseif($task->priority == 'medium') badge-warning
                                                    @else badge-success
                                                    @endif">
                                                    {{ ucfirst($task->priority) }}
                                                </span>
                                            </p>
                                            <p class="card-text"><small class="text-muted">{{ \Carbon\Carbon::parse($task->due_date)->format('M d, Y') }}</small></p>
                                            @if (Auth::user()->usertype == 'admin')
                                                <p class="card-text"><small class="text-muted">Created by: {{ $task->user ? $task->user->name : 'Unknown' }}</small></p>
                                            @endif
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>

                    <!-- In Progress Column -->
                    <div class="col-md-4 kanban-column" id="inProgress">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3" style="background-color: #f6b93b;">
                                <h6 class="m-0 font-weight-bold text-white">In Progress</h6>
                            </div>
                            <div class="card-body">
                                @foreach ($tasksInProgress as $task)
                                    <div class="card task-card" draggable="true" id="task-{{ $task->id }}">
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between">
                                                <h6 class="card-title font-weight-bold text-uppercase">{{ $task->name }}</h6>
                                                <div>
                                                    <a href="{{ route('user.tasks.show', $task->id) }}" class="text-primary mr-2">
                                                        <i class="fas fa-eye"></i>
                                                    </a>
                                                    <button type="button" class="btn btn-sm" style="color: red;" onclick="confirmDelete({{ $task->id }})">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <p class="card-text">{{ $task->description }}</p>
                                            <p class="card-text">
                                                <span class="badge
                                                    @if($task->priority == 'high') badge-danger
                                                    @elseif($task->priority == 'medium') badge-warning
                                                    @else badge-success
                                                    @endif">
                                                    {{ ucfirst($task->priority) }}
                                                </span>
                                            </p>
                                            <p class="card-text"><small class="text-muted">{{ \Carbon\Carbon::parse($task->due_date)->format('M d, Y') }}</small></p>
                                            @if (Auth::user()->usertype == 'admin')
                                                <p class="card-text"><small class="text-muted">Created by: {{ $task->user ? $task->user->name : 'Unknown' }}</small></p>
                                            @endif
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>

                    <!-- Done Column -->
                    <div class="col-md-4 kanban-column" id="done">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3" style="background-color: #78e08f;">
                                <h6 class="m-0 font-weight-bold text-white">Done</h6>
                            </div>
                            <div class="card-body">
                                @foreach ($tasksDone as $task)
                                    <div class="card task-card" draggable="true" id="task-{{ $task->id }}">
                                        <div class="card-body">
                                            <div class="d-flex justify-content-between">
                                                <h6 class="card-title font-weight-bold text-uppercase">{{ $task->name }}</h6>
                                                <div>
                                                    <a href="{{ route('user.tasks.show', $task->id) }}" class="text-primary mr-2">
                                                        <i class="fas fa-eye"></i>
                                                    </a>
                                                    <button type="button" class="btn btn-sm" style="color: red;" onclick="confirmDelete({{ $task->id }})">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <p class="card-text">{{ $task->description }}</p>
                                            <p class="card-text">
                                                <span class="badge
                                                    @if($task->priority == 'high') badge-danger
                                                    @elseif($task->priority == 'medium') badge-warning
                                                    @else badge-success
                                                    @endif">
                                                    {{ ucfirst($task->priority) }}
                                                </span>
                                            </p>
                                            <p class="card-text"><small class="text-muted">{{ \Carbon\Carbon::parse($task->due_date)->format('M d, Y') }}</small></p>
                                            @if (Auth::user()->usertype == 'admin')
                                                <p class="card-text"><small class="text-muted">Created by: {{ $task->user ? $task->user->name : 'Unknown' }}</small></p>
                                            @endif
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <!-- Team Tasks Section with AdminLTE Styling -->
        <div class="card card-primary card-outline shadow mb-4" id="teamTasksSection" style="display: none;">
            <!-- AdminLTE Styled Header -->
            <div class="card-header">
                <h3 class="card-title">Team Tasks</h3>
                <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                        <i class="fas fa-minus"></i>
                    </button>
                </div>
            </div>

            <!-- Card body with table -->
            <div class="card-body p-0">
                <div class="table-responsive p-2">
                    <table class="table table-bordered table-hover table-striped table-sm" id="teamTasksTable">
                       <!-- Updated Table Headers without Due Date -->
<thead class="thead-light">
    <tr>
        <th>Task Name</th>
        <th>Team Name</th>
        @if (Auth::user()->usertype == 'admin')
            <th>Assigned To</th>
        @else
            <th>Created By</th>
        @endif
        <th>Status</th>
        <th>Priority</th>
        <th>Actions</th>
    </tr>
</thead>
<tbody>
    @foreach ($teamTasks as $task)
        <tr>
            <td>{{ $task->name }}</td>
            <td>{{ $task->team->name }}</td>
            @if (Auth::user()->usertype == 'admin')
                <td>{{ $task->user->name }}</td>
            @else
                <td>{{ $task->team->creator->name }}</td>
            @endif
            <!-- Updated Status Column to Check Overdue -->
            <td>
                @php
                    $dueDate = \Carbon\Carbon::parse($task->due_date);
                    $isOverdue = $task->status !== 'done' && $dueDate->isPast();
                @endphp

                <span class="badge" 
                    data-status="{{ $isOverdue ? 'overdue' : $task->status }}" 
                    style="background-color: {{ $isOverdue ? '#e74c3c' : ($task->status == 'not started' ? '#54a0ff' : ($task->status == 'in progress' ? '#f6b93b' : '#78e08f')) }}; color: white;">
                    {{ $isOverdue ? 'Overdue' : ucfirst($task->status) }}
                </span>
            </td>
            <td>
                <span class="badge" 
                    data-priority="{{ $task->priority }}" 
                    style="background-color: {{ $task->priority == 'high' ? '#ff6b6b' : ($task->priority == 'medium' ? '#feca57' : '#1dd1a1') }}; color: white;">
                    {{ ucfirst($task->priority) }}
                </span>
            </td>
            <td class="text-center">
                <a href="{{ route('user.tasks.show', $task->id) }}" class="btn btn-info compact-btn">
                    <i class="fas fa-eye"></i>
                </a>
            </td>
        </tr>
    @endforeach
</tbody>

                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


</x-app-layout>

<style>
.compact-btn {
    padding: 2px 5px; /* Minimal padding */
    font-size: 0.875rem; /* Smaller font size for icon */
    width: 45px; /* Fixed width for consistency */
    height: 30px; /* Fixed height to make it square */
    line-height: 1; /* Prevents extra space within the button */
    display: inline-flex; /* Ensures icon is centered */
    align-items: center;
    justify-content: center;
}
/* Target the DataTable length label for the "Show entries" in light mode */
#dataTableUnified_wrapper .dataTables_length label {
    color: #333; /* Darker text color for light mode */
    font-weight: bold; /* Make the text stand out */
    font-size: 14px; /* Adjust the font size for better visibility */
    cursor: default; /* Use default cursor for labels */
}

/* For dark mode, adjust the text to be lighter */
body.dark-mode #dataTableUnified_wrapper .dataTables_length label {
    color: #e0e0e0; /* Light text color for visibility in dark mode */
    font-weight: bold;
    font-size: 14px;
    cursor: default; /* Use default cursor for labels */
}

/* Styling for DataTables info section */
#dataTableUnified_wrapper .dataTables_info {
    color: #333; /* Darker color for light mode */
    font-size: 14px;
    cursor: default; /* Use default cursor for info */
}

/* Dark mode adjustment for info section */
body.dark-mode #dataTableUnified_wrapper .dataTables_info {
    color: #e0e0e0; /* Light color for visibility in dark mode */
    cursor: default; /* Use default cursor for info */
}

/* Styling for DataTables search label */
#dataTableUnified_wrapper .dataTables_filter label {
    color: #333; /* Darker color for light mode */
    font-size: 14px;
    font-weight: bold; /* Emphasize the label */
    cursor: default; /* Use default cursor for labels */
}

/* Dark mode adjustment for search label */
body.dark-mode #dataTableUnified_wrapper .dataTables_filter label {
    color: #e0e0e0; /* Lighter color for visibility in dark mode */
    font-weight: bold;
    cursor: default; /* Use default cursor for labels */
}

/* Light mode styling for 'Previous' and 'Next' text */
#dataTableUnified_wrapper .pagination .paginate_button a.page-link {
    color: #333; /* Dark text color for light mode */
    font-weight: bold; /* Make the text stand out */
    cursor: pointer; /* Ensure the cursor changes to pointer */
}

/* Hover state for 'Previous' and 'Next' text in light mode */
#dataTableUnified_wrapper .pagination .paginate_button a.page-link:hover {
    color: #000; /* Darker color on hover for visibility */
}

/* Dark mode styling for 'Previous' and 'Next' text */
body.dark-mode #dataTableUnified_wrapper .pagination .paginate_button a.page-link {
    color: #f1f1f1; /* Light text color for dark mode */
    font-weight: bold;
    cursor: pointer; /* Ensure the cursor changes to pointer */
}

/* Hover state for 'Previous' and 'Next' text in dark mode */
body.dark-mode #dataTableUnified_wrapper .pagination .paginate_button a.page-link:hover {
    color: #ffffff; /* Pure white text on hover for maximum visibility */
}
.task-card {
    margin-bottom: 15px; /* Adds space between each card */
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.kanban-column .card-body {
    max-height: 600px; /* Adjust based on your layout */
    overflow-y: auto; /* Allows scrolling if content overflows */
    padding: 10px; /* Optional padding to give some space inside the column */
}

.task-card.dragging {
    opacity: 0.5; /* Change opacity while dragging */
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    transform: scale(1.05); /* Slightly scale up the card */
}


.kanban-column .card-body {
    max-height: 600px; /* Adjust based on your layout */
    overflow-y: auto; /* Allows scrolling if content overflows */
    padding: 10px; /* Optional padding to give some space inside the column */
}


</style>
<!-- Custom delete confirmation modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Confirm Delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this task?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger" id="confirm-delete-btn">Delete</button>
            </div>
        </div>
    </div>
</div>

<!-- Ensure you have the necessary FontAwesome and SB Admin 2 scripts included -->
<link href="{{ asset('vendor/fontawesome-free/css/all.min.css') }}" rel="stylesheet" type="text/css">
<!--<script src="{{ asset('vendor/jquery/jquery.min.js') }}"></script>-->
<script src="{{ asset('vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ asset('vendor/jquery-easing/jquery.easing.min.js') }}"></script>
<script src="{{ asset('vendor/bootstrap/js/sb-admin-2.min.js') }}"></script>
<script src="{{ asset('vendor/datatables/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('vendor/datatables/dataTables.bootstrap4.min.js') }}"></script>

<script>
    $(document).ready(function() {
        // Automatically close the alert after 5 seconds
        setTimeout(function() {
            $(".alert").alert('close');
        }, 5000);
    });
</script>
<script>
$(document).ready(function() {
    var dataTables = {};
    var taskCard = null; // To store the card being dragged
    var startX, startY; // To store the starting touch position


    function enableTouchDrag() {
        $('.task-card').on('touchstart', function(e) {
            taskCard = e.target.closest('.task-card');
            $(taskCard).addClass('dragging'); 
            var touch = e.touches[0];
            startX = touch.clientX;
            startY = touch.clientY;
        });

        $('.task-card').on('touchmove', function(e) {
            e.preventDefault();
            var touch = e.touches[0];
            var deltaX = touch.clientX - startX;
            var deltaY = touch.clientY - startY;

            taskCard.style.transform = `translate(${deltaX}px, ${deltaY}px)`;
        });

        $('.task-card').on('touchend', function(e) {
        if (taskCard) {
        $(taskCard).removeClass('dragging'); 
        taskCard.style.transform = ''; 

        var targetColumn = document.elementFromPoint(e.changedTouches[0].clientX, e.changedTouches[0].clientY)?.closest('.kanban-column');

        if (targetColumn && targetColumn.querySelector('.card-body') && !targetColumn.querySelector('.card-body').contains(taskCard)) {
            targetColumn.querySelector('.card-body').appendChild(taskCard);
            var taskId = taskCard.id.split('-')[1];
            updateTaskStatus(taskId, targetColumn.id);
        }

        taskCard = null;
    }
    });
    }

    enableTouchDrag();
    dataTables['dataTableUnified'] = $('#dataTableUnified').DataTable();  // My Tasks
    dataTables['teamTasksTable'] = $('#teamTasksTable').DataTable();  // Team Tasks

    function handleButtonColorChange(activeButton) {
        $('#viewOptions button').removeClass('btn-success').addClass('btn-info');
        $(activeButton).removeClass('btn-info').addClass('btn-success');
    }

    function toggleView(viewToShow) {
        $('#listView, #kanbanView, #teamTasksSection').hide(); 
        $(viewToShow).show();
    }

    
    function initializeView() {
        $('#listViewButton').addClass('btn-success');
        $('#kanbanViewButton').removeClass('btn-success').addClass('btn-info');
        $('#teamViewButton').removeClass('btn-success').addClass('btn-info');
        toggleView('#listView'); 
    }
    
    $('#listViewButton').on('click', function() {
        toggleView('#listView'); 
        $('#teamTasksSection').hide(); 
        $(this).removeClass('btn-info').addClass('btn-success');
        $('#kanbanViewButton').removeClass('btn-success').addClass('btn-info');
        $('#teamViewButton').removeClass('btn-success').addClass('btn-info');
    });

    
    $('#teamViewButton').on('click', function() {
        toggleView('#teamTasksSection'); 
        $('#listView').hide(); 
        $(this).removeClass('btn-info').addClass('btn-success');
        $('#listViewButton').removeClass('btn-success').addClass('btn-info');
        $('#kanbanViewButton').removeClass('btn-success').addClass('btn-info');
    });

    $('#kanbanViewButton').on('click', function() {
        toggleView('#kanbanView'); 
        $(this).removeClass('btn-info').addClass('btn-success');
        $('#listViewButton').removeClass('btn-success').addClass('btn-info');
        $('#teamViewButton').removeClass('btn-success').addClass('btn-info');
    });

    $('.task-card').on('dragstart', function(event) {
        event.originalEvent.dataTransfer.setData("text", event.target.id);
        $(this).addClass('dragging');
    });

    $('.task-card').on('dragend', function(event) {
        
        $(this).removeClass('dragging');
    });

    $('.kanban-column').on('dragover', function(event) {
    event.preventDefault();
    });

    $('.kanban-column').on('drop', function(event) {
    event.preventDefault();
    var taskId = event.originalEvent.dataTransfer.getData("text");
    var taskElement = document.getElementById(taskId);
    var targetBody = $(this).find('.card-body').get(0); 
    if (targetBody) {
        targetBody.appendChild(taskElement);
        updateTaskStatus(taskId.split('-')[1], this.id); 
    }
    });

    function updateTaskStatus(taskId, status) {
    var statusMap = {
        notStarted: 'not started',
        inProgress: 'in progress',
        done: 'done'
    };

    $.ajax({
        url: '/tasks/' + taskId + '/status',
        type: 'PATCH',
        data: {
            _token: '{{ csrf_token() }}',
            status: statusMap[status]
        },
        success: function(response) {
            console.log(response.message);
            
            moveTaskInListView(taskId, statusMap[status], response.date_started, response.duration);
            if (response.status === 'Done' && response.approval_status === 'Pending') {
                console.log('Task approval pending');
            }
        },
        error: function(xhr) {
            console.error('Error updating task status:', xhr.responseText);
        }
    });
}

initializeView();
function moveTaskInListView(taskId, status) {
    var taskRow = $('tr[data-id="' + taskId + '"]').first();

    var isAdmin = {{ Auth::user()->usertype == 'admin' ? 'true' : 'false' }};

    var statusColumnIndex = isAdmin ? 3 : 2;

    var statusLabel = taskRow.find('td:eq(' + statusColumnIndex + ') span');
    
    statusLabel.text(capitalizeWords(status));
    
    var statusColor = status === 'not started' ? '#54a0ff' : (status === 'in progress' ? '#f6b93b' : '#78e08f');
    statusLabel.css('background-color', statusColor); 
    statusLabel.css('color', 'white'); 
    dataTables['dataTableUnified'].row(taskRow).invalidate().draw();
}


function capitalizeWords(str) {
    return str.replace(/\b\w/g, function(char) { return char.toUpperCase(); });
}




   
   
$('#applyFilters').on('click', function() {
    dataTables['dataTableUnified'].draw();  
    dataTables['teamTasksTable'].draw();  
});


  
$.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
    var priorityFilter = ($('#priorityFilter').val() || '').toLowerCase();
    var statusFilter = ($('#statusFilter').val() || '').toLowerCase();
    var dueDateFilter = $('#dueDateFilter').val();  
    var startDateFilter = $('#startDateFilter').val();  
    var endDateFilter = $('#endDateFilter').val();  

    var tableId = settings.nTable.id;  

    var priorityColumnIndex, statusColumnIndex, dueDateColumnIndex;
    var isAdmin = {{ Auth::user()->usertype == 'admin' ? 'true' : 'false' }};

    if (tableId === 'dataTableUnified') {
        priorityColumnIndex = isAdmin ? 2 : 1;
        statusColumnIndex = isAdmin ? 3 : 2;
        dueDateColumnIndex = isAdmin ? 4 : 3;
    } else if (tableId === 'teamTasksTable') {
        priorityColumnIndex = 4;  
        statusColumnIndex = 3;    
        dueDateColumnIndex = 5;   
    } else {
        return true;  
    }

    
    var taskPriority = $(settings.aoData[dataIndex].nTr).find('td span[data-priority]').data('priority') || '';
    var taskStatus = $(settings.aoData[dataIndex].nTr).find('td span[data-status]').data('status') || '';
    
    
    var dueDate = dueDateColumnIndex !== undefined && data[dueDateColumnIndex]
        ? new Date(data[dueDateColumnIndex])
        : null; 

    var today = new Date();
    today.setHours(0, 0, 0, 0);  

    
    taskPriority = taskPriority.toString().toLowerCase();
    taskStatus = taskStatus.toString().toLowerCase();

   
    if (priorityFilter && taskPriority !== priorityFilter) {
        return false;
    }

    
    if (statusFilter && taskStatus !== statusFilter) {
        return false;
    }

    
    if (dueDate) {
        
        dueDate.setHours(0, 0, 0, 0);

        
        if (dueDateFilter === 'overdue' && dueDate >= today) {
            return false; 
        }
        if (dueDateFilter === 'dueToday' && dueDate.getTime() !== today.getTime()) {
            return false; 
        }
        if (dueDateFilter === 'dueThisWeek') {
            var startOfWeek = new Date(today);
            startOfWeek.setDate(today.getDate() - today.getDay() + 1); // Monday
            var endOfWeek = new Date(startOfWeek);
            endOfWeek.setDate(startOfWeek.getDate() + 6); // Sunday

            if (dueDate < startOfWeek || dueDate > endOfWeek) {
                return false; 
            }
        }

       
        if (startDateFilter) {
            var fromDate = new Date(startDateFilter);
            fromDate.setHours(0, 0, 0, 0);

            if (dueDate < fromDate) {
                return false; 
            }
        }

        if (endDateFilter) {
            var toDate = new Date(endDateFilter);
            toDate.setHours(23, 59, 59, 999);

            if (dueDate > toDate) {
                return false; 
            }
        }
    }

    return true;  
});


    function confirmDelete(taskId) {
        taskIdToDelete = taskId;
        $('#deleteModal').modal('show');
    }

    $('#confirm-delete-btn').on('click', function() {
        if (taskIdToDelete) {
            deleteTask(taskIdToDelete);
        }
    });


    // Handle task deletion via AJAX
  function deleteTask(taskId) {
    var url = `{{ route('user.tasks.destroy', ':task') }}`.replace(':task', taskId);

    $.ajax({
        url: url,
        type: 'DELETE',
        data: {
            _token: '{{ csrf_token() }}'
        },
        success: function(response) {
            $('#deleteModal').modal('hide');

            var row = $('tr[data-id="' + taskId + '"]');
            if (row.length && dataTables['dataTableUnified'].row(row).length) {
                dataTables['dataTableUnified'].row(row).remove().draw();
            }

            $('#flash-message-container').html(`
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    ${response.success}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            `);
            setTimeout(function() {
                $('#flash-message-container .alert').fadeOut('slow');
            }, 3000);
        },
        error: function(xhr) {
            $('#deleteModal').modal('hide');

            $('#flash-message-container').html(`
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    ${xhr.responseJSON?.error || 'Error deleting task.'}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            `);
            setTimeout(function() {
                $('#flash-message-container .alert').fadeOut('slow');
            }, 5000);
        }
    });
}




    window.confirmDelete = confirmDelete;

    initializeView();
});

</script>
