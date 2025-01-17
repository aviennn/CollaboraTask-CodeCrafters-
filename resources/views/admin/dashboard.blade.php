<x-app-layout>
    <x-slot name="header">
    <div class="d-flex justify-content-between align-items-center">
        <h2 class="font-semibold text-xl text-gray-800 dark:black-gray-200 leading-tight">
            {{ __('Dashboard Admin') }}
        </h2>
<!-- DataTables CSS -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">


  <style>
            .info-box-custom {
    border-radius: 10px;
    max-width: 220px;
    width: 100%;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Shadow to match shadow-sm */
}

        </style>
        
   
</div>
</x-slot>
<div class="max-w-7xl mx-auto sm:px-6 lg:px-8"></div>
        <!-- Unified container for sortable functionality -->
        <div class="container-fluid">
            <div class="row sortable-dashboard">

         <div class="container-fluid my-4">
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-3">

        <!-- Total Users Box -->
        <div class="col d-flex justify-content-center">
            <a href="{{ route('admin.users.index') }}" class="text-decoration-none w-100">
                <div class="info-box info-box-custom">
                    <span class="info-box-icon bg-info elevation-1"><i class="fas fa-user"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Total Users</span>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $totalUsers }}</div>
                    </div>
                </div>
            </a>
        </div>

        <!-- Active Users Box -->
        <div id="activeUsersCountBox" class="col d-flex justify-content-center">
            <a href="javascript:void(0)" class="text-decoration-none w-100">
                <div class="info-box info-box-custom">
                    <span class="info-box-icon bg-primary elevation-1"><i class="fas fa-users"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Online Users</span>
                        <div id="activeUsersCount" class="h5 mb-0 font-weight-bold text-gray-800">{{ $activeUsers }}</div>
                    </div>
                </div>
            </a>
        </div>

        <!-- Total Teams Box -->
        <div class="col d-flex justify-content-center">
            <a href="{{ route('teams.index') }}" class="text-decoration-none w-100">
                <div class="info-box info-box-custom">
                    <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-users"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Total Teams</span>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $totalTeams }}</div>
                    </div>
                </div>
            </a>
        </div>

        <!-- All Tasks Box -->
        <div class="col d-flex justify-content-center">
            <a href="{{ route('user.tasks.filter', 'all') }}" class="text-decoration-none w-100">
                <div class="info-box info-box-custom">
                    <span class="info-box-icon bg-success elevation-1"><i class="fas fa-clipboard"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">All Tasks</span>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $taskStatusCounts['all'] }}</div>
                    </div>
                </div>
            </a>
        </div>

        <!-- Not Started Box -->
        <div class="col d-flex justify-content-center">
            <a href="{{ route('user.tasks.filter', 'not started') }}" class="text-decoration-none w-100">
                <div class="info-box info-box-custom">
                    <span class="info-box-icon bg-secondary elevation-1"><i class="fas fa-hourglass-start"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Not Started</span>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $taskStatusCounts['not started'] }}</div>
                    </div>
                </div>
            </a>
        </div>

        <!-- In Progress Box -->
        <div class="col d-flex justify-content-center">
            <a href="{{ route('user.tasks.filter', 'in progress') }}" class="text-decoration-none w-100">
                <div class="info-box info-box-custom">
                    <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-spinner"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">In Progress</span>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $taskStatusCounts['in progress'] }}</div>
                    </div>
                </div>
            </a>
        </div>

        <!-- Done Box -->
        <div class="col d-flex justify-content-center">
            <a href="{{ route('user.tasks.filter', 'done') }}" class="text-decoration-none w-100">
                <div class="info-box info-box-custom">
                    <span class="info-box-icon bg-success elevation-1"><i class="fas fa-check-circle"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Done</span>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $taskStatusCounts['done'] }}</div>
                    </div>
                </div>
            </a>
        </div>

        <!-- Low Priority Box -->
        <div class="col d-flex justify-content-center">
            <a href="{{ route('user.tasks.filter', ['status' => '', 'priority' => 'low']) }}" class="text-decoration-none w-100">
                <div class="info-box info-box-custom">
                    <span class="info-box-icon bg-success elevation-1"><i class="fas fa-check-circle"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Low Priority</span>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $taskPriorities['low'] }}</div>
                    </div>
                </div>
            </a>
        </div>

        <!-- Medium Priority Box -->
        <div class="col d-flex justify-content-center">
            <a href="{{ route('user.tasks.filter', ['status' => '', 'priority' => 'medium']) }}" class="text-decoration-none w-100">
                <div class="info-box info-box-custom">
                    <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-exclamation-triangle"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">Medium Priority</span>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $taskPriorities['medium'] }}</div>
                    </div>
                </div>
            </a>
        </div>

        <!-- High Priority Box -->
        <div class="col d-flex justify-content-center">
            <a href="{{ route('user.tasks.filter', ['status' => '', 'priority' => 'high']) }}" class="text-decoration-none w-100">
                <div class="info-box info-box-custom">
                    <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-exclamation-circle"></i></span>
                    <div class="info-box-content">
                        <span class="info-box-text">High Priority</span>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">{{ $taskPriorities['high'] }}</div>
                    </div>
                </div>
            </a>
        </div>

    </div>
