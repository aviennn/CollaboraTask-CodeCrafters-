{{-- create.blade.php (User View) --}}
@extends('layouts.app')

@section('content')
<div class="container-fluid">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h3 class="card-title">Contact Admin</h3>
        </div>
        <div class="card-body d-flex flex-column">
            <h4>Your Previous Messages</h4>
            <div id="messageContainer" class="overflow-auto" style="max-height: 500px;">
                @if($messages->isEmpty())
                    <p class="text-center">No messages yet.</p>
                @else
                    @foreach($messages->sortBy('created_at') as $message)
                        <div class="d-flex justify-content-start mb-2">
                            <div class="p-2 bg-light rounded w-75">
                                <strong>{{ Auth::user()->name }}</strong><br>
                                {{ $message->message }}
                                <div class="text-muted small">{{ $message->created_at->format('F j, Y \a\t g:i A') }}</div>
                                @if($message->file_url)
                                    <br><a href="{{ $message->file_url }}" target="_blank">View Attachment</a>
                                @endif
                            </div>
                        </div>
                        @foreach($message->replies->sortBy('created_at') as $reply)
                            <div class="d-flex justify-content-start mb-2 ml-5">
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
        <div class="card-footer">
            <form action="{{ route('contact.store') }}" method="POST" enctype="multipart/form-data" class="d-flex align-items-center">
                @csrf
                <textarea name="message" id="message" class="form-control mr-2" placeholder="Type a message..." required style="resize: none;"></textarea>
                <input type="file" name="file" class="form-control-file mr-2">
                <button type="submit" class="btn btn-primary">Send</button>
            </form>
        </div>
    </div>
</div>
@endsection


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
