<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
               <!-- Navigation Blade: dark mode toggle button -->
        <button id="darkModeToggle" class="btn btn-secondary">
            <i id="toggleIcon" class="fas fa-sun"></i>
        </button>


        <script>
            var authUserAvatar = @json(Auth::user()->profile_photo_path 
    ? asset('storage/' . Auth::user()->profile_photo_path) 
    : asset('dist/img/avatar5.png'));
        </script>

<!-- Chat Notifications Dropdown -->
@php
$messageNotifications = auth()->user()->notifications()
    ->where('type', 'App\Notifications\NewMessageNotification')
    ->get();

$newUserAdminMessageNotifications = auth()->user()->notifications()
    ->where('type', 'App\Notifications\NewUserAdminMessageNotification')
    ->get();

$allMessageNotifications = $messageNotifications->merge($newUserAdminMessageNotifications);
@endphp

<!-- Chat Notifications Dropdown -->

<li class="nav-item dropdown">
    <a class="nav-link" data-toggle="dropdown" href="#">
        <i class="fas fa-comments"></i>
        @php
            $allMessageNotificationsCount = $unreadNotifications->whereIn('type', ['App\Notifications\NewMessageNotification', 'App\Notifications\NewUserAdminMessageNotification'])->count();
        @endphp
        @if($allMessageNotificationsCount > 0)
            <span class="badge badge-danger navbar-badge chat-notification-count">{{ $allMessageNotificationsCount }}</span>
        @endif
    </a>
    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right custom-dropdown">
        <span class="dropdown-item dropdown-header">{{ $allMessageNotifications->count() }} New Messages</span>
        <div class="notification-list custom-scroll" style="max-height: 240px; overflow-y: auto;">
            @foreach($allMessageNotifications as $notification)
                <div class="dropdown-divider"></div>
                <div class="d-flex align-items-center justify-content-between px-2">
                    <a href="{{ route('notifications.markAsRead', $notification->id) }}{{ isset($notification->data['team_id']) ? '?redirect_to=/teams/' . $notification->data['team_id'] . '/messages/' . $notification->data['message_id'] : '' }}" class="dropdown-item w-100 d-flex align-items-center">
                        <img 
                            src="{{ $notification->data['sender_avatar'] ?? asset('dist/img/avatar5.png') }}" 
                            alt="User Avatar" 
                            class="rounded-circle mr-3" 
                            style="width: 50px; height: 50px; object-fit: cover; align-self: center;"
                            onerror="this.src='{{ asset('dist/img/avatar5.png') }}';" 
                        >
                        <div class="media-body">
                            <p class="mb-0 text-sm font-weight-bold">
                                @if ($notification->type === 'App\\Notifications\\NewUserAdminMessageNotification')
                                    {{ Auth::user()->usertype === 'admin' ? 'New User Message' : 'New Admin Message' }}
                                @else
                                   {{ $notification->data['team_name'] ?? 'New Message' }}
                                @endif
                            </p>

                            <p class="mb-0 text-sm {{ is_null($notification->read_at) ? 'font-weight-bold' : '' }}">
                                {{ $notification->data['sender_name'] ?? '' }}: {{ $notification->data['message_body'] ?? $notification->data['message'] }}
                            </p>
                            <p class="text-muted text-sm mb-0">
                                <i class="fas fa-clock mr-1"></i> {{ $notification->created_at->diffForHumans() }}
                            </p>
                        </div>
                    </a>
                    <form method="POST" action="{{ route('notifications.delete', $notification->id) }}" style="display: inline;">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-sm btn-danger ml-2">
                            <i class="fas fa-trash"></i>
                        </button>
                    </form>
                </div>
            @endforeach
        </div>
        <!-- Footer Actions for Chat Notifications -->
        <div class="sticky-footer p-2 text-center">
            <a href="#" id="markAllChatAsRead" class="btn btn-primary btn-sm mb-2">
                <i class="fas fa-check-circle mr-2"></i> Mark All as Read
            </a>
            <form method="POST" action="{{ route('notifications.deleteAllChat') }}">
                @csrf
                @method('DELETE')
                <button type="submit" class="btn btn-danger btn-sm">
                    <i class="fas fa-trash-alt mr-2"></i> Delete All Notifications
                </button>
            </form>
        </div>
    </div>
</li>