</div>




<!-- Active Users Modal -->
<div class="modal fade" id="activeUsersModal" tabindex="-1" aria-labelledby="activeUsersModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="activeUsersModalLabel">Active Users</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <ul id="activeUsersList" class="list-group"></ul>
            </div>
        </div>
    </div>
</div>

<style>
 .info-box {
    max-width: 100%;
    margin-bottom: 15px;
}

@media (min-width: 1200px) {
    .info-box {
        margin-bottom: 20px;
    }
}

</style>


                <!-- In Progress Box -->


            <!-- Individual Task Container -->
            <div  id="box-10" class="col-lg-6 mb-4" id="individual-task-box" >
                <div class="card shadow h-100 border-0" style="border-radius: 10px;">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title d-flex align-items-center mb-3">
                            <i class="fas fa-tasks mr-2"></i> Individual Tasks
                        </h5>
                        <!-- Scrollable Task List -->
                        <div class="task-list flex-grow-1 scrollable-task-list">
                            @if($recentIndividualTasks->isEmpty())
                                <div class="task-item">
                                    <p class="text-muted">No recent individual tasks</p>
                                </div>
                            @else
                                @foreach($recentIndividualTasks as $task)
                                <!-- Clickable individual task item -->
                                <a href="{{ route('user.tasks.show', $task->id) }}" class="text-decoration-none">
                                    <div class="task-item d-flex justify-content-between align-items-center py-3">
                                        <div>
                                            <strong>{{ $task->name }}</strong>
                                            <br>
                                            <small class="text-muted">Created by {{ $task->user->name }}</small>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <small class="text-muted mr-2">Due:</small>
                                            <span class="badge badge-pill badge-warning">{{ \Carbon\Carbon::parse($task->due_date)->format('M d, Y') }}</span>
                                            <i class="fas fa-chevron-right ml-3 task-icon"></i>
                                        </div>
                                    </div>
                                </a>
                                @endforeach
                            @endif
                        </div>

                        <!-- Button Section -->
                        <div class="mt-auto d-flex justify-content-between">
                           <!-- <a href="{{ route('user.tasks.create') }}" class="btn btn-primary">Add new task</a>-->
                            <a href="{{ route('user.tasks.index') }}" class="btn btn-info">View tasks</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Team Task Container -->
            <div id="box-11"  class="col-lg-6 mb-4" id="team-task-box">
                <div class="card shadow h-100 border-0" style="border-radius: 10px;">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title d-flex align-items-center mb-3">
                            <i class="fas fa-users mr-2"></i> Team Tasks
                        </h5>
                        <!-- Scrollable Task List -->
                        <div class="task-list flex-grow-1 scrollable-task-list">
                            @php $hasAssignedTasks = false; @endphp
                            @foreach($recentTeamTasks as $task)
                                @php $hasAssignedTasks = true; @endphp
                                <!-- Clickable team task item -->
                                <a href="{{ route('user.tasks.show', $task->id) }}" class="text-decoration-none">
                                    <div class="task-item d-flex justify-content-between align-items-center py-3">
                                        <div>
                                            <strong>{{ $task->team->name }}: {{ $task->name }}</strong>
                                            <br>
                                            <small class="text-muted">Assigned to {{ $task->user->name }}</small>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <small class="text-muted mr-2">Due:</small>
                                            <span class="badge badge-pill badge-warning">{{ \Carbon\Carbon::parse($task->due_date)->format('M d, Y') }}</span>
                                            <i class="fas fa-chevron-right ml-3 task-icon"></i>
                                        </div>
                                    </div>
                                </a>
                            @endforeach

                            @if(!$hasAssignedTasks)
                                <div class="task-item">
                                    <p class="text-muted">No assigned tasks for now</p>
                                </div>
                            @endif
                        </div>

                        <!-- Button Section -->
                        <div class="mt-auto d-flex justify-content-between">
                            <a href="{{ route('teams.create') }}" class="btn btn-primary">Create new team</a>
                            <a href="{{ route('teams.index') }}" class="btn btn-info">View teams</a>
                        </div>
                    </div>
                </div>
            </div>

        <!-- Task Progress Chart -->
