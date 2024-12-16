{{-- resources/views/profile/partials/activity-log.blade.php --}}

<div class="card card-primary mt-4">
    <div class="card-header">
        <h3 class="card-title">Activity Log</h3>
        <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                <i class="fas fa-minus"></i>
            </button>
        </div>
    </div>
    <div class="card-body table-responsive p-0">
        <table class="table table-bordered table-hover" id="activityLogTable">
            <thead>
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