@php
    // Fetch unread notifications for the authenticated user
    $unreadNotifications = auth()->user()->unreadNotifications()
        ->whereIn('type', [
            'App\Notifications\TaskAssigned',
            'App\Notifications\TaskDueReminderNotification',
            'App\Notifications\TaskOverdueNotification',
            'App\Notifications\TaskProgressUpdated',
            'App\Notifications\RewardRedeemedNotification',
            'App\Notifications\BadgeUnlocked',
            'App\Notifications\FeedbackSubmitted', 
            'App\Notifications\InvitationResponseNotification',
            'App\Notifications\TeamInvitation',
            'App\Notifications\TeamMemberLeftNotification',
            'App\Notifications\TaskRejectedNotification',
            'App\Notifications\TaskResubmittedNotification',
            'App\Notifications\ViewActivityLogNotification',
            'App\Notifications\TaskApprovedNotification',

        ])
        ->get();

    // Get all notifications (both read and unread)
    $taskNotifications = auth()->user()->notifications()
        ->whereIn('type', [
            'App\Notifications\TaskAssigned',
            'App\Notifications\TaskDueReminderNotification',
            'App\Notifications\TaskOverdueNotification',
            'App\Notifications\TaskProgressUpdated',
            'App\Notifications\RewardRedeemedNotification',
            'App\Notifications\BadgeUnlocked',
            'App\Notifications\FeedbackSubmitted', 
             'App\Notifications\InvitationResponseNotification',
             'App\Notifications\TeamInvitation',
             'App\Notifications\TeamMemberLeftNotification',
             'App\Notifications\TaskRejectedNotification',
             'App\Notifications\TaskResubmittedNotification',
             'App\Notifications\ViewActivityLogNotification',
              'App\Notifications\TaskApprovedNotification',
        ])
        ->get();

    // Count unread notifications
    $taskNotificationsCount = $unreadNotifications->count();
@endphp