<div id="box-12" class="col-lg-6 mb-4 sortable-item" id="task-chart-box">
    <div class="card shadow h-100 border-0">
        <div class="card-body d-flex flex-column">
            <h5 class="card-title d-flex align-items-center mb-3">
                <i class="fas fa-chart-pie mr-2"></i> Task Progress Chart
            </h5>
            <!-- Dropdown for chart type selection -->
            <div class="text-xs font-weight-bold text-uppercase mb-1">
                Select Chart Type:
                <select id="chartType" class="form-control">
                    <option value="doughnut">Doughnut Chart</option>
                    <option value="bar">Bar Chart</option>
                    <option value="line">Line Chart</option>
                </select>
            </div>
            <div class="chart-container pt-4 pb-2" style="height: 300px;">
                <canvas id="taskChart" style="width: 100%; height: 100%;"></canvas>
            </div>
        </div>
    </div>
</div>


<!-- Priority Count Chart -->
<div id="box-13" class="col-lg-6 mb-4 sortable-item" id="priority-chart-box">
    <div class="card shadow h-100 border-0">
        <div class="card-body d-flex flex-column">
            <h5 class="card-title d-flex align-items-center mb-3">
                <i class="fas fa-list-alt mr-2"></i> Priority Count
            </h5>
            <!-- Dropdown for chart type selection -->
            <div class="text-xs font-weight-bold text-uppercase mb-1">
                Select Chart Type:
                <select id="priorityChartType" class="form-control">
                    <option value="doughnut">Doughnut Chart</option>
                    <option value="bar">Bar Chart</option>
                    <option value="line">Line Chart</option>
                </select>
            </div>
            <div class="chart-container pt-4 pb-2" style="height: 300px;">
                <canvas id="priorityChart" style="width: 100%; height: 100%;"></canvas>
            </div>
        </div>
    </div>
</div>







           <!-- Deadlines This Week -->
