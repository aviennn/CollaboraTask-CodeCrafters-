<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-black dark:text-white leading-tight">
            <i class="fas fa-user-plus mr-2"></i> {{ __('Create User') }}
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

        /* Placeholder styling for dark mode */
        .form-control-custom::placeholder {
            color: #999;
        }

        .dark .form-control-custom::placeholder {
            color: #bbb;
        }

        /* Alert styling */
        .alert {
            border-radius: 5px;
            padding: 0.75rem 1.25rem;
            margin-bottom: 1rem;
            font-weight: bold;
            text-align: center;
        }

        .alert-success {
            color: #155724;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
        }

        .alert-error {
            color: #721c24;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
        }

        /* Dark mode alerts */
        .dark .alert-success {
            color: #d4edda;
            background-color: #155724;
            border-color: #c3e6cb;
        }

        .dark .alert-error {
            color: #f8d7da;
            background-color: #721c24;
            border-color: #f5c6cb;
        }
    </style>

    <div class="container mt-5">
        <!-- Success Message -->
        @if(session('success'))
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i> {{ session('success') }}
            </div>
        @endif

        <!-- Error Message -->
        @if(session('error'))
            <div class="alert alert-error">
                <i class="fas fa-exclamation-circle"></i> {{ session('error') }}
            </div>
        @endif

        <div class="card card-custom mx-auto bg-white dark:bg-gray-900">
            <div class="card-header card-header-custom">
                Create New User
            </div>
            <div class="card-body p-4">
                <form method="POST" action="{{ route('admin.users.store') }}">
                    @csrf

                    <!-- Name Input -->
                    <div class="form-group mb-3">
                        <label for="name" class="text-black dark:text-black font-weight-bold">
                            <i class="fas fa-user mr-1"></i> Name
                        </label>
                        <input id="name" 
                               type="text" 
                               name="name" 
                               value="{{ old('name') }}" 
                               required 
                               autofocus 
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
                               value="{{ old('email') }}" 
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
               required 
               class="form-control form-control-custom"
               placeholder="Enter password">
        <span class="eye-icon" onclick="togglePasswordVisibility('password', 'togglePasswordIcon')">
            <i class="fas fa-eye" id="togglePasswordIcon"></i>
        </span>
    </div>
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
               required 
               class="form-control form-control-custom"
               placeholder="Confirm password">
        <span class="eye-icon" onclick="togglePasswordVisibility('password_confirmation', 'toggleConfirmPasswordIcon')">
            <i class="fas fa-eye" id="toggleConfirmPasswordIcon"></i>
        </span>
    </div>
    @error('password_confirmation')
        <span class="text-sm text-red-500">{{ $message }}</span>
    @enderror
</div>




                    <!-- Create Button -->
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-custom">
                            <i class="fas fa-user-plus mr-1"></i> Create
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
<style>
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

/* Error message styling */
.text-sm.text-red-500 {
    color: #dc3545; /* Red color for error messages */
    font-weight: bold; /* Make the text bold for better visibility */
}

/* Dark mode error message styling */
.dark .text-sm.text-red-500 {
    color: #f8d7da; /* Light red color for better contrast in dark mode */
}

</style>
</x-app-layout>