<!-- Task Notifications Dropdown -->
<li class="nav-item dropdown">
    <a class="nav-link" data-toggle="dropdown" href="#">
        <i class="fas fa-bell"></i>
        @if($taskNotificationsCount > 0)
            <span class="badge badge-warning navbar-badge task-notification-count">{{ $taskNotificationsCount }}</span>
        @endif
    </a>
    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right custom-dropdown p-0">
        <span class="dropdown-item dropdown-header">{{ $taskNotifications->count() }} Notifications</span>
        
        <div class="notification-list custom-scroll" style="max-height: 240px; overflow-y: auto;">
            @foreach($taskNotifications as $notification)
                <div class="dropdown-divider"></div>
                <div class="d-flex align-items-start px-2 py-2">
                    <!-- Icon or image to the left if any -->
                    <i class="fas fa-info-circle mr-3 mt-1"></i>
                    
                    <!-- Notification Content -->
                    <div class="media-body">
                        @if ($notification->type == 'App\Notifications\FeedbackSubmitted')
                            <p class="text-sm font-weight-bold mb-0">Feedback</p>
                            <a href="{{ $notification->data['feedback_url'] }}" class="text-sm text-truncate d-block"
                               style="max-width: 180px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                {{ $notification->data['message'] }}
                            </a>
                            
                         @elseif ($notification->type == 'App\Notifications\TaskAssigned')
                                 <!-- Task Assigned Notification -->
                        <a href="{{ route('user.tasks.show', $notification->data['task_id']) }}" class="text-decoration-none">
                            <p class="text-sm font-weight-bold">New Task Assigned</p>
                            <p class="text-sm">{{ $notification->data['task_name'] ?? 'Task Details Unavailable' }}</p>
                            <p class="text-sm">{{ $notification->data['message'] ?? '' }}</p>
                        </a>
                        
                        @elseif ($notification->type == 'App\Notifications\TaskResubmittedNotification')
                        <p class="text-sm font-weight-bold">Task Resubmission</p>
                        <p class="text-sm">{{ $notification->data['message'] }}</p>
                        <p class="text-sm">Task: {{ $notification->data['task_name'] }}</p>
                        <a href="{{ route('user.tasks.show', $notification->data['task_id']) }}" class="btn btn-primary btn-sm">View Task</a>
                   
                        
                         @elseif ($notification->type == 'App\Notifications\InvitationResponseNotification')
                        <!-- Team Invitation Response Notification -->
                        <p class="text-sm font-weight-bold">Team Invitation Response</p>
                        <p class="text-sm">{{ $notification->data['message'] }}</p>
                        <p class="text-sm">Team: {{ $notification->data['team_name'] ?? 'Unknown Team' }}</p>
                        
                       @elseif ($notification->type == 'App\Notifications\TeamInvitation')
                        <!-- Team Invitation Notification -->
                        <a href="{{ route('invitations.index') }}" class="text-decoration-none">
                            <p class="text-sm font-weight-bold">Team Invitation</p>
                            <p class="text-sm">{{ $notification->data['message'] ?? 'No message available' }}</p>
                            <p class="text-sm">Team Name: {{ $notification->data['team_name'] ?? 'Unknown Team' }}</p>
                            <p class="text-sm">Invited by: {{ $notification->data['inviter_name'] ?? 'Unknown User' }}</p>
                            
                        </a>
                        
                    @elseif ($notification->type == 'App\Notifications\TaskRejectedNotification')
                        <a href="{{ route('user.tasks.show', $notification->data['task_id']) }}" class="text-decoration-none">
                            <p class="text-sm font-weight-bold">Task Rejection</p>
                            <p class="text-sm">{{ $notification->data['message'] ?? 'This task has been rejected' }}</p>
                            <p class="text-sm">Task: {{ $notification->data['task_name'] }}</p>
                            <p class="text-sm">Team: {{ $notification->data['team_name'] }}</p>
                            @if(!empty($notification->data['rejection_remarks']))
                                <p class="text-sm">Remarks: {{ $notification->data['rejection_remarks'] }}</p>
                            @endif
                        </a>
                        
                       @elseif ($notification->type == 'App\Notifications\TaskApprovedNotification')
                            <!-- Task Approved Notification -->
                            <div class="notification">
                                <a href="{{ url('/tasks/' . $notification->data['task_id']) }}">
                                <h4>Task Approved</h4>
                                <!-- Display the message (default or from the notification data) -->
                                <p class="text-sm">{{ $notification->data['message'] ?? 'Your task has been approved' }}</p>
                                <!-- Task Name -->
                                <p class="text-sm"><strong>Task:</strong> {{ $notification->data['task_name'] }}</p>
                                <!-- Team Name -->
                                <p class="text-sm"><strong>Team:</strong> {{ $notification->data['team_name'] }}</p>
                                <!-- You can add any extra info or links if necessary -->
                                </a>
                            </div>
                        

                        
                        
                        @elseif ($notification->type == 'App\Notifications\ViewActivityLogNotification')
                            <!-- View Activity Log Notification -->
                            <a href="{{ route('activity-log.view', $notification->data['user_id'] ?? '#') }}" class="text-decoration-none">
                                <p class="text-sm font-weight-bold">Activity Log Viewed</p>
                                <p class="text-sm">{{ $notification->data['message'] ?? 'No message available' }}</p>
                                
                                <p class="text-sm">Viewed on: {{ \Carbon\Carbon::parse($notification->data['viewed_at'])->format('M d, Y H:i:s') ?? 'Unknown Date' }}</p>
                            </a>


                        
                         @elseif ($notification->type == 'App\Notifications\TaskDueReminderNotification')
                    <!-- Task Due Reminder -->
                        <a href="{{ route('user.tasks.show', $notification->data['task_id']) }}" class="text-decoration-none">
                            <p class="text-sm font-weight-bold">Task Due Reminder</p>
                            <p class="text-sm">{{ $notification->data['task_name'] ?? 'Task Details Unavailable' }}</p>
                            <p class="text-sm">{{ $notification->data['message'] ?? '' }}</p>
                        </a>
                        
                        @elseif ($notification->type == 'App\Notifications\TeamMemberLeftNotification')
                        <!-- Team Member Left-->
                        <p class="text-sm font-weight-bold">Team Member Left</p>
                        <p class="text-sm">{{ $notification->data['message'] }}</p>
                        <a href="{{ route('teams.show', ['team' => $notification->data['team_id']]) }}" class="text-decoration-none">View Team</a>
                        

                        
                         @elseif ($notification->type == 'App\Notifications\TaskOverdueNotification')
                    <!-- Task Overdue Notification -->
                    <p class="text-sm font-weight-bold">Task Overdue</p>
                    <p class="text-sm">{{ $notification->data['task_name'] ?? 'Task Details Unavailable' }}</p>
                    <p class="text-sm">{{ $notification->data['message'] ?? '' }}</p>

                         @elseif ($notification->type == 'App\Notifications\TaskProgressUpdated')
                            <!-- Task Progress Updated Notification -->
                        <a href="{{ route('teams.show', $notification->data['team_id']) }}" class="text-decoration-none">
                            <p class="text-sm font-weight-bold">Task Progress Updated</p>
                            <p class="text-sm">{{ $notification->data['message'] }}</p>
                            <p class="text-sm">Team: {{ $notification->data['team_name'] }}</p>
                        </a>
                        
                          @elseif ($notification->type == 'App\Notifications\RewardRedeemedNotification')
                    <!-- Reward Redeemed Notification -->
                    <p class="text-sm font-weight-bold">Reward Redeemed</p>
                    <!--<p class="text-sm">{{ $notification->data['reward_name'] ?? 'Reward Details Unavailable' }}</p>-->
                    <p class="text-sm">{{ $notification->data['message'] ?? '' }}</p>
                    
                        @elseif ($notification->type == 'App\Notifications\BadgeUnlocked')
                        <!-- Badge Unlocked Notification -->
                        <a href="{{ route('profile.index') }}" class="text-decoration-none">
                            <p class="text-sm font-weight-bold">Badge Unlocked: {{ $notification->data['badge_name'] }}</p>
                            <p class="text-sm">{{ $notification->data['message'] }}</p>
                            <img src="{{ asset($notification->data['icon']) }}" alt="Badge Icon" style="width: 20px; height: 20px;">
                        </a>

                        @else
                            <!-- Generic Fallback for Any Other Notification Type -->
                    <p class="text-sm font-weight-bold">{{ $notification->data['title'] ?? 'Notification' }}</p>
                    <p class="text-sm">{{ $notification->data['message'] ?? 'Details Unavailable' }}</p>
 <!-- Other types of notifications can go here -->
                        @endif
                        
                        <!-- Timestamp -->
                        <p class="text-muted text-xs mt-1">
                            <i class="fas fa-clock mr-1"></i> {{ $notification->created_at->diffForHumans() }}
                        </p>
                    </div>
                    
                    <!-- Delete Button -->
                    <form method="POST" action="{{ route('notifications.delete', $notification->id) }}" class="ml-2">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-sm btn-danger p-1">
                            <i class="fas fa-trash"></i>
                        </button>
                    </form>
                </div>
            @endforeach
        </div>

        <!-- Footer Actions for Notifications -->
        <div class="sticky-footer p-2 text-center">
            <a href="{{ route('notifications.markAllAsRead') }}" class="btn btn-primary btn-sm mb-2 w-100">
                <i class="fas fa-check-circle mr-2"></i> Mark All as Read
            </a>
            <form method="POST" action="{{ route('notifications.deleteAllTask') }}">
        @csrf
        @method('DELETE')
        <button type="submit" class="btn btn-danger btn-sm">
            <i class="fas fa-trash-alt mr-2"></i> Delete All Notifications
        </button>
    </form>
        </div>
    </div>