<div id="box-14"  class="col-lg-12 mb-4" id="deadlines-box">
    <div class="card shadow h-100 py-2" style="border-radius: 10px;">
        <div class="card-body">
            <h5 class="font-weight-bold text-primary mb-4">Deadlines This Week</h5>
            <div class="table-responsive">
                <!-- Add an ID to the table for DataTables targeting -->
                <table class="table table-bordered" id="deadlinesTable">
                    <thead>
                        <tr>
                            <th>Task</th>
                            <th>Progress</th>
                            <th>Deadline</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($tasks as $task)
                        <tr>
                            <td>{{ $task->name }}</td>
                            <td>
                                <span class="badge
                                    @if($task->status == 'not started') badge-warning
                                    @elseif($task->status == 'in progress') badge-primary
                                    @elseif($task->status == 'done') badge-success
                                    @endif">
                                    {{ ucfirst($task->status) }}
                                </span>
                            </td>
                            <td>{{ \Carbon\Carbon::parse($task->due_date)->format('M d, Y') }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

        </div>
    </div>
</x-app-layout>
<!-- jQuery 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>-->
<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>



<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Initialize DataTables for the deadlines table
        $('.table').DataTable({
            "paging": true,       // Enable pagination
            "pageLength": 10,     // Show 10 entries per page
            "lengthChange": false, // Disable changing the page length
            "searching": true,    // Enable search filter
            "ordering": true,     // Enable column sorting
            "info": true,         // Show info about the number of entries
            "autoWidth": false,   // Disable automatic column width calculation
            "language": {
                "paginate": {
                    "previous": "<",
                    "next": ">"
                }
            }
        });
    });
</script>

<script>
    
 document.addEventListener('DOMContentLoaded', function () {
    const taskData = @json($taskData); // Assuming this is server-side injected JSON object

    // Chart colors
    const colors = {
        'not started': '#54a0ff',
        'in progress': '#f6b93b',
        'done': '#78e08f'
    };

    // Chart Data
    const chartData = {
        labels: Object.keys(taskData),
        datasets: [{
            data: Object.values(taskData),
            backgroundColor: Object.keys(taskData).map(status => colors[status] || '#ccc'),
            borderColor: "#ffffff",
            borderWidth: 5,
        }]
    };

    // Initial Chart Setup (Donut by default)
    let chartType = 'doughnut'; // Default chart type
    const ctx = document.getElementById('taskChart').getContext('2d');
    let taskChart = new Chart(ctx, {
        type: chartType,
        data: chartData,
        options: {
            maintainAspectRatio: false,
            tooltips: {
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                borderColor: '#dddfeb',
                borderWidth: 1,
                displayColors: false,
            },
            legend: { display: false },
        },
    });

    // Event listener for chart type selection
    document.getElementById('chartType').addEventListener('change', function (e) {
        const selectedChartType = e.target.value;

        // Destroy the existing chart and create a new one with the selected type
        taskChart.destroy();
        taskChart = new Chart(ctx, {
            type: selectedChartType,
            data: {
                labels: Object.keys(taskData),
                datasets: [{
                    label: 'Tasks',
                    data: Object.values(taskData),
                    backgroundColor: selectedChartType === 'line'
                        ? "rgba(28, 200, 138, 0.2)"
                        : Object.keys(taskData).map(status => colors[status] || '#ccc'),
                    borderColor: selectedChartType === 'line' ? "#1cc88a" : "#ffffff",
                    borderWidth: selectedChartType === 'line' ? 2 : 1,
                    fill: selectedChartType === 'line', // Only fill for line chart
                }],
            },
            options: {
                maintainAspectRatio: false,
                tooltips: {
                    backgroundColor: "rgb(255,255,255)",
                    bodyFontColor: "#858796",
                    borderColor: '#dddfeb',
                    borderWidth: 1,
                    displayColors: false,
                },
                legend: { display: false },
                scales: selectedChartType === 'bar' || selectedChartType === 'line' ? {
                    xAxes: [{
                        gridLines: { display: false },
                        ticks: { beginAtZero: true }
                    }],
                    yAxes: [{
                        gridLines: { display: true },
                        ticks: { beginAtZero: true }
                    }]
                } : {}
            },
        });
    });
});


</script>
<script>


