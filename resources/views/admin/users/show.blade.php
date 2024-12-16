<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-black-200 leading-tight">
            {{ __('User Details') }}
        </h2>
    </x-slot>

    <div class="container mt-5">
        <!-- User Profile Box -->
        <div class="card card-widget widget-user mb-4">
            <div class="widget-user-header bg-primary">
                <h3 class="widget-user-username text-white">{{ $user->name }}</h3>
                <h5 class="widget-user-desc text-white">{{ $user->email }}</h5>
            </div>
            <div class="widget-user-image">
                <img class="img-circle elevation-2"
                     src="{{ $user->profile_photo_path ? asset('storage/' . $user->profile_photo_path) : asset('dist/img/avatar5.png') }}"
                     alt="User Avatar"
                     style="width: 90px; height: 90px; object-fit: cover;">
            </div>
            <div class="card-footer">
                <div class="row">
                    <div class="col-sm-6 border-right">
                        <div class="description-block">
                            <h5 class="description-header">{{ $user->tasks_count }}</h5>
                            <span class="description-text">TOTAL TASKS</span>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="description-block">
                            <h5 class="description-header">{{ $user->tasks_done_count }}</h5>
                            <span class="description-text">TASKS DONE</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Personal Information and Task Details -->
        <div class="row">
            <!-- User Information Panel -->
            <div class="col-md-6 mb-4">
                <div class="card card-primary card-outline">
                    <div class="card-header">
                        <h3 class="card-title">Personal Information</h3>
                    </div>
                    <div class="card-body">
                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item"><b>Full Name:</b> <span class="float-right">{{ $user->full_name ?? 'N/A' }}</span></li>
                            <li class="list-group-item"><b>Email:</b> <span class="float-right">{{ $user->email }}</span></li>
                            <li class="list-group-item"><b>About Me:</b> <span class="float-right">{{ $user->about_me ?? 'No information provided.' }}</span></li>
                            <li class="list-group-item"><b>Skills:</b> <span class="float-right">{{ $user->skills ? implode(', ', json_decode($user->skills, true) ?? []) : 'No information provided.' }}</span></li>
                            <li class="list-group-item"><b>Education:</b> <span class="float-right">{{ $user->education ?? 'No information provided.' }}</span></li>
                            <li class="list-group-item"><b>Bio:</b> <span class="float-right">{{ $user->bio ?? 'No information provided.' }}</span></li>
                            <li class="list-group-item"><b>Address:</b> <span class="float-right">{{ $user->address ?? 'No information provided.' }}</span></li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Task Summary Panel -->
            <div class="col-md-6 mb-4">
                <div class="card card-success card-outline">
                    <div class="card-header">
                        <h3 class="card-title">Task Summary</h3>
                    </div>
                    <div class="card-body">
                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item"><b>Tasks Not Started:</b> <span class="float-right">{{ $user->tasks_not_started_count }}</span></li>
                            <li class="list-group-item"><b>Tasks In Progress:</b> <span class="float-right">{{ $user->tasks_in_progress_count }}</span></li>
                            <li class="list-group-item"><b>Tasks Done:</b> <span class="float-right">{{ $user->tasks_done_count }}</span></li>
                        </ul>

                        <!-- Modal Trigger Button -->
                        <div class="mt-4 text-center">
                            <button class="btn btn-info btn-block" data-toggle="modal" data-target="#activityLogModal">
                                View Activity Log
                            </button>
                        </div>

                        <div class="text-center mt-3">
                            <a href="{{ route('admin.users.index') }}" class="btn btn-primary">
                                <i class="fas fa-arrow-left"></i> Back
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Activity Log Modal -->
    <div class="modal fade" id="activityLogModal" tabindex="-1" role="dialog" aria-labelledby="activityLogModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="activityLogModalLabel">Activity Log</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    @include('profile.partials.activity-log')
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