</li>

        </li>
        <li class="nav-item">
            <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                <i class="fas fa-expand-arrows-alt"></i>
            </a>
        </li>
       <!-- Profile Dropdown Menu -->
<li class="nav-item dropdown">
    <a class="nav-link" data-toggle="dropdown" href="#">
<span class="d-inline small">{{ Auth::user()->name }}</span>
    </a>
    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right custom-dropdown">
        <a class="dropdown-item" href="{{ route('profile.index') }}">
            <i class="fas fa-user fa-sm fa-fw mr-2"></i>
            Profile
        </a>
        <a class="dropdown-item" href="{{ route('user.settings') }}">
            <i class="fas fa-cogs fa-sm fa-fw mr-2"></i>
            Settings
        </a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="{{ route('logout') }}"
            onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2"></i>
            Logout
        </a>
        <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
            @csrf
        </form>
    </div>
</li>
    </ul>
</nav>

       
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const toggleIcon = document.getElementById('toggleIcon');

        // Set initial icon based on current dark mode status in localStorage
        if (localStorage.getItem('darkMode') === 'enabled') {
            toggleIcon.classList.remove('fa-sun');
            toggleIcon.classList.add('fa-moon');
        } else {
            toggleIcon.classList.remove('fa-moon');
            toggleIcon.classList.add('fa-sun');
        }

        // Listen for changes in dark mode status by observing the toggle button click in app.blade.php
        document.getElementById('darkModeToggle').addEventListener('click', function () {
            if (document.body.classList.contains('dark-mode')) {
                toggleIcon.classList.remove('fa-sun');
                toggleIcon.classList.add('fa-moon');
            } else {
                toggleIcon.classList.remove('fa-moon');
                toggleIcon.classList.add('fa-sun');
            }
        });
    });
</script>
<!-- Custom CSS -->
<!-- Custom CSS -->
<style>
   

           /* Icon Transition */
#toggleIcon {
    transition: transform 0.5s ease, color 0.5s ease;
}

/* Rotate the icon when toggling dark mode */
body.dark-mode #toggleIcon {
    transform: rotate(360deg); /* Rotate 360 degrees on toggle */
    color: #ffd700; /* Yellow color for moon icon */
}