document.addEventListener("DOMContentLoaded", function () {
    const taskPriorities = <?php echo json_encode($taskPriorities, 15, 512) ?>;

    // Explicitly assign values to ensure the correct order
    const priorityCounts = [
        taskPriorities['low'] || 0,     // Low priority count
        taskPriorities['medium'] || 0,  // Medium priority count
        taskPriorities['high'] || 0     // High priority count
    ];

    // Debugging step to ensure data is correct
    console.log('Task Priorities:', taskPriorities);
    console.log('Priority Counts (Low, Medium, High):', priorityCounts);

    // Check if the canvas element exists
    const priorityCtx = document.getElementById('priorityChart');
    if (!priorityCtx) {
        console.error('Canvas element for priority chart is missing.');
        return;
    }

    // Initial Chart Setup (Donut by default)
    let priorityChartType = 'doughnut'; // Default chart type
    const priorityCtx2d = priorityCtx.getContext('2d');
    let priorityChart = new Chart(priorityCtx2d, {
        type: priorityChartType,
        data: {
            labels: ['Low', 'Medium', 'High'],  // Priority labels
            datasets: [{
                data: priorityCounts,
                backgroundColor: ['#1dd1a1', '#feca57', '#ff6b6b'],
                borderColor: "#ffffff",
                borderWidth: 5,
            }]
        },
        options: {
            maintainAspectRatio: false,
            tooltips: {
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#858796",
                borderColor: '#dddfeb',
                borderWidth: 1,
                displayColors: false,
            },
            legend: { display: false },  // Hide the legend similar to the left chart
            scales: priorityChartType === 'bar' || priorityChartType === 'line' ? {
                xAxes: [{
                    gridLines: { display: false },
                    ticks: { beginAtZero: true }
                }],
                yAxes: [{
                    gridLines: { display: true },
                    ticks: { beginAtZero: true }
                }]
            } : {}
        }
    });

    // Event listener for chart type selection
    document.getElementById('priorityChartType').addEventListener('change', function (e) {
        const selectedChartType = e.target.value;

        // Destroy the existing chart and create a new one with the selected type
        priorityChart.destroy();
        priorityChart = new Chart(priorityCtx2d, {
            type: selectedChartType,
            data: {
                labels: ['Low', 'Medium', 'High'],
                datasets: [{
                    data: priorityCounts,
                    backgroundColor: selectedChartType === 'line'
                        ? "rgba(0, 123, 255, 0.2)"
                        : ['#ff6b6b', '#feca57', '#1dd1a1'],
                    borderColor: selectedChartType === 'line' ? "#007bff" : "#ffffff",
                    borderWidth: selectedChartType === 'line' ? 2 : 1,
                    fill: selectedChartType === 'line', // Only fill for line chart
                }],
            },
            options: {
                maintainAspectRatio: false,
                tooltips: {
                    backgroundColor: "rgb(255,255,255)",
                    bodyFontColor: "#858796",
                    borderColor: '#dddfeb',
                    borderWidth: 1,
                    displayColors: false,
                },
                legend: { display: false },  // Ensure legend is hidden across all chart types
                scales: selectedChartType === 'bar' || selectedChartType === 'line' ? {
                    xAxes: [{
                        gridLines: { display: false },
                        ticks: { beginAtZero: true }
                    }],
                    yAxes: [{
                        gridLines: { display: true },
                        ticks: { beginAtZero: true }
                    }]
                } : {}
            }
        });
    });








    // Priority changing mechanism (if you want to update the chart dynamically)
    let currentPriorityIndex = 0;

    function updatePriorityDisplay() {
        const priority = priorities[currentPriorityIndex];
        const priorityCount = taskPriorities[priority];
        const priorityLabel = priority.charAt(0).toUpperCase() + priority.slice(1);

        document.getElementById('priority-value').innerText = priorityCount;
        document.getElementById('priority-label').innerText = priorityLabel;

        const iconElement = document.getElementById('priority-icon');
        iconElement.classList.remove('text-danger', 'text-warning', 'text-success');

        if (priority === 'high') {
            iconElement.className = 'fas fa-exclamation-circle text-danger';
        } else if (priority === 'medium') {
            iconElement.className = 'fas fa-exclamation-triangle text-warning';
        } else if (priority === 'low') {
            iconElement.className = 'fas fa-check-circle text-success';
        }

        // Update the chart with new data if needed
        priorityChart.data.datasets[0].data[currentPriorityIndex] = priorityCount;
        priorityChart.update();
    }

    window.changePriority = function(direction) {
        if (direction === 'next') {
            currentPriorityIndex = (currentPriorityIndex + 1) % priorities.length;
        } else {
            currentPriorityIndex = (currentPriorityIndex - 1 + priorities.length) % priorities.length;
        }
        updatePriorityDisplay();
    };

    updatePriorityDisplay();
});

