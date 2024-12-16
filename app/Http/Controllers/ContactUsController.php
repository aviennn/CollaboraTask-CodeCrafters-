<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Models\UserAdminMessage;
use App\Models\User;
use App\Notifications\NewUserAdminMessageNotification;
use App\Events\UserMessageSent;

class ContactUsController extends Controller
{
public function index()
{
    if (Auth::user()->usertype !== 'admin') {
        return redirect()->route('home')->with('error', 'Unauthorized');
    }

    // Fetch all users who have sent a message, with their unread message count
    $users = User::whereHas('userAdminMessages')->withCount(['userAdminMessages as unreadMessagesCount' => function ($query) {
        $query->whereNull('parent_message_id')->whereNull('read_at');
    }])->get();

    // Pass $users to the view
    return view('contact.index', compact('users'));
}


public function viewUserMessages($userId)
{
    session()->forget('last_reply_sent');

    if (Auth::user()->usertype !== 'admin') {
        return redirect()->route('home')->with('error', 'Unauthorized');
    }

    $selectedUser = User::findOrFail($userId);

    $users = User::whereHas('userAdminMessages')
        ->withCount(['userAdminMessages as unreadMessagesCount' => function ($query) {
            $query->whereNull('parent_message_id')->whereNull('read_at');
        }])
        ->where('id', '!=', Auth::id())
        ->get();

    // Fetch only original messages for the selected user
    $messages = UserAdminMessage::where('user_id', $userId)
        ->whereNull('parent_message_id')
        ->with('replies')
        ->orderBy('created_at', 'asc') // Ensure the messages are in chronological order
        ->get();

    return view('contact.index', compact('users', 'messages', 'selectedUser'));
}



public function create()
{
    if (!Auth::check()) {
        return redirect()->route('login')->with('error', 'You must be logged in to send a message.');
    }

    $userId = Auth::id();

    // Fetch only original messages from the user
    $messages = UserAdminMessage::where('user_id', $userId)
        ->whereNull('parent_message_id')
        ->with('replies')
        ->orderBy('created_at', 'asc') // Display in chronological order
        ->get();

    return view('contact.create', compact('messages'));
}

    
public function reply(Request $request, $userId)
{
    // Validate the reply content and optional file
    $request->validate([
        'reply' => 'required|string|max:1000',
        'file' => 'nullable|file|max:2048|mimes:jpg,jpeg,png,pdf,doc,docx',
    ]);

    // Retrieve the latest message from the user for reply association
    $originalMessage = UserAdminMessage::where('user_id', $userId)->latest()->first();

    // Create the reply message by the admin
    $replyMessage = UserAdminMessage::create([
        'user_id' => Auth::id(), // Admin user ID
        'message' => $request->reply,
        'parent_message_id' => $originalMessage ? $originalMessage->id : null, // Link to the latest original message
    ]);

    // Handle the file upload for the reply message
    if ($request->hasFile('file')) {
        try {
            $originalFileName = $request->file('file')->getClientOriginalName();
            $sanitizedFileName = preg_replace('/[^A-Za-z0-9.\-_]/', '_', $originalFileName);
            $path = $request->file('file')->storeAs('contact_files', $sanitizedFileName, 'public');

            if ($path) {
                $replyMessage->file_url = Storage::url($path);
                $replyMessage->original_file_name = $sanitizedFileName;
                $replyMessage->save();
            } else {
                return redirect()->back()->with('error', 'File upload failed. Please try again.');
            }
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while uploading the file: ' . $e->getMessage());
        }
    }

    // Notify the original sender if the sender is a user and not the current admin
    if ($originalMessage && $originalMessage->user_id !== Auth::id()) {
        $user = $originalMessage->user;
        if ($user && $user->usertype === 'user') {
            $user->notify(new NewUserAdminMessageNotification($replyMessage));
        }
    }

    // Notify admin if the reply is from a user
    if (Auth::user()->usertype === 'user') {
        $admins = User::where('usertype', 'admin')->get();
        foreach ($admins as $admin) {
            $admin->notify(new NewUserAdminMessageNotification($replyMessage));
        }
    }

    // Broadcast the new message event for real-time updates
    broadcast(new UserMessageSent($replyMessage))->toOthers();

    // Return success response
    return redirect()->route('contact.viewUserMessages', $userId)->with('success', 'Reply sent successfully!');
}



public function store(Request $request)
{
    $request->validate([
        'message' => 'required|string|max:1000',
        'file' => 'nullable|file|max:2048|mimes:jpg,jpeg,png,pdf,doc,docx',
    ]);

    // Create the message
    $message = UserAdminMessage::create([
        'user_id' => Auth::id(),
        'message' => $request->message,
    ]);

    // Handle file upload if any
    if ($request->hasFile('file')) {
        try {
            $originalFileName = $request->file('file')->getClientOriginalName();
            $sanitizedFileName = preg_replace('/[^A-Za-z0-9.\-_]/', '_', $originalFileName);
            $path = $request->file('file')->storeAs('contact_files', $sanitizedFileName, 'public');

            if ($path) {
                $message->file_url = Storage::url($path);
                $message->original_file_name = $sanitizedFileName;
                $message->save();
            } else {
                return redirect()->back()->with('error', 'File upload failed. Please try again.');
            }
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while uploading the file: ' . $e->getMessage());
        }
    }

    // Notify admin about the new message if the sender is a user
    if (Auth::user()->usertype === 'user') {
        // Find all admins to notify (adjust this if there's only one admin or a specific admin role)
        $admins = User::where('usertype', 'admin')->get();
        foreach ($admins as $admin) {
            $admin->notify(new NewUserAdminMessageNotification($message));
        }
    }

    // Log to ensure event is being fired (optional)
    \Log::info('Broadcasting UserMessageSent event with message ID: ' . $message->id);

    // Trigger broadcasting event for real-time updates (optional)
    broadcast(new UserMessageSent($message));

    // Redirect back to the form page with a success message
    return redirect()->route('contact.create')->with('success', 'Your message has been sent successfully!');
}



}