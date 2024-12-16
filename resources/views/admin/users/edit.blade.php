<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-black dark:text-black leading-tight">
            <i class="fas fa-user-edit mr-2"></i> {{ __('Edit User') }}
        </h2>
    </x-slot>

    <style>
        /* Similar custom styles as in create */
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

        .text-sm.text-red-500 {
            color: #dc3545;
            font-weight: bold;
        }

        .dark .text-sm.text-red-500 {
            color: #f8d7da;
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
                Edit User
            </div>
            <div class="card-body p-4">
                <form method="POST" action="{{ route('admin.users.update', $user->id) }}">
                    @csrf
                    @method('PUT')

                    <!-- Name Input -->
                    <div class="form-group mb-3">
                        <label for="name" class="text-black dark:text-black font-weight-bold">
                            <i class="fas fa-user mr-1"></i> Name
                        </label>
                        <input id="name" 
                               type="text" 
                               name="name" 
                               value="{{ old('name', $user->name) }}" 
                               required 
                               class="form-control form-control-custom"
                               placeholder="Enter User name">
                        @error('name')
                            <span class="text-sm text-red-500">{{ $message }}</span>
                        @enderror
                    </div>

                    <!-- Email Input -->
                    <div class="form-group mb-3">
                        <label for="email" class="text-black dark:text-black font-weight-bold">
                            <i class="fas fa-envelope mr-1"></i> Email
                        </label>
                        <input id="email" 
                               type="email" 
                               name="email" 
                               value="{{ old('email', $user->email) }}" 
                               required 
                               class="form-control form-control-custom"
                               placeholder="Enter email address">
                        @error('email')
                            <span class="text-sm text-red-500">{{ $message }}</span>
                        @enderror
                    </div>

                    <!-- Password Input -->
                    <div class="form-group mb-3 position-relative">
                        <label for="password" class="text-black dark:text-black font-weight-bold">
                            <i class="fas fa-lock mr-1"></i> Password
                        </label>
                        <div class="input-wrapper">
                            <input id="password" 
                                   type="password" 
                                   name="password" 
                                   class="form-control form-control-custom"
                                   placeholder="Enter new password (leave blank to keep current)">
                            <span class="eye-icon" onclick="togglePasswordVisibility('password', 'togglePasswordIcon')">
                                <i class="fas fa-eye" id="togglePasswordIcon"></i>
                            </span>
                        </div>
                        <small class="text-gray-500 dark:text-gray-400">Leave blank if you don't want to change the password</small>
                        @error('password')
                            <span class="text-sm text-red-500">{{ $message }}</span>
                        @enderror
                    </div>

                    <!-- Confirm Password Input -->
                    <div class="form-group mb-3 position-relative">
                        <label for="password_confirmation" class="text-black dark:text-black font-weight-bold">
                            <i class="fas fa-lock mr-1"></i> Confirm Password
                        </label>
                        <div class="input-wrapper">
                            <input id="password_confirmation" 
                                   type="password" 
                                   name="password_confirmation" 
                                   class="form-control form-control-custom"
                                   placeholder="Confirm new password">
                            <span class="eye-icon" onclick="togglePasswordVisibility('password_confirmation', 'toggleConfirmPasswordIcon')">
                                <i class="fas fa-eye" id="toggleConfirmPasswordIcon"></i>
                            </span>
                        </div>
                        @error('password_confirmation')
                            <span class="text-sm text-red-500">{{ $message }}</span>
                        @enderror
                    </div>

                    <!-- Update Button -->
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-custom">
                            <i class="fas fa-user-edit mr-1"></i> Update
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
    </script>
</x-app-layout>
