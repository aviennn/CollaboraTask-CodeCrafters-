<!-- resources/views/profile/partials/new-update-password-form.blade.php -->
<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-black dark:text-black leading-tight">
            <i class="fas fa-lock mr-2"></i> {{ __('Update Password') }}
        </h2>
    </x-slot>

    <style>
        /* Custom styling remains the same */
        .card-custom {
            max-width: 500px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        .card-header-custom {
            background-color: #333;
            color: #ffffff;
            text-align: center;
            font-weight: bold;
        }
        .form-control-custom {
            background-color: #f5f5f5;
            color: #333;
            border: 1px solid #ccc;
            transition: all 0.2s ease;
        }
        .form-control-custom:focus {
            border-color: #333;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }
        .dark .form-control-custom {
            background-color: #444;
            color: #e5e5e5;
            border: 1px solid #666;
        }
        .btn-custom {
            background-color: #333;
            color: #ffffff;
            border: none;
            width: 100%;
            padding: 0.6rem 1rem;
            font-size: 1rem;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease, box-shadow 0.2s ease;
        }
        .btn-custom:hover {
            background-color: #4a4a4a;
            color: #ffffff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
        .dark .btn-custom {
            background-color: #555;
            color: #ffffff;
        }
        .dark .btn-custom:hover {
            background-color: #666;
            color: #ffffff;
        }
        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }
        .eye-icon {
            position: absolute;
            right: 10px;
            cursor: pointer;
            color: #666;
        }
        .dark .eye-icon {
            color: #bbb;
        }
        .text-red-500 {
    color: #ff0000; /* Red color for error messages */
    font-size: 0.875rem; /* Small font size */
    margin-top: 5px;
}

    </style>

    <div class="container mt-5">
        <div class="card card-custom mx-auto bg-white dark:bg-gray-900">
            <div class="card-header card-header-custom">
                <i class="fas fa-lock mr-1"></i> Update Password
            </div>
            <div class="card-body p-4">
                <!-- Success message, initially hidden -->
                <div id="success-message" class="alert alert-success mt-4 text-center p-3 rounded" style="background-color: #28a745; color: #fff; display: none;">
                    <i class="fas fa-check-circle"></i> {{ __('Password updated successfully.') }}
                </div>

                <form id="password-update-form" class="space-y-6">
                    @csrf
                    @method('put')

                    <!-- Current Password Input -->
                    <div class="form-group mb-3 position-relative">
                        <label for="current_password" class="text-black dark:text-black font-weight-bold">
                            <i class="fas fa-key mr-1"></i> Current Password
                        </label>
                        <div class="input-wrapper">
                            <input id="current_password" 
                                   name="current_password" 
                                   type="password" 
                                   class="form-control form-control-custom"
                                   autocomplete="current-password"
                                   placeholder="Enter current password" />
                            <span class="eye-icon" onclick="togglePasswordVisibility('current_password', 'toggleCurrentPasswordIcon')">
                                <i class="fas fa-eye" id="toggleCurrentPasswordIcon"></i>
                            </span>
                        </div>
                        <p class="text-red-500 text-xs mt-1" id="current_password_error"></p>
                    </div>

                    <!-- New Password Input -->
                    <div class="form-group mb-3 position-relative">
                        <label for="password" class="text-black dark:text-black font-weight-bold">
                            <i class="fas fa-lock mr-1"></i> New Password
                        </label>
                        <div class="input-wrapper">
                            <input id="password" 
                                   name="password" 
                                   type="password" 
                                   class="form-control form-control-custom"
                                   autocomplete="new-password"
                                   placeholder="Enter new password" />
                            <span class="eye-icon" onclick="togglePasswordVisibility('password', 'toggleNewPasswordIcon')">
                                <i class="fas fa-eye" id="toggleNewPasswordIcon"></i>
                            </span>
                        </div>
                        <p class="text-red-500 text-xs mt-1" id="password_error"></p>
                    </div>

                    <!-- Confirm New Password Input -->
                    <div class="form-group mb-3 position-relative">
                        <label for="password_confirmation" class="text-black dark:text-black font-weight-bold">
                            <i class="fas fa-lock mr-1"></i> Confirm Password
                        </label>
                        <div class="input-wrapper">
                            <input id="password_confirmation" 
                                   name="password_confirmation" 
                                   type="password" 
                                   class="form-control form-control-custom"
                                   autocomplete="new-password"
                                   placeholder="Confirm new password" />
                            <span class="eye-icon" onclick="togglePasswordVisibility('password_confirmation', 'toggleConfirmPasswordIcon')">
                                <i class="fas fa-eye" id="toggleConfirmPasswordIcon"></i>
                            </span>
                        </div>
                        <p class="text-red-500 text-xs mt-1" id="password_confirmation_error"></p>
                    </div>

                    <!-- Save Button -->
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-custom">
                            <i class="fas fa-save mr-1"></i> Save Changes
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function togglePasswordVisibility(fieldId, iconId) {
            const passwordField = document.getElementById(fieldId);
            const toggleIcon = document.getElementById(iconId);

            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            } else {
                passwordField.type = 'password';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            }
        }

        // Handle AJAX form submission
        document.getElementById('password-update-form').addEventListener('submit', function(event) {
    event.preventDefault();
    const form = event.target;

    // Clear previous errors
    document.getElementById('current_password_error').innerText = '';
    document.getElementById('password_error').innerText = '';
    document.getElementById('password_confirmation_error').innerText = '';

    // Prepare form data
    const formData = new FormData(form);

    // Send AJAX request
    fetch("{{ route('profile.new_password_update') }}", {
        method: 'POST',
        headers: {
            'X-CSRF-TOKEN': formData.get('_token'),
            'Accept': 'application/json',
        },
        body: formData
    })
    .then(response => response.json().then(data => ({ ok: response.ok, data })))
    .then(({ ok, data }) => {
        if (!ok) {
            if (data.errors) {
                // Display validation errors
                if (data.errors.current_password) {
                    document.getElementById('current_password_error').innerText = data.errors.current_password[0];
                }
                if (data.errors.password) {
                    document.getElementById('password_error').innerText = data.errors.password[0];
                }
                if (data.errors.password_confirmation) {
                    document.getElementById('password_confirmation_error').innerText = data.errors.password_confirmation[0];
                }
            }
        } else {
            // Show the success message and reset the form
            document.getElementById('success-message').style.display = 'block';
            form.reset();
        }
    })
    .catch(error => console.error('Error:', error));
});

    </script>
</x-app-layout>