</script>
<script>
    function fetchActiveUsersCount() {
        $.ajax({
            url: '/admin/fetch-active-users-count',
            method: 'GET',
            success: function(response) {
                $('#activeUsersCount').text(response.activeUsers);
            },
            error: function() {
                console.error("Failed to fetch active users count.");
            }
        });
    }

    function fetchActiveUsersDetails() {
    $.ajax({
        url: '/admin/fetch-active-users-details',
        method: 'GET',
        success: function(response) {
            $('#activeUsersList').empty(); // Clear the previous list

            if (response.activeUsers.length === 0) {
                // Display a message if there are no active users
                $('#activeUsersList').append(`
                    <li class="list-group-item text-center">
                        No active users currently.
                    </li>
                `);
            } else {
                // Populate the list with active users
                response.activeUsers.forEach(user => {
                    $('#activeUsersList').append(`
                        <li class="list-group-item d-flex align-items-center">
                            <img src="${user.profile_photo_url}" 
                                 alt="Profile Photo" 
                                 class="rounded-circle border" 
                                 style="width: 35px; height: 35px; object-fit: cover; margin-right: 8px;">
                            <span>${user.name} (${user.email})</span>
                        </li>
                    `);
                });
            }

            $('#activeUsersModal').modal('show'); // Show the modal
        },
        error: function() {
            console.error("Failed to fetch active users details.");
        }
    });
}


    // Set up event listener for clicking the active users count box
    $('#activeUsersCountBox').on('click', fetchActiveUsersDetails);

    // Fetch the active users count every 10 seconds
    setInterval(fetchActiveUsersCount, 10000);

    // Fetch immediately on page load
    fetchActiveUsersCount();
</script>
<!-- JavaScript for Sortable Dashboard and Layout Saving 
<script>
$(function () {
    // Enable sorting for all dashboard boxes
    $(".sortable-dashboard").sortable({
        placeholder: "ui-state-highlight", // Optional styling for the dragged placeholder
        update: function (event, ui) {
            let sortedIDs = $(this).sortable("toArray"); // Get the new order of elements
            console.log(sortedIDs); // Log the new order for testing

            // Save the order to the server using AJAX
            $.ajax({
                url: "{{ route('admin.saveDashboardLayout') }}",
                method: "POST",
                data: {
                    order: sortedIDs,
                    _token: "{{ csrf_token() }}"
                },
                success: function(response) {
                    console.log('Dashboard order saved successfully.');
                },
                error: function() {
                    console.log('Error saving the dashboard order.');
                }
            });
        }
    });

    // Disable text selection while dragging
    $(".sortable-dashboard").disableSelection();

    // Apply saved dashboard layout (if any) on page load
    let savedOrder = @json($dashboardOrder); // Get the saved layout from the controller

    if (savedOrder && savedOrder.length > 0) {
        // Loop through the saved IDs and append the elements in the correct order
        $.each(savedOrder, function (index, value) {
            $("#" + value).appendTo(".sortable-dashboard");
        });
    }
});
</script>


<script>
    document.getElementById('reset-layout-btn').addEventListener('click', function() {
        if (confirm('Are you sure you want to reset the dashboard layout to its default?')) {
            $.ajax({
    url: "{{ route('user.resetDashboardLayout') }}",
    method: "POST",
    data: {
        _token: "{{ csrf_token() }}",  // Make sure this is correct
    },
    success: function(response) {
        if (response.success) {
            alert(response.message);
            location.reload();  // Reload the page after reset
        }
    },
    error: function(xhr, status, error) {
        console.log(xhr.responseText);  // Log any error for debugging
        alert('An error occurred while resetting the layout.');
    }
});

        }
    });



</script>-->

