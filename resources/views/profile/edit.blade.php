<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Edit Profile') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-3xl mx-auto sm:px-6 lg:px-8 space-y-6">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    <form method="POST" action="{{ route('profile.update') }}" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <!-- Name and Full Name -->
                            <div>
                                <label for="name" class="block font-medium text-sm text-gray-700">Name</label>
                                <input type="text" name="name" class="form-input rounded-md shadow-sm mt-1 block w-full" value="{{ old('name', Auth::user()->name) }}" required>
                            </div>

                            <div>
                                <label for="full_name" class="block font-medium text-sm text-gray-700">Full Name</label>
                                <input type="text" name="full_name" class="form-input rounded-md shadow-sm mt-1 block w-full" value="{{ old('full_name', Auth::user()->full_name) }}">
                            </div>

                            <!-- Email Address -->
                            <div class="col-span-1 md:col-span-2">
                                <label for="email" class="block font-medium text-sm text-gray-700">Email</label>
                                <input type="email" name="email" class="form-input rounded-md shadow-sm mt-1 block w-full" value="{{ old('email', Auth::user()->email) }}" required>
                                
                                @if (Auth::user() instanceof \Illuminate\Contracts\Auth\MustVerifyEmail && ! Auth::user()->hasVerifiedEmail())
                                    <p class="text-sm mt-2 text-gray-800">
                                        {{ __('Your email address is unverified.') }}
                                        <button form="send-verification" class="underline text-sm text-gray-600 hover:text-gray-900 rounded-md">
                                            {{ __('Click here to re-send the verification email.') }}
                                        </button>
                                    </p>
                                    @if (session('status') === 'verification-link-sent')
                                        <p class="mt-2 font-medium text-sm text-green-600">
                                            {{ __('A new verification link has been sent to your email address.') }}
                                        </p>
                                    @endif
                                @endif
                            </div>

                            <!-- Bio and About Me -->
                            <div class="col-span-1 md:col-span-2">
                                <label for="bio" class="block font-medium text-sm text-gray-700">Bio</label>
                                <textarea name="bio" class="form-input rounded-md shadow-sm mt-1 block w-full">{{ old('bio', Auth::user()->bio) }}</textarea>
                            </div>

                            <div class="col-span-1 md:col-span-2">
                                <label for="about_me" class="block font-medium text-sm text-gray-700">About Me</label>
                                <textarea name="about_me" class="form-input rounded-md shadow-sm mt-1 block w-full">{{ old('about_me', Auth::user()->about_me) }}</textarea>
                            </div>

                            <!-- Address and Education -->
                            <div>
                                <label for="address" class="block font-medium text-sm text-gray-700">Address</label>
                                <input type="text" name="address" class="form-input rounded-md shadow-sm mt-1 block w-full" value="{{ old('address', Auth::user()->address) }}">
                            </div>

                            <div>
                                <label for="education" class="block font-medium text-sm text-gray-700">Education</label>
                                <input type="text" name="education" class="form-input rounded-md shadow-sm mt-1 block w-full" value="{{ old('education', Auth::user()->education) }}">
                            </div>

                            <!-- Skills -->
                            <div class="col-span-1 md:col-span-2">
                                <label for="skills" class="block font-medium text-sm text-gray-700">Skills (comma-separated)</label>
                                <input type="text" name="skills" class="form-input rounded-md shadow-sm mt-1 block w-full" value="{{ old('skills', implode(',', json_decode(Auth::user()->skills, true) ?? [])) }}">
                            </div>

                            <!-- Profile Picture -->
                            <div class="col-span-1 md:col-span-2">
                                <label for="profile_photo" class="block font-medium text-sm text-gray-700">Profile Picture</label>
                                <input type="file" name="profile_photo" class="form-input rounded-md shadow-sm mt-1 block w-full">
                                <div class="flex justify-center mt-4">
                                    <img src="{{ Auth::user()->profile_photo_path ? asset('storage/' . Auth::user()->profile_photo_path) : asset('dist/img/avatar5.png') }}" 
                                         class="rounded-full object-cover" 
                                         alt="Profile Picture" style="width: 150px; height: 150px;">
                                </div>
                            </div>
                        </div>

                        <div class="mt-6 flex justify-center">
                            <button type="submit" class="px-4 py-2 text-black rounded-md shadow-sm hover:bg-gray-200" style="background-color: #00e2f2;">
                                Save Changes
                            </button>
                        </div>
                    </form>
                </div>
            </div>

          
        </div>
    </div>

    <!-- Font Awesome for Eye Icon -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</x-app-layout>
