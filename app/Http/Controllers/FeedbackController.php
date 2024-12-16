<?php

namespace App\Http\Controllers;

use App\Models\Feedback;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Notifications\FeedbackSubmitted;
use App\Models\User;

class FeedbackController extends Controller
{
    // Display the feedback form for users
    public function create()
    {
        return view('feedback.create');
    }

    // Store feedback
    public function store(Request $request)
    {
        $request->validate([
            'category' => 'required|string|max:255',
            'comment' => 'required|string|max:1000',
           // 'rating' => 'nullable|integer|min:1|max:5',
        ]);

        // Save feedback
        $feedback = Feedback::create([
            'user_id' => Auth::id(),
            'category' => $request->input('category'),
            'comment' => $request->input('comment'),
           // 'rating' => $request->input('rating'),
        ]);

        // Notify admin users after feedback is saved
        $adminUsers = User::where('usertype', 'admin')->get();
        foreach ($adminUsers as $admin) {
            $admin->notify(new FeedbackSubmitted($feedback, Auth::user()));
        }

        return response()->json(['success' => true]);
    }

    // Display feedback for admin
    public function index(Request $request)
{
    // Fetch all feedback and paginate it
    $feedbacks = Feedback::with('user')->latest()->paginate(10);

    // Get the feedback ID to highlight (if any)
    $highlightFeedbackId = $request->query('highlight');

    return view('admin.feedback.index', compact('feedbacks', 'highlightFeedbackId'));
}


    // Delete feedback
    public function destroy($id)
    {
        $feedback = Feedback::findOrFail($id);
        if ($feedback->delete()) {
            return response()->json(['success' => true]);
        }
        return response()->json(['success' => false], 500);
    }
}
