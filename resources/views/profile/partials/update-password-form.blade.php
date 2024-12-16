<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-black dark:text-black leading-tight">
            <i class="fas fa-lock mr-2"></i> {{ __('Update Password') }}
        </h2>
    </x-slot>

    <style>
        /* Custom styles for the form */
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

        /* Input styling */
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

        /* Dark mode overrides */
        .dark .form-control-custom {
            background-color: #444;
            color: #e5e5e5;
            border: 1px solid #666;
        }

        /* Button styling */
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

        /* Hover effect */
        .btn-custom:hover {
            background-color: #4a4a4a; /* Lighter gray for better contrast */
            color: #ffffff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        /* Dark mode button */
        .dark .btn-custom {
            background-color: #555;
            color: #ffffff;
        }

        .dark .btn-custom:hover {
            background-color: #666; /* Slightly lighter shade in dark mode */
            color: #ffffff;
        }

        /* Wrapper around input and icon */
        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }

        /* Position the eye icon inside the input field */
        .eye-icon {
            position: absolute;
            right: 10px;
            cursor: pointer;
            color: #666;
        }

        /* Adjust icon color for dark mode */
        .dark .eye-icon {
            color: #bbb;
        }

    </style>

    <div class="container mt-5">
        <div class="card card-custom mx-auto bg-white dark:bg-gray-900">
            <div class="card-header card-header-custom">
                <i class="fas fa-lock mr-1"></i> Update Password
            </div>
            <div class="card-body p-4">
                <form method="post" action="{{ route('password.update') }}" class="space-y-6">
                    @csrf
                    @method('put')

                    <!-- Current Password Input -->
                    <div class="form-group mb-3 position-relative">
                        <label for="update_password_current_password" class="text-black dark:text-black font-weight-bold">
                            <i class="fas fa-key mr-1"></i> Current Password
                        </label>
                        <div class="input-wrapper">
                            <input id="update_password_current_password" 
                                   name="current_password" 
                                   type="password" 
                                   class="form-control form-control-custom"
                                   autocomplete="current-password"
                                   placeholder="Enter current password" />
                            <span class="eye-icon" onclick="togglePasswordVisibility('update_password_current_password', 'toggleCurrentPasswordIcon')">
                                <i class="fas fa-eye" id="toggleCurrentPasswordIcon"></i>
                            </span>
                        </div>
                        <x-input-error :messages="$errors->updatePassword->get('current_password')" class="text-red-500 mt-2" />
                    </div>

                    <!-- New Password Input -->
                    <div class="form-group mb-3 position-relative">
                        <label for="update_password_password" class="text-black dark:text-black font-weight-bold">
                            <i class="fas fa-lock mr-1"></i> New Password
                        </label>
                        <div class="input-wrapper">
                            <input id="update_password_password" 
                                   name="password" 
                                   type="password" 
                                   class="form-control form-control-custom"
                                   autocomplete="new-password"
                                   placeholder="Enter new password" />
                            <span class="eye-icon" onclick="togglePasswordVisibility('update_password_password', 'toggleNewPasswordIcon')">
                                <i class="fas fa-eye" id="toggleNewPasswordIcon"></i>
                            </span>
                        </div>
                        <x-input-error :messages="$errors->updatePassword->get('password')" class="text-red-500 mt-2" />
                    </div>

                    <!-- Confirm New Password Input -->
                    <div class="form-group mb-3 position-relative">
                        <label for="update_password_password_confirmation" class="text-black dark:text-black font-weight-bold">
                            <i class="fas fa-lock mr-1"></i> Confirm Password
                        </label>
                        <div class="input-wrapper">
                            <input id="update_password_password_confirmation" 
                                   name="password_confirmation" 
                                   type="password" 
                                   class="form-control form-control-custom"
                                   autocomplete="new-password"
                                   placeholder="Confirm new password" />
                            <span class="eye-icon" onclick="togglePasswordVisibility('update_password_password_confirmation', 'toggleConfirmPasswordIcon')">
                                <i class="fas fa-eye" id="toggleConfirmPasswordIcon"></i>
                            </span>
                        </div>
                        <x-input-error :messages="$errors->updatePassword->get('password_confirmation')" class="text-red-500 mt-2" />
                    </div>

                    <!-- Save Button -->
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-custom">
                            <i class="fas fa-save mr-1"></i> Save Changes
                        </button>
                    </div>

                    @if (session('status') === 'password-updated')
                        <div class="alert alert-success mt-4">
                            <i class="fas fa-check-circle"></i> {{ __('Password updated successfully.') }}
                        </div>
                    @endif
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
    </script>
</x-app-layout>
