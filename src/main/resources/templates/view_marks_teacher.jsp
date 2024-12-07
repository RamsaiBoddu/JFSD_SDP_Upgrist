<!DOCTYPE html>
<html lang="en">
<head>
    <title>Course Mapping Upload</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap">
    <style>
        :root {
            --primary-color: #f97316;
            --primary-hover: #ea580c;
            --text-primary: #111827;
            --text-secondary: #4b5563;
            --bg-white: #ffffff;
            --bg-gray: #f9fafb;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-gray);
            color: var(--text-primary);
            min-height: 100vh;
        }

        /* Header Styles */
        .header {
            background-color: var(--bg-white);
            border-bottom: 1px solid #e5e7eb;
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        .header-container {
            max-width: 1280px;
            margin: 0 auto;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo-section {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .brand-name {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--text-primary);
            text-decoration: none;
        }

        .nav-menu {
            display: flex;
            gap: 2rem;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            text-decoration: none;
            color: var(--text-secondary);
            font-weight: 500;
            transition: color 0.2s ease;
        }

        .nav-link:hover {
            color: var(--primary-color);
        }

        /* Dashboard Styles */
        .dashboard-container {
            max-width: 800px;
            margin: 6rem auto 2rem;
            padding: 2rem;
            background-color: var(--bg-white);
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }

        h1, h2 {
            text-align: center;
            margin-bottom: 1rem;
        }

        /* Filter Styles */
        .filters {
            display: flex;
            gap: 1rem;
            margin-bottom: 1rem;
            align-items: center;
        }

        .filter-input {
            flex: 1;
            padding: 0.5rem;
            font-size: 1rem;
            border: 1px solid #e5e7eb;
            border-radius: 0.5rem;
        }

        .filter-checkbox {
            margin-left: 1rem;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        th, td {
            border: 1px solid #e5e7eb;
            padding: 0.75rem;
            text-align: left;
        }

        th {
            background-color: var(--bg-gray);
            font-weight: 600;
        }

        td {
            background-color: var(--bg-white);
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="header-container">
            <div class="logo-section">
                <img src="SDP_LOGO.jpg" alt="Logo" width="40" height="40">
                <a href="/teacherhome_af_login" class="brand-name">upgrist</a>
            </div>
            <nav class="nav-menu">
                <a href="/teacherhome_af_login" class="nav-link">Home</a>
                <a href="/contactaf" class="nav-link">Contact</a>
                <a href="/aboutaf" class="nav-link">About</a>
                <a href="/" class="nav-link">Logout</a>
            </nav>
        </div>
    </header>

    <main class="dashboard-container">
       <!--  <h1>Upload Course Mapping File</h1>
        <form id="uploadForm">
            <label for="file" class="form-label">Choose Excel File:</label>
            <input type="file" id="file" name="file" accept=".xls,.xlsx" required>
            <button type="submit">Upload</button>
        </form>

        <div id="statusMessage"></div>  --> 

        <h2>Course Marks</h2>

        <!-- Filters -->
        <div class="filters">
            <input type="text" id="filterStudentId" class="filter-input" placeholder="Filter by Student ID">
            <input type="text" id="filterCourseName" class="filter-input" placeholder="Filter by Course Name">
          <!--   <label class="filter-checkbox">
                <input type="checkbox" id="filterAttendance"> Show Attendance < 85
            </label>  -->
        </div>

        <table id="marksTable">
            <thead>
                <tr>
                    <th>Course ID</th>
                    <th>Course Name</th>
                    <th>Student ID</th>
                    <th>Marks</th>
                </tr>
            </thead>
            <tbody>
                <!-- Data will be dynamically loaded here -->
            </tbody>
        </table>
    </main>

    <script>
        $(document).ready(function () {
            // Handle form submission
            $("#uploadForm").on("submit", function (e) {
                e.preventDefault();

                var formData = new FormData();
                formData.append("file", $("#file")[0].files[0]);

                $("#statusMessage").text("Uploading... Please wait.");

                $.ajax({
                    url: "/course/upload",
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function () {
                        $("#statusMessage").text("Upload successful!");
                        fetchCourseMarks();
                    },
                    error: function () {
                        $("#statusMessage").text("Error uploading file. Please try again.");
                    }
                });
            });

            // Fetch and display course marks
            function fetchCourseMarks() {
                $.ajax({
                    url: "/course/marks",
                    type: "GET",
                    success: function (response) {
                        const tbody = $("#marksTable tbody");
                        tbody.empty();

                        response.forEach((mapping) => {
                            const row = `
                                <tr>
                                    <td>${mapping.courseId}</td>
                                    <td>${mapping.courseName}</td>
                                    <td>${mapping.studentId}</td>
                                    <td>${mapping.marks}</td>
                                </tr>`;
                            tbody.append(row);
                        });
                    },
                    error: function () {
                        $("#statusMessage").text("Error fetching course marks. Please try again.");
                    }
                });
            }

            // Filter functionality
            function filterTable() {
                const studentIdFilter = $("#filterStudentId").val().toLowerCase();
                const courseNameFilter = $("#filterCourseName").val().toLowerCase();
                const attendanceFilter = $("#filterAttendance").is(":checked");

                $("#marksTable tbody tr").each(function () {
                    const studentId = $(this).find("td:nth-child(3)").text().toLowerCase();
                    const courseName = $(this).find("td:nth-child(2)").text().toLowerCase();
                    const attendance = parseFloat($(this).find("td:nth-child(5)").text());

                    const matchesStudentId = studentId.includes(studentIdFilter);
                    const matchesCourseName = courseName.includes(courseNameFilter);
                    const matchesAttendance = attendanceFilter ? attendance < 85 : true;

                    if (matchesStudentId && matchesCourseName && matchesAttendance) {
                        $(this).show();
                    } else {
                        $(this).hide();
                    }
                });
            }

            // Bind filter input events
            $("#filterStudentId, #filterCourseName, #filterAttendance").on("input change", filterTable);

            // Initial fetch of course marks
            fetchCourseMarks();
        });
    </script>
</body>
</html>
