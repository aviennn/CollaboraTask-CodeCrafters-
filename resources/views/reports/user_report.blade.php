@extends('layouts.app')

@section('content')

<div class="container-fluid mt-4">
    <h2 class="text-dark font-weight-bold">User-Centric System Reports</h2>

    <!-- Report Filter and PDF Generation -->
    <div class="row mb-3">
        <div class="col-md-12 d-flex align-items-start">
            <!-- Date Range Card -->
            <div class="flex-grow-1 date-range-card">
                <div class="card card-info">
                    <div class="card-header d-flex align-items-center">
                        <i class="fas fa-calendar-alt mr-2"></i>
                        
                        <h3 class="card-title mb-0">Generate Report by Date Range</h3>
                    </div>
                    <div class="card-body p-2">
                        <p class="text-muted mb-3">
    <strong>Note:</strong> Please select the start and end dates for the report you wish to view, then click "Filter" to generate the data. Alternatively, you can use the quick filters below to instantly filter data for "Today," "This Week," or "This Month."
</p>

                        <div class="row">
                            <div class="col-md-5">
                                
                                <div class="form-group">
                                    <label for="start_date">Start Date:</label>
                                    <input type="date" id="start_date" name="start_date" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label for="end_date">End Date:</label>
                                    <input type="date" id="end_date" name="end_date" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-2 d-flex align-items-center">
                                <button type="button" class="btn btn-primary btn-block" id="filterButton">
                                    <i class="fas fa-filter"></i> Filter
                                </button>
                            </div>
                        </div>
                        <div class="row mt-2 quick-filters">
                            <button type="button" class="btn btn-outline-info btn-sm" onclick="setDateRange('today')">Today</button>
                            <button type="button" class="btn btn-outline-info btn-sm" onclick="setDateRange('week')">This Week</button>
                            <button type="button" class="btn btn-outline-info btn-sm" onclick="setDateRange('month')">This Month</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Generate PDF Button -->
            <div class="ml-3 pdf-button">
                <button type="button" class="btn btn-success btn-block" id="generatePDFButton" style="height: 100%;">
                    <i class="fas fa-file-pdf"></i> Generate PDF
                </button>
            </div>
        </div>
    </div>

    <!-- User Lists Section -->
    <div class="row">
        <!-- New Users -->
        <div class="col-md-4">
            <div class="card card-primary">
                <div class="card-header">
                    <i class="fas fa-user-plus"></i> New Users
                </div>
                <div class="card-body p-0 scrollable-list">
                    <ul id="newUsersList" class="list-unstyled m-0"></ul>
                </div>
            </div>
        </div>

        <!-- Active Users -->
        <div class="col-md-4">
            <div class="card card-primary">
                <div class="card-header">
                    <i class="fas fa-user-check"></i> Active Users
                </div>
                <div class="card-body p-0 scrollable-list">
                    <ul id="activeUsersList" class="list-unstyled m-0"></ul>
                </div>
            </div>
        </div>

        <!-- Inactive Users -->
        <div class="col-md-4">
            <div class="card card-primary">
                <div class="card-header">
                    <i class="fas fa-user-times"></i> Inactive Users
                </div>
                <div class="card-body p-0 scrollable-list">
                    <ul id="inactiveUsersList" class="list-unstyled m-0"></ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Charts Row -->
    <div class="row mt-3">
        <!-- User Growth Chart -->
        <div class="col-md-4">
            <div class="card card-info">
                <div class="card-header">
                    <i class="fas fa-chart-line"></i> User Growth
                </div>
                <div class="card-body p-2">
                    <div class="chart-container" style="height: 250px;">
                        <canvas id="userGrowthChart"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- User Engagement Chart -->
        <div class="col-md-4">
            <div class="card card-info">
                <div class="card-header">
                    <i class="fas fa-chart-pie"></i> User Engagement
                </div>
                <div class="card-body p-2">
                    <div class="chart-container" style="height: 250px;">
                        <canvas id="userEngagementChart"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- Top Active Users Chart -->
        <div class="col-md-4">
            <div class="card card-info">
                <div class="card-header">
                    <i class="fas fa-user-clock"></i> Top Active Users
                </div>
                <div class="card-body p-2">
                    <div class="chart-container" style="height: 250px;">
                        <canvas id="topUsersChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .report-filter-container {
        display: flex;
        gap: 10px;
    }

    .date-range-card {
        flex-grow: 1;
    }

    .pdf-button {
        width: 150px;
        align-self: flex-start;
    }

    .quick-filters {
        display: flex;
        justify-content: space-around;
        gap: 5px;
    }

    .scrollable-list {
        max-height: 250px;
        overflow-y: auto;
    }

    .list-item {
        padding: 8px 12px;
        border-bottom: 1px solid #ddd;
        font-size: 14px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .list-item:last-child {
        border-bottom: none;
    }

    .last-online {
        font-size: 12px;
        color: #6c757d;
    }
</style>

<!-- Include Chart.js and jsPDF -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script>
    function setDateRange(range) {
        const startDateInput = document.getElementById('start_date');
        const endDateInput = document.getElementById('end_date');
        const today = new Date();

        let startDate, endDate;

        switch (range) {
            case 'today':
                startDate = endDate = today;
                break;
            case 'week':
                startDate = new Date(today);
                startDate.setDate(today.getDate() - today.getDay()); // Start of the week (Sunday)
                endDate = new Date(today);
                break;
            case 'month':
                startDate = new Date(today.getFullYear(), today.getMonth(), 1); // First day of the month
                endDate = today;
                break;
            default:
                return;
        }

        // Format dates as 'YYYY-MM-DD'
        const formatDate = date => date.toISOString().slice(0, 10);

        startDateInput.value = formatDate(startDate);
        endDateInput.value = formatDate(endDate);
    }
</script>


<script>
document.getElementById('filterButton').addEventListener('click', fetchUserReportData);

function fetchUserReportData() {
    const startDate = document.getElementById('start_date').value;
    const endDate = document.getElementById('end_date').value;

    if (startDate && endDate) {
        fetch(`{{ route('reports.userReportData') }}?start_date=${startDate}&end_date=${endDate}`)
            .then(response => response.json())
            .then(data => {
                if (data.newUsers && data.activeUsers && data.inactiveUsers && data.topUsers) {
                    renderUserGrowthChart(data.newUsers.count);
                    renderUserEngagementChart(data.activeUsers.count, data.inactiveUsers.count);
                    renderTopUsersChart(data.topUsers);

                    // Display user lists
                    displayUserList('newUsersList', data.newUsers.list);
                    displayUserList('activeUsersList', data.activeUsers.list);
                    displayUserList('inactiveUsersList', data.inactiveUsers.list, true); // Show last online info for inactive users
                } else {
                    console.error('Unexpected response structure:', data);
                }
            })
            .catch(error => console.error('Error fetching data:', error));
    }
}

// Function to render the user growth chart
function renderUserGrowthChart(newUsersCount) {
    const ctx = document.getElementById('userGrowthChart').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['New Users'],
            datasets: [{
                label: 'New Users',
                data: [newUsersCount],
                backgroundColor: '#54a0ff',
                borderColor: '#000000',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false
        }
    });
}

