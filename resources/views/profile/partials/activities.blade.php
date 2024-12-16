@if($activities && $activities->isNotEmpty())
    <ul>
        @foreach($activities as $activity)
            <li>
                <p>{{ $activity->description }}</p>
                <small>{{ $activity->created_at->diffForHumans() }}</small>
            </li>
        @endforeach
    </ul>
@else
    <p>No activities found.</p>
@endif
