{{-- index.blade.php (Admin View) --}}
@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h5>Users</h5>
                </div>
                <div class="card-body p-0">
                    @if($users->isEmpty())
                        <p class="text-center m-3">No messages yet.</p>
                    @else
                                            <ul class="list-group list-group-flush">
                        @foreach($users as $user)
                            @if($user->id !== Auth::id()) {{-- Add this condition to hide the logged-in admin --}}
                                <li class="list-group-item">
                                    <a href="{{ route('contact.viewUserMessages', $user->id) }}" class="d-flex justify-content-between">
                                        <span>{{ $user->name }}</span>
                                        @if($user->unreadMessagesCount > 0)
                                            <span class="badge badge-primary">{{ $user->unreadMessagesCount }} unread</span>
                                        @endif
                                    </a>
                                </li>
                            @endif
                        @endforeach
                    </ul>
                    @endif
                </div>
            </div>
        </div>

        <div class="col-md-8">
            @isset($selectedUser)
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5>Messages from {{ $selectedUser->name }}</h5>
                    </div>
                    <div id="messageContainer" class="card-body overflow-auto" style="max-height: 500px;">
                        @if($messages->isEmpty())
                            <p class="text-center">No messages from this user.</p>
                        @else
                            @foreach($messages->sortBy('created_at') as $message)
                                <div class="d-flex justify-content-start mb-2">
                                    <div class="p-2 bg-light rounded w-75">
                                        <strong>{{ $selectedUser->name }}</strong><br>
                                        {{ $message->message }}
                                        <div class="text-muted small">{{ $message->created_at->format('F j, Y \a\t g:i A') }}</div>
                                        @if($message->file_url)
                                            <br><a href="{{ $message->file_url }}" target="_blank">View Attachment</a>
                                        @endif
                                    </div>
                                </div>
                                @foreach($message->replies->sortBy('created_at') as $reply)
                                    <div class="d-flex justify-content-end mb-2">
                                        <div class="p-2 bg-primary text-white rounded w-75">
                                            <strong>Admin</strong><br>
                                            {{ $reply->message }}
                                            <div class="text-white-50 small">{{ $reply->created_at->format('F j, Y \a\t g:i A') }}</div>
                                            @if($reply->file_url)
                                                <br><a href="{{ $reply->file_url }}" class="text-white" target="_blank">View Attachment</a>
                                            @endif
                                        </div>
                                    </div>
                                @endforeach
                            @endforeach
                        @endif
                    </div>
                </div>

                <div class="card mt-3">
                    <div class="card-body">
                        <form action="{{ route('contact.reply', $selectedUser->id) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="form-group mb-2">
                                <textarea name="reply" id="reply" class="form-control" placeholder="Type a message..." required></textarea>
                            </div>
                            <div class="form-group mb-2">
                                <input type="file" name="file" class="form-control-file">
                            </div>
                            <button type="submit" class="btn btn-success btn-sm">Send</button>
                        </form>
                    </div>
                </div>
            @endisset
        </div>
    </div>
</div>
<script>
   document.addEventListener('DOMContentLoaded', function() {
    var messageContainer = document.getElementById('messageContainer');
    if (messageContainer) {
        // Scroll to the bottom when the page loads
        scrollToBottom();
        
        // Set up an observer to scroll to the bottom when new messages are added
        const observer = new MutationObserver(function(mutationsList) {
            for (let mutation of mutationsList) {
                if (mutation.type === 'childList') {
                    scrollToBottom();
                }
            }
        });

        observer.observe(messageContainer, { childList: true });
    }

    function scrollToBottom() {
        messageContainer.scrollTop = messageContainer.scrollHeight;
    }
});
</script>
@endsection