// Function to render the user engagement chart
function renderUserEngagementChart(activeUsersCount, inactiveUsersCount) {
    const ctx = document.getElementById('userEngagementChart').getContext('2d');
    new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ['Active Users', 'Inactive Users'],
            datasets: [{
                data: [activeUsersCount, inactiveUsersCount],
                backgroundColor: ['#78e08f', '#ff6b6b'],
                borderColor: '#000000',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'top'
                }
            }
        }
    });
}

//render topuserschart
function renderTopUsersChart(topUsers) {
    const ctx = document.getElementById('topUsersChart').getContext('2d');
    
    // Ensure the topUsers data exists and has values
    if (!topUsers || topUsers.length === 0) {
        console.warn("No data available for Top Active Users chart");
        return;
    }

    const labels = topUsers.map(user => user.user_name);
    const durations = topUsers.map(user => parseFloat(user.total_duration).toFixed(2)); // Format to 2 decimal places for consistency

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Total Duration (hours)',
                data: durations,
                backgroundColor: '#f6b93b',
                borderColor: '#000000',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                x: {
                    ticks: {
                        autoSkip: false,
                        maxRotation: 45,
                        minRotation: 0
                    }
                }
            },
            plugins: {
                legend: {
                    display: true,
                    position: 'top'
                }
            }
        }
    });
}


