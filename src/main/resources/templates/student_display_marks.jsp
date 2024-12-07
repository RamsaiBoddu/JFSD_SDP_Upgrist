<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Mapping</title>

    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap">

    <style>
        /* Header Styles */
        .header {
            background-color: var(--bg-white);
            border-bottom: 1px solid #e5e7eb;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
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
            text-decoration: none;
            color: var(--text-secondary);
            font-weight: 500;
            transition: color 0.2s ease;
        }

        .nav-link:hover {
            color: var(--primary-color);
        }

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
            padding-top: 4rem; /* Offset for the fixed header */
        }

        /* Content Styles */
        .container {
            max-width: 800px;
            margin: 2rem auto;
            background: #ffffff;
            border-radius: 8px;
            padding: 1.5rem;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            font-size: 1.8rem;
            margin-bottom: 1rem;
            color: var(--text-primary);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        table th, table td {
            border: 1px solid #e5e7eb;
            padding: 0.75rem;
            text-align: left;
        }

        table th {
            background-color: var(--primary-color);
            color: #ffffff;
        }

        table tr:nth-child(even) {
            background-color: var(--bg-gray);
        }

        .error-message {
            color: #ff4d4f;
            font-size: 1rem;
            text-align: center;
            margin-top: 2rem;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-container">
            <div class="logo-section">
                <img src="SDP_LOGO.jpg" alt="Upgrist Logo" width="40" height="40">
                <a href="/" class="brand-name">upgrist</a>
            </div>

            <nav class="nav-menu">
                <a href="/" class="nav-link">Home</a>
                <a href="/aboutaf" class="nav-link">About</a>
                <a href="/contactaf" class="nav-link">Contact</a>
                <a href="/" class="nav-link">Logout</a>
            </nav>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <h2>Marks Obtained</h2>
        <!-- Error message section -->
        <div class="error-message" id="errorMessage" style="display: none;">
            <!-- Error message will be displayed here -->
        </div>

        <table>
            <thead>
                <tr>
                    <th>Course ID</th>
                    <th>Course Name</th>
                    <th>Student ID</th>
                    <th>Marks</th>
                </tr>
            </thead>
            <tbody>
                <!-- Course Mapping rows will be inserted here -->
            </tbody>
        </table>
    </div>

    <script>
        // Fetch course mapping data based on the studentId
        async function fetchCourseMappingData(studentId) {
    try {
        // Ensure the URL uses `studentId` as the query parameter
        const response = await fetch(`http://localhost:1349/course/course-mapping?studentId=${studentId}`);
        
        if (response.ok) {
            const courseMappings = await response.json();
            updateCourseMappingTable(courseMappings);
        } else {
            showError("Course Mapping data could not be found.");
        }
    } catch (error) {
        console.error("Error fetching course mapping data:", error);
        showError("An error occurred while fetching course mapping data.");
    }
}


        // Update the course mapping table with the fetched data
        function updateCourseMappingTable(courseMappings) {
            const tableBody = document.querySelector("table tbody");

            // Clear the table body before adding new rows
            tableBody.innerHTML = "";

            // Populate the table with course mapping data
            courseMappings.forEach(courseMapping => {
                const row = document.createElement("tr");
                
                row.innerHTML = `
                    <td>${courseMapping.courseId}</td>
                    <td>${courseMapping.courseName}</td>
                    <td>${courseMapping.studentId}</td>
                    <td>${courseMapping.marks}</td>
                `;

                tableBody.appendChild(row);
            });
        }

        // Display an error message
        function showError(message) {
            const errorMessage = document.getElementById("errorMessage");

            if (errorMessage) {
                errorMessage.textContent = message;
                errorMessage.style.display = "block"; // Show the error message
            } else {
                console.error("Error message element not found in the DOM.");
            }
        }

        // Get the studentId from the URL query string
        // Get the studentId from the URL query string
function getStudentIdFromURL() {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get("studentId"); // Use the correct query parameter name "studentId"
}

// On page load, fetch and display the course mappings for the provided studentId
document.addEventListener("DOMContentLoaded", () => {
    const studentId = getStudentIdFromURL();
    if (studentId) {
        fetchCourseMappingData(studentId);
    } else {
        showError("No studentId provided in the URL.");
    }
});

    </script>

</body>
</html>
