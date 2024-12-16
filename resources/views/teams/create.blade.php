<x-app-layout>
    <x-slot name="header">
           <div class="d-flex justify-content-between align-items-center">
    <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Create Team') }}
        </h2>
        <a href="javascript:void(0);" id="task-details-back-btn" onclick="history.back();" class="btn btn-danger btn-sm">
                <i class="fas fa-arrow-left"></i> Back
            </a>
        </div>
    </x-slot>

    <div class="py-12">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-10 col-sm-12">
                    <div class="card shadow-lg border-0 mb-4">
                        <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center py-3">
                            <h6 class="m-0 font-weight-bold">Create a New Team</h6>
                        </div>
                        <div class="card-body">
                            @if ($errors->any())
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif
                            <form method="POST" action="{{ route('user.teams.store') }}" enctype="multipart/form-data">
                                @csrf

                                <!-- Team Name and Description -->
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="name" class="font-weight-bold">Team Name</label>
                                        <input type="text" name="name" id="name" class="form-control" value="{{ old('name') }}" required>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="description" class="font-weight-bold">Description</label>
                                        <textarea name="description" id="description" class="form-control" rows="1">{{ old('description') }}</textarea>
                                    </div>
                                </div>

                                <!-- Members Selection with Profile Pictures -->
                                <div class="form-group">
                                    <label for="members" class="font-weight-bold">Members</label>
                                    <!-- Members Selection with Profile Pictures -->
                                    <select name="members[]" id="members" class="form-control" multiple="multiple">
                                        @foreach ($users as $user)
                                            <option value="{{ $user->id }}" data-image="{{ $user->profile_photo_path ? asset('storage/' . $user->profile_photo_path) : asset('dist/img/avatar5.png') }}"
                                                {{ (collect(old('members'))->contains($user->id)) ? 'selected' : '' }}>
                                                {{ $user->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>

                                <!-- Points and Rewards Selection -->
                                <div class="form-group">
                                    <label for="has_rewards" class="font-weight-bold">Enable Points and Rewards</label>
                                    <select name="has_rewards" id="has_rewards" class="form-control">
                                        <option value="1">With Points and Rewards</option>
                                        <option value="0">Normal</option>
                                    </select>
                                </div>

                                <!-- Image Upload -->
                                <div class="form-group">
                                    <label for="team_image" class="font-weight-bold">Upload Team Image</label>
                                    <input type="file" name="team_image" id="team_image" class="form-control">
                                </div>

                                <!-- Grading System Information -->
                                <div class="card mt-4 p-3 bg-light border-left-primary">
                                    <div class="font-weight-bold text-primary mb-2">
                                        <i class="fas fa-info-circle mr-1"></i> Grading Information:
                                    </div>
                                
                                    <!-- Priority Grading -->
                                    <p class="mb-1"><strong>Based on Priority:</strong></p>
                                    <ul class="mb-2">
                                        <li style="color: #ff6b6b;"><strong>High = 55pts</strong></li> <!-- Red for High -->
                                        <li style="color: #feca57;">Medium = 35pts</li> <!-- Yellow for Medium -->
                                        <li style="color: #1dd1a1;">Easy = 15pts</li> <!-- Green for Easy -->
                                    </ul>
                                
                                    <!-- Team Leader's Grading System -->
                                    <p class="mb-1"><strong>Team Leader's Grading System:</strong></p>
                                    <ul class="mb-2">
                                        <li style="color: #48bb78;">Excellent = 50pts</li> <!-- Green for Excellent -->
                                        <li style="color: #f6e05e;">Very Good = 30pts</li> <!-- Yellow for Very Good -->
                                        <li style="color: #63b3ed;">Good = 10pts</li> <!-- Blue for Good -->
                                    </ul>
                                    <p class="text-muted font-italic">Note: Points are fixed based on priority and grading by the Team Leader.</p>
                                </div>


                                <!-- Submit Button -->
                                <div class="form-group mt-4 d-flex justify-content-end">
                                    <button type="submit" class="btn btn-primary btn-lg shadow-sm">Create Team</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>

<!-- Custom JS for Select2 with Profile Pictures -->
<script>
    $(document).ready(function() {
        $('#members').select2({
            placeholder: 'Select members',
            allowClear: true,
            templateResult: formatUserOption,
            templateSelection: formatUserOption,
            dropdownAutoWidth : true,
            width: '100%'
        });
        
        function formatUserOption(option) {
            if (!option.id) {
                return option.text;
            }
            var imgSrc = $(option.element).data('image');
            if (imgSrc) {
                var $option = $(
                    `<span><img src="${imgSrc}" class="rounded-circle mr-2" style="width: 20px; height: 20px; object-fit: cover;"> ${option.text}</span>`
                );
                return $option;
            }
            return option.text;
        }
    });
</script>

<style>
    /* Responsive styling */
    .form-control, .form-select {
        padding: 0.5rem;
        font-size: 0.95rem;
    }
    .select2-container--default .select2-selection--multiple .select2-selection__choice {
        background-color: #4b5563;
        color: white;
        border-radius: 4px;
        margin-right: 4px;
    }
    .card {
        border-radius: 8px;
    }
    .card-header {
        font-size: 1.1rem;
    }
    .alert ul {
        padding-left: 1.5rem;
    }
</style>
