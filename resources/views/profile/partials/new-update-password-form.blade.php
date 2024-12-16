<!-- resources/views/profile/partials/new-update-password-form.blade.php -->
<div class="bg-white shadow sm:rounded-lg p-6">
    <form method="POST" action="{{ route('profile.new_password_update') }}">
        @csrf
        @method('PUT')

        <!-- Current Password -->
        <div class="mb-4">
            <label for="current_password" class="block font-medium text-sm text-gray-700">Current Password</label>
            <input id="current_password" type="password" name="current_password" required
                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
            @error('current_password')
                <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
            @enderror
        </div>

        <!-- New Password -->
        <div class="mb-4">
            <label for="password" class="block font-medium text-sm text-gray-700">New Password</label>
            <input id="password" type="password" name="password" required
                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
            @error('password')
                <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
            @enderror
        </div>

        <!-- Confirm New Password -->
        <div class="mb-4">
            <label for="password_confirmation" class="block font-medium text-sm text-gray-700">Confirm Password</label>
            <input id="password_confirmation" type="password" name="password_confirmation" required
                   class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
            @error('password_confirmation')
                <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
            @enderror
        </div>

        <div class="flex items-center justify-end mt-4">
            <button type="submit" class="px-4 py-2 bg-blue-500 text-white rounded-md shadow-sm hover:bg-blue-600">
                Update Password
            </button>
        </div>
    </form>
</div>
