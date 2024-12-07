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

        /* Upload Form Styles */
        .dashboard-container {
            max-width: 800px;
            margin: 6rem auto 2rem;
            padding: 2rem;
            background-color: var(--bg-white);
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }

        .dashboard-container h1 {
            font-size: 1.875rem;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 2rem;
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .form-label {
            font-size: 1rem;
            color: var(--text-primary);
        }

        input[type="file"] {
            font-size: 1rem;
            padding: 0.75rem 1rem;
            border: 1px solid #e5e7eb;
            border-radius: 0.5rem;
            transition: border-color 0.2s ease;
        }

        input[type="file"]:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(249, 115, 22, 0.1);
        }

        button {
            width: 100%;
            padding: 0.75rem 1.5rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 0.5rem;
            font-weight: 500;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        button:hover {
            background-color: var(--primary-hover);
        }

        #statusMessage {
            text-align: center;
            font-size: 1rem;
            color: var(--text-secondary);
            margin-top: 1rem;
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
        <h1>Upload Course Mapping File</h1>
        <form id="uploadForm">
            <label for="file" class="form-label">Choose Excel File:</label>
            <input type="file" id="file" name="file" accept=".xls,.xlsx" required>
            <button type="submit">Upload</button>
        </form>

        <div id="statusMessage"></div>
    </main>

    <script>
        $(document).ready(function() {
            // Handle form submission
            $("#uploadForm").on("submit", function(e) {
                e.preventDefault(); // Prevent form submission

                var formData = new FormData();
                formData.append("file", $("#file")[0].files[0]);

                // Show loading message
                $("#statusMessage").text("Uploading... Please wait.");

                $.ajax({
                    url: "/course/upload", // The API endpoint
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        $("#statusMessage").text("Upload successful!");
                    },
                    error: function(xhr, status, error) {
                        $("#statusMessage").text("Error uploading file. Please try again.");
                    }
                });
            });
        });
    </script>
</body>
</html>