// Function to display user lists for new, active, and inactive users
function displayUserList(elementId, users, showLastOnline = false) {
    const container = document.getElementById(elementId);
    container.innerHTML = ''; // Clear existing content

    users.forEach(user => {
        const userItem = document.createElement('li');
        userItem.classList.add('list-group-item', 'd-flex', 'align-items-center', 'p-2'); // Apply Bootstrap or similar classes for compact styling

        // Create profile photo element
        const profilePhoto = document.createElement('img');
        profilePhoto.src = user.profile_photo_url; // Use user's profile photo URL
        profilePhoto.alt = "Profile Photo";
        profilePhoto.classList.add('rounded-circle', 'border');
        profilePhoto.style.width = '35px';
        profilePhoto.style.height = '35px';
        profilePhoto.style.objectFit = 'cover';
        profilePhoto.style.marginRight = '8px';

        // Create user info content
        const userInfo = document.createElement('span');
        userInfo.textContent = user.name; // Display only the user's name

        // Add "Last online" info if applicable
        if (showLastOnline && user.last_online) {
            const lastOnlineInfo = document.createElement('small');
            lastOnlineInfo.classList.add('text-muted'); // Style as muted text
            lastOnlineInfo.textContent = ` (Last online: ${user.last_online})`;
            userInfo.appendChild(lastOnlineInfo);
        }

        // Append profile photo and user info to list item
        userItem.prepend(profilePhoto);
        userItem.appendChild(userInfo);
        container.appendChild(userItem);
    });
}



</script>
<script>
 document.getElementById('generatePDFButton').addEventListener('click', generatePDF);

function generatePDF() {
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();

    // Title and Date Range
    doc.setFontSize(18);
    doc.text("User-Centric System Report", 10, 10);
    doc.setFontSize(12);
    const startDate = document.getElementById('start_date').value;
    const endDate = document.getElementById('end_date').value;
    doc.text(`Date Range: ${startDate} - ${endDate}`, 10, 20);

    // Styling for Section Headers
    const sectionHeaderY = (y, title) => {
        doc.setFontSize(14);
        doc.setTextColor(0, 0, 0);  // Black color for headers
        doc.text(title, 10, y);
        doc.setDrawColor(200, 200, 200); // Gray line
        doc.line(10, y + 2, 200, y + 2);
        return y + 10;
    };

    // Function to capture each `li` item as a new line in the PDF
    const addUserList = (elementId, currentY) => {
        const container = document.getElementById(elementId);
        const items = container.querySelectorAll('li'); // Select all `li` items
        doc.setFontSize(10);
        doc.setTextColor(50, 50, 50);
        items.forEach(item => {
            const userText = item.innerText.trim();
            const textLines = doc.splitTextToSize(userText || "No users available.", 180);
            textLines.forEach(line => {
                doc.text(line, 10, currentY);
                currentY += 6;  // Adjust line spacing
            });
            currentY += 4;  // Additional spacing between users
        });
        return currentY;
    };

    // New Users Section
    let currentY = sectionHeaderY(30, "New Users:");
    currentY = addUserList('newUsersList', currentY + 6);

    // Active Users Section
    currentY = sectionHeaderY(currentY + 10, "Active Users:");
    currentY = addUserList('activeUsersList', currentY + 6);

    // Inactive Users Section
    currentY = sectionHeaderY(currentY + 10, "Inactive Users:");
    currentY = addUserList('inactiveUsersList', currentY + 6);

    // Function to add chart with page break check and stats
    const addChartWithStats = (chartId, x, y, width, height, stats) => {
        const canvas = document.getElementById(chartId);
        if (canvas) {
            const chartDataURL = canvas.toDataURL('image/png');
            
            // Check if there's enough space for the chart; add a new page if necessary
            if (y + height + 20 > 280) {  // Adjust for stats space
                doc.addPage();
                y = 20;  // Reset y position on new page
            }
            doc.addImage(chartDataURL, 'PNG', x, y, width, height);

            // Display the stats below the chart
            doc.setFontSize(10);
            doc.setTextColor(50, 50, 50);
            const statLines = doc.splitTextToSize(stats, 180);
            statLines.forEach(line => {
                y += 6;
                doc.text(line, x, y + height);
            });

            return y + height + 20; // Adjust y for the next chart or content
        }
        return y;
    };

    // Example stats (replace these with actual data as needed)
    const newUsersStats = "New Users: 1";
    const engagementStats = "Active Users: 50%, Inactive Users: 50%";
    const topUsersStats = "Admin: 10 hours, Tatch: 8 hours, Jerahmeel: 2 hours";

    // Adjust space for charts with pagination and add stats
    currentY += 10;
    currentY = addChartWithStats('userGrowthChart', 10, currentY, 90, 50, newUsersStats);
    currentY = addChartWithStats('userEngagementChart', 110, currentY - 60, 90, 50, engagementStats);  // Align horizontally with the first chart
    currentY = addChartWithStats('topUsersChart', 10, currentY, 180, 50, topUsersStats);

    // Footer
    doc.setFontSize(10);
    doc.setTextColor(150, 150, 150);
    doc.text("Generated on: " + new Date().toLocaleString(), 10, 285);

    // Save PDF
    doc.save("User_Centric_System_Report.pdf");
}


</script>

@endsection