body:not(.dark-mode) #toggleIcon {
    color: #ffa500; /* Orange color for sun icon */
}

       
    /* Button Styling */
    .btn {
        padding: 0.4rem 1rem;
        font-size: 0.875rem;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    /* Small Button Adjustments */
    .btn-sm {
        font-size: 0.8rem;
        padding: 0.25rem 0.75rem;
        display: inline-flex;
        align-items: center;
    }

    /* Dropdown Styles */
    .custom-dropdown {
        background-color: #343a40; /* Darker background for dropdown */
        color: #ffffff; /* Default text color for dropdown */
        border: 1px solid #444; /* Border to differentiate from other components */
    }

    /* Dropdown Item Styles */
    .custom-dropdown .dropdown-item {
        color: #ffffff; /* Default text color in dropdown */
        padding: 0.75rem 1.25rem;
    }

    /* Dropdown Icon Adjustments */
    .custom-dropdown .dropdown-item i {
        margin-right: 0.5rem;
        color: #ffffff; /* Ensure icons are visible */
    }

    /* Hover Effect */
    .custom-dropdown .dropdown-item:hover {
        background-color: #495057; /* Slightly lighter on hover */
        color: #ffffff !important;
    }

    /* Sticky Footer for Dropdowns */
    .sticky-footer a.btn, .sticky-footer button.btn {
        width: 100%;
        margin-bottom: 0.5rem;
    }

    /* Scrollbar Customization */
    .custom-scroll {
        scrollbar-width: thin;
        scrollbar-color: #007bff #343a40;
    }

    .custom-scroll::-webkit-scrollbar {
        width: 8px;
    }

    .custom-scroll::-webkit-scrollbar-track {
        background: #343a40;
    }

    .custom-scroll::-webkit-scrollbar-thumb {
        background-color: #007bff;
        border-radius: 10px;
        border: 2px solid #343a40;
    }

    .custom-scroll::-webkit-scrollbar-thumb:hover {
        background-color: #0056b3;
    }

    /* Adjustments for Dark Mode Toggle Button */
#darkModeToggle {
    background-color: transparent; /* Transparent background */
    color: #ffffff; /* Icon color */
    border: none; /* Remove border */
    padding: 10px 15px; /* Match padding with other icons */
    margin-top: 3px; /* Remove extra margin */
    outline: none; /* Remove outline on focus */
    height: 40px; /* Match height of other icons */
    width: 50px; /* Optional: ensures uniform width */
    display: inline-flex; /* Align icon inline with other items */
    align-items: center; /* Center icon vertically */
    justify-content: center; /* Center icon horizontally */
    cursor: pointer; /* Add pointer cursor */
}
/* Target the sun/moon icon inside the dark mode toggle button */
#darkModeToggle i {
    font-size: 1.2rem; /* Adjust this value to make the icon larger or smaller */
    line-height: 1; /* Ensures icon doesn’t add extra spacing */
}

/* Hover effect with more contrast */
/* Hover effect directly targeting the icon within the button */
#darkModeToggle:hover i {
    color: #ffd700; /* Bright yellow for higher visibility */
}
</style>
<script>
    
    function adjustDropdownTextColor() {
    const dropdowns = document.querySelectorAll('.custom-dropdown');

    dropdowns.forEach(dropdown => {
        const bgColor = window.getComputedStyle(dropdown).backgroundColor;
        const brightness = getBrightness(rgbToHex(bgColor)); // Use your existing brightness function

        // If the background is too light, use darker text
        if (brightness > 128) {
            dropdown.style.color = '#000000'; // Dark text for light background
        } else {
            dropdown.style.color = '#ffffff'; // Light text for dark background
        }
    });
}
</script>
<script>
       $(document).on('click', '#markAllChatAsRead', function(e) {
    e.preventDefault();

    $.ajax({
        url: '{{ route("notifications.markAllChatAsRead") }}',
        method: 'GET',
        success: function(response) {
            // Update the notification count on the frontend
            $('.chat-notification-count').text('0');  // Reset count to zero
            $('.chat-notification-list').empty();     // Optionally, clear notification list
        },
        error: function(xhr, status, error) {
            console.log("An error occurred: " + error);
        }
    });
});


    $(document).on('click', '#markAllTaskAsRead', function(e) {
        e.preventDefault();
        $.ajax({
            url: '{{ route("notifications.markAllTaskAsRead") }}',
            method: 'GET',
            success: function(response) {
                console.log("AJAX response received", response);
                // Update the task notification count on the front-end
                $('.task-notification-count').text(response.unreadTaskCount);

                // Optionally, you can also clear the notification dropdown if necessary
                $('.task-notification-list').empty();
            },
            error: function(xhr, status, error) {
                console.log("An error occurred: " + error);
            }
        });
    });
    </script>


      
<!-- /.navbar -->