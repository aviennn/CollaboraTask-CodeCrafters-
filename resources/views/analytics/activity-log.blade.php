@extends('layouts.app')

@section('content')
<div class="container">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h1>Activity Log for {{ $user->name }}</h1>
        <a href="{{ url()->previous() }}" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Back
        </a>
    </div>

    <div class="table-responsive">
        <table class="table table-bordered table-hover" id="activityLogTable">
            <thead class="thead-dark">
                <tr>
                    <th>Description</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                @forelse ($activities as $activity)
                    <tr>
                        <td>{{ $activity->description }}</td>
                        <td>{{ $activity->created_at->format('M d, Y H:i:s') }}</td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="2" class="text-center">No activities found.</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>
@endsection

@section('scripts')
<script>
    $(document).ready(function() {
        $('#activityLogTable').DataTable({
            "paging": true,
            "searching": true,
            "ordering": true,
            "order": [[1, "desc"]], // Sort by date in descending order by default
            "info": true,
            "lengthChange": true,
            "pageLength": 10 // Adjust as needed for default number of rows
        });
    });
</script>
@endsection
