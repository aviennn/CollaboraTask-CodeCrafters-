<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Str;
use Illuminate\Validation\Rules;
use Illuminate\View\View;
use Illuminate\Validation\ValidationException;

class NewPasswordController extends Controller
{
    /**
     * Display the password reset view.
     */
    public function create(Request $request): View
    {
        return view('auth.reset-password', ['request' => $request]);
    }

    /**
     * Handle an incoming new password request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request): RedirectResponse
{
    $request->validate([
        'token' => ['required'],
        'email' => ['required', 'email'],
        'password' => [
            'required',
            'confirmed',
            'min:8',                // Minimum 8 characters
            'regex:/[a-z]/',         // At least one lowercase letter
            'regex:/[A-Z]/',         // At least one uppercase letter
            'regex:/[0-9]/',         // At least one number
            'regex:/[\W_]/',         // At least one special character
        ],
    ], [
        'password.min' => 'The password must be at least 8 characters long.',
        'password.regex' => 'The password must include at least one uppercase letter, one lowercase letter, one number, and one special character.',
        'password.confirmed' => 'The password confirmation does not match.',
    ]);

    // Here we will attempt to reset the user's password. If it is successful, we
    // will update the password on an actual user model and persist it to the
    // database. Otherwise, we will parse the error and return the response.
    $status = Password::reset(
        $request->only('email', 'password', 'password_confirmation', 'token'),
        function ($user) use ($request) {
            $user->forceFill([
                'password' => Hash::make($request->password),
                'remember_token' => Str::random(60),
            ])->save();

            event(new PasswordReset($user));
        }
    );

    // If the password was successfully reset, we will redirect the user back to
    // the application's home authenticated view. If there is an error, we can
    // redirect them back to where they came from with their error message.
    return $status == Password::PASSWORD_RESET
                ? redirect()->route('login')->with('status', __($status))
                : back()->withInput($request->only('email'))
                        ->withErrors(['email' => __($status)]);
}

}