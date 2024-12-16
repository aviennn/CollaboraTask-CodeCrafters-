@extends('layouts.register-layout')

@section('content')
<h2 class="text-left font-semibold text-xl mb-8 custom-margin-top-h2" style="font-size: 33px;">{{ __('CREATE AN ACCOUNT') }}</h2>
<p class="text-left mb-6 custom-margin-top-p" style="font-size: 20px;">Please enter your credentials to create an account.</p>

<form method="POST" action="{{ route('register') }}" style="margin-top: -2px;">
    @csrf

    <!-- Name 
    <div class="mb-9">
        <x-input-label for="name" :value="__('Name')" style="font-size: 20px; color: #000; margin-bottom: 8px;"/>
        <x-text-input id="name" class="custom-input block mt-1 w-full" type="text" name="name" :value="old('name')" required autofocus autocomplete="name" />
        <x-input-error :messages="$errors->get('name')" class="mt-2" />
    </div> -->
    
       <!-- Name -->
<div class="mb-9">
    <x-input-label for="name" :value="__('Name')" style="font-size: 20px; color: #000; margin-bottom: 8px;"/>
    <x-text-input id="name" class="custom-input block mt-1 w-full" type="text" name="name" 
                  :value="old('name')" required autofocus autocomplete="name" 
                  pattern="[A-Za-z\s]+" title="Only letters and spaces are allowed." />
    <!-- Error message for invalid input -->
    <span class="input-error-message">The name field may only contain letters and spaces.</span>
    <x-input-error :messages="$errors->get('name')" class="mt-2" />
</div>

    <!-- Email Address -->
    <div class="mb-9">
        <x-input-label for="email" :value="__('Email')" style="font-size: 20px; color: #000; margin-bottom: 8px;" />
        <x-text-input id="email" class="custom-input block mt-1 w-full" type="email" name="email" :value="old('email')" required autocomplete="username" />
        <x-input-error :messages="$errors->get('email')" class="mt-2" />
    </div>

    <!-- Password -->
    <div class="mb-9 relative">
        <x-input-label for="password" :value="__('Password')" style="font-size: 20px; color: #000; margin-bottom: 8px;"/>
        <x-text-input id="password" class="custom-input block mt-1 w-full pr-10" type="password" name="password" required autocomplete="new-password" />
        <span class="eye-icon cursor-pointer absolute right-3 top-10" onclick="togglePasswordVisibility('password', 'passwordToggleIcon')">
            <i class="fas fa-eye" id="passwordToggleIcon"></i>
        </span>
        <x-input-error :messages="$errors->get('password')" class="mt-2" />
    </div>

    <!-- Confirm Password -->
    <div class="mb-9 relative">
        <x-input-label for="password_confirmation" :value="__('Confirm Password')" style="font-size: 20px; color: #000; margin-bottom: 8px;"/>
        <x-text-input id="password_confirmation" class="custom-input block mt-1 w-full pr-10" type="password" name="password_confirmation" required autocomplete="new-password" />
        <span class="eye-icon cursor-pointer absolute right-3 top-10" onclick="togglePasswordVisibility('password_confirmation', 'passwordConfirmToggleIcon')">
            <i class="fas fa-eye" id="passwordConfirmToggleIcon"></i>
        </span>
        <x-input-error :messages="$errors->get('password_confirmation')" class="mt-2" />
    </div>

    <div class="flex items-center justify-center mt-4">
        <x-primary-button class="ml-4" style="font-size: 19px; color: #000;">
            {{ __('Register') }}
        </x-primary-button>
    </div>
</form>

<style>
.eye-icon {
    color: #999;
    position: absolute;
    right: 10px;
    top: 70%;
    transform: translateY(-50%);
    cursor: pointer;
}

/* Custom styles for invalid input */
input:invalid {
    border-color: red;  /* Red border color for invalid input */
}

input:invalid + .input-error-message {
    display: block;  /* Show error message */
}


</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

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
<script>
    document.getElementById('name').addEventListener('input', function(event) {
        var nameInput = event.target;
        var errorMessage = nameInput.nextElementSibling; // The error message <span> element

        // Check if the input is invalid based on the pattern
        if (!nameInput.checkValidity()) {
            errorMessage.style.display = 'block'; // Show the error message
        } else {
            errorMessage.style.display = 'none'; // Hide the error message if valid
        }
    });
</script>
@endsection
