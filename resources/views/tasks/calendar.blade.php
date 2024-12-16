@extends('layouts.app')

@section('title', 'Task Calendar')

@section('styles')
    <!-- Include FullCalendar CSS -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.css' rel='stylesheet' />
    <style>
    #calendar a {
    color: #007bff;  /* Default link color in light mode */
    text-decoration: none;
}

/* Default style for light mode */
#instructions {
    color: #000000; /* Black for light mode */
}

/* Dark Mode Styles for instructions */
body.dark-mode #instructions {
    color: #ffa500; /* Orange for dark mode */
}

/* Dark Mode Styles for calendar view only */
body.dark-mode #calendar a {
    color: #ffa500;  /* Light or contrasting color for dark mode in calendar */
    /* Optionally add an underline for clarity */
}
        /* General Styles */
        body {
            background-color: #f4f6f9;
        }

        /* Calendar container with padding and rounded corners */
        #calendar {
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            transition: box-shadow 0.3s ease-in-out;
        }

        #calendar:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        /* Calendar Header (Month/Year) */
        .fc-toolbar-title {
            font-size: 24px;
            color: #333;
            text-shadow: 1px 1px #e3e3e3;
        }

        /* Custom Event Style */
        .calendar-event {
            border-radius: 8px !important;  /* Rounded corners for events */
            font-size: 14px;
            font-weight: bold;
            padding: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

       /* Updated styles for priority filter with color indicators */
.priority-filter label {
    margin-right: 20px;
    font-weight: bold;
    display: inline-flex;
    align-items: center;  /* Align checkbox, color box, and text */
}

.priority-filter input[type="checkbox"] {
    width: 16px;
    height: 16px;
    margin-right: 8px;
    border-radius: 4px;
}

    </style>
@endsection

@section('content')
  <link rel="stylesheet" href="https://unpkg.com/tippy.js@6/dist/tippy.css">
<script src="https://unpkg.com/tippy.js@6"></script>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Task Calendar</h2>
<br>

               <!-- Priority Filter with Color Indicators -->
<div class="priority-filter mb-4">
    <label><input type="checkbox" id="filter-low" checked> 
        <span style="background-color: #1dd1a1; width: 16px; height: 16px; display: inline-block; margin-right: 5px; border-radius: 4px;"></span> 
        <p class="font-semibold text-sm text-gray-800 leading-tight">Low Priority</p> 
    </label>
    <label><input type="checkbox" id="filter-medium" checked> 
        <span style="background-color: #feca57; width: 16px; height: 16px; display: inline-block; margin-right: 5px; border-radius: 4px;"></span>
       <p class="font-semibold text-sm text-gray-800 leading-tight">Medium Priority</p> 
    </label>
    <label><input type="checkbox" id="filter-high" checked> 
        <span style="background-color: #ff6b6b; width: 16px; height: 16px; display: inline-block; margin-right: 5px; border-radius: 4px;"></span> 
        <p class="font-semibold text-sm text-gray-800 leading-tight">High Priority</p> 
    </label>
</div>

 <!-- Status Filter without Color Indicators -->
<div class="status-filter mb-4 d-flex align-items-center">
    <label class="mr-3 d-flex align-items-center">
        <input type="checkbox" id="filter-not-started" checked class="mr-1">
        <span class="font-semibold text-sm text-gray-800">Not Started</span>
    </label>
    <label class="mr-3 d-flex align-items-center">
        <input type="checkbox" id="filter-in-progress" checked class="mr-1">
        <span class="font-semibold text-sm text-gray-800">In Progress</span>
    </label>
    <label class="d-flex align-items-center">
        <input type="checkbox" id="filter-done" checked class="mr-1">
        <span class="font-semibold text-sm text-gray-800">Done</span>
    </label>
</div>

<!-- Instructions -->
<p id="instructions" class="font-semibold">
    <em>Instructions:</em> Use the checkboxes above to filter tasks by priority and status. 
    <br>Hover over any task in the calendar to see additional details in a tooltip.
</p>

                <!-- Calendar container -->
                <div id='calendar' style="max-width: 100%;"></div>
            </div>
        </div>
    </div>

    <!-- Add Task Modal -->
    <div class="modal fade" id="addTaskModal" tabindex="-1" aria-labelledby="addTaskModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addTaskModalLabel">Add New Task</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addTaskForm" method="POST" action="{{ route('user.tasks.store') }}" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group mb-3">
                            <label for="name">Task Name</label>
                            <input type="text" name="name" id="name" class="form-control" required autocomplete="name">
                        </div>
                        <div class="form-group mb-3">
                            <label for="priority">Priority</label>
                            <select name="priority" id="priority" class="form-control" required autocomplete="off">
                                <option value="low">Low</option>
                                <option value="medium">Medium</option>
                                <option value="high">High</option>
                            </select>
                        </div>
                        <div class="form-group mb-3">
                            <label for="status">Status</label>
                            <select name="status" id="status" class="form-control" required disabled autocomplete="off">
                                <option value="not started" selected>Not Started</option>
                                <option value="in progress">In Progress</option>
                                <option value="done">Done</option>
                            </select>
                        </div>
                        <div class="form-group mb-3">
                            <label for="taskDueDate">Due Date</label>
                            <input type="date" name="due_date" id="taskDueDate" class="form-control" required readonly autocomplete="off">
                        </div>
                        <div class="form-group mb-3">
                            <label for="description">Description</label>
                            <textarea name="description" id="description" class="form-control" autocomplete="description"></textarea>
                        </div>
                        <div class="form-group mb-3">
                            <label for="attachments">Attachments</label>
                            <input type="file" name="attachments[]" id="attachments" class="form-control" multiple>
                        </div>
                        <div class="form-group mb-3">
                            <label for="checklist-items">Checklist Items</label>
                            <div id="checklist-items">
                                <div class="input-group mb-2">
                                    <input type="text" name="checklists[]" class="form-control" placeholder="Checklist item" autocomplete="off">
                                    <div class="input-group-append">
                                        <button class="btn btn-danger remove-checklist-item" type="button">Remove</button>
                                    </div>
                                </div>
                            </div>
                            <button id="add-checklist-item" class="btn btn-info mt-2" type="button">Add Checklist Item</button>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save Task</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('scripts')
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <script>
document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,dayGridWeek,dayGridDay'
        },
        contentHeight: 'auto',
        aspectRatio: 1.8,
        editable: true,
        views: {
            dayGridMonth: { buttonText: 'Month' },
            dayGridWeek: { buttonText: 'Week' },
            dayGridDay: { buttonText: 'Day' }
        },
        allDayDefault: true,
        events: function(fetchInfo, successCallback, failureCallback) {
            fetch(`/tasks/events?timestamp=${new Date().getTime()}`)
                .then(response => response.json())
                .then(data => {
                    successCallback(data);
                })
                .catch(error => {
                    console.error("Error fetching events:", error);
                    failureCallback(error);
                });
        },
        eventDidMount: function(info) {
            const event = info.event.extendedProps;

            const tooltipContent = `
                Type: ${event.type || 'N/A'}
                Name: ${info.event.title}
                Assigned To: ${event.assignedTo || 'N/A'}
                Priority: ${event.priority}
                Status: ${event.status}
                Due Date: ${event.due_date}
                Description: ${event.description || 'No description'}
                Progress: ${event.checklist ? `${event.checklist.filter(item => item.completed).length}/${event.checklist.length}` : 'N/A'}
                Attachments: ${event.attachments && event.attachments.length > 0 ? 'Yes' : 'None'}
            `;

            info.el.setAttribute('title', tooltipContent);
        },
        eventDrop: function(info) {
            var newDueDate = info.event.startStr;
            var taskId = info.event.id;

            var csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
            fetch(`/tasks/${taskId}/update-due-date`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': csrfToken,
                },
                body: JSON.stringify({ due_date: newDueDate }),
            })
            .then(response => {
                if (!response.ok) {
                    return response.text().then(text => { throw new Error(text); });
                }
                return response.json();
            })
            .then(data => {
                if (data.status === 'success') {
                    alert('Task due date updated successfully.');
                } else {
                    console.error('Error updating task:', data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error.message);
                info.revert();
            });
        },
        eventDataTransform: function(eventData) {
            if (eventData.priority) {
                var priorityColor = '';

                if (eventData.priority === 'low') {
                    priorityColor = '#1dd1a1';
                } else if (eventData.priority === 'medium') {
                    priorityColor = '#feca57';
                } else if (eventData.priority === 'high') {
                    priorityColor = '#ff6b6b';
                }

                eventData.backgroundColor = priorityColor;
                eventData.borderColor = priorityColor;
                eventData.textColor = '#fff';
                eventData.classNames = ['calendar-event'];
            }

            eventData.allDay = true;
            return eventData;
        },
        dateClick: function(info) {
            document.getElementById('taskDueDate').value = info.dateStr;
            var addTaskModal = new bootstrap.Modal(document.getElementById('addTaskModal'));
            addTaskModal.show();
        }
    });

    calendar.render();

    window.addEventListener('popstate', function(event) {
        location.reload();
    });

    document.getElementById('addTaskForm').addEventListener('submit', function(event) {
        event.preventDefault();
        var formData = new FormData(this);

        var csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

        fetch('{{ route("tasks.calendar.store") }}', {
            method: 'POST',
            headers: {
                'X-CSRF-TOKEN': csrfToken,
            },
            body: formData,
        })
        .then(response => {
            if (!response.ok) {
                return response.text().then(text => { throw new Error(text); });
            }
            return response.json();
        })
        .then(data => {
            if (data.status === 'success') {
                var priorityColor = '';
                if (data.task.priority === 'low') {
                    priorityColor = '#28a745';
                } else if (data.task.priority === 'medium') {
                    priorityColor = '#ffc107';
                } else if (data.task.priority === 'high') {
                    priorityColor = '#dc3545';
                }

                calendar.addEvent({
                    title: data.task.name,
                    start: data.task.due_date,
                    allDay: true,
                    backgroundColor: priorityColor,
                    borderColor: priorityColor,
                    textColor: '#fff',
                    extendedProps: {
                        status: data.task.status,
                        due_date: data.task.due_date,
                        description: data.task.description,
                        priority: data.task.priority,
                    }
                });

                var addTaskModal = bootstrap.Modal.getInstance(document.getElementById('addTaskModal'));
                addTaskModal.hide();
                document.getElementById('addTaskForm').reset();
            } else {
                console.error('Error creating task:', data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error.message);
        });
    });

    function filterEvents() {
        var lowChecked = document.getElementById('filter-low').checked;
        var mediumChecked = document.getElementById('filter-medium').checked;
        var highChecked = document.getElementById('filter-high').checked;

        var notStartedChecked = document.getElementById('filter-not-started').checked;
        var inProgressChecked = document.getElementById('filter-in-progress').checked;
        var doneChecked = document.getElementById('filter-done').checked;

        calendar.getEvents().forEach(function(event) {
            var priority = event.extendedProps.priority;
            var status = event.extendedProps.status;

            var priorityMatch = (priority === 'low' && lowChecked) ||
                                (priority === 'medium' && mediumChecked) ||
                                (priority === 'high' && highChecked);

            var statusMatch = (status === 'not started' && notStartedChecked) ||
                              (status === 'in progress' && inProgressChecked) ||
                              (status === 'done' && doneChecked);

            if (priorityMatch && statusMatch) {
                event.setProp('display', 'auto');
            } else {
                event.setProp('display', 'none');
            }
        });
    }

    // Add event listeners to priority and status checkboxes
    document.querySelectorAll('.priority-filter input').forEach(function(checkbox) {
        checkbox.addEventListener('change', filterEvents);
    });
    
    document.querySelectorAll('.status-filter input').forEach(function(checkbox) {
        checkbox.addEventListener('change', filterEvents);
    });
});
</script>


@endsection
