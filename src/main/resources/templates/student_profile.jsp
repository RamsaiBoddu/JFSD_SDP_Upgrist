<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Information</title>

    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap">

    <style>
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

        /* Mobile Menu */
        .mobile-menu-button {
            display: none;
        }

        @media (max-width: 768px) {
            .nav-menu {
                display: none;
            }

            .mobile-menu-button {
                display: block;
                background: none;
                border: none;
                padding: 0.5rem;
                cursor: pointer;
            }

            .mobile-menu {
                display: none;
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                background: var(--bg-white);
                padding: 1rem;
                border-top: 1px solid #e5e7eb;
            }

            .mobile-menu.active {
                display: block;
            }

            .mobile-nav-link {
                display: block;
                padding: 0.75rem 1rem;
                color: var(--text-secondary);
                text-decoration: none;
                font-weight: 500;
            }

            .mobile-nav-link:hover {
                background-color: var(--bg-gray);
                color: var(--primary-color);
            }
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
            min-height: 100vh;
            padding-top: 4rem; /* Add space for the header */
        }

        .user-info-container {
            max-width: 600px;
            margin: 2rem auto;
            background: #ffffff;
            border-radius: 8px;
            padding: 1.5rem;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .user-info-container h2 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: #333;
        }

        .user-info-container p {
            font-size: 1rem;
            margin: 0.5rem 0;
            color: #555;
        }

        .user-info-container .label {
            font-weight: bold;
        }
       .profile-icon {
            width: 150px;                
            height: 150px;              
            background-color: #e0e0e0;  /* Grey background for fallback */
            border-radius: 50%;         /* Circle shape */
            overflow: hidden;           /* Ensures image fits within the circle */
            display: flex;
            justify-content: center;    /* Center the image horizontally */
            align-items: center;        /* Center the image vertically */
            margin: 0 auto; 
        }

        .profile-icon img {
            width: 100%;                /* Ensure image width is 100% of the container */
            height: 100%;               /* Ensure image height is 100% of the container */
            object-fit: cover;          /* Ensures the image covers the whole circle, cropping if necessary */
        }

        /* Optional: Add a label below the icon */
        .profile-label {
            text-align: center;
            margin-top: 10px;
            font-size: 16px;
            color: #555;
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
                <a href="/studenthome_af_login" class="brand-name">upgrist</a>
            </div>

            <nav class="nav-menu">
                <a href="/studenthome_af_login" class="nav-link">Home</a>
                <a href="/aboutaf" class="nav-link">About</a>
                <a href="/contactaf" class="nav-link">Contact</a>
                <a href="/" class="nav-link">Logout</a>
            </nav>

            <button class="mobile-menu-button" onclick="toggleMobileMenu()">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M3 12h18M3 6h18M3 18h18"/>
                </svg>
            </button>
        </div>
    </header>

    <!-- User Information Container -->
    <div class="user-info-container" id="userInfo">
    <div class="profile-icon">
        <img src="blank_dp.png" alt="Blank Profile Picture">
    </div>
    <div class="profile-label"></div>
        <h2>Personal Information</h2>
        <p><span class="label">Username:</span> <span id="info-username">Loading...</span></p>
        <p><span class="label">First Name:</span> <span id="info-firstname">Loading...</span></p>
        <p><span class="label">Last Name:</span> <span id="info-name">Loading...</span></p>
        <p><span class="label">DOB:</span> <span id="info-dob">Loading...</span></p>
        <p><span class="label">Role:</span> <span id="info-role">Loading...</span></p>
    </div>

    <p class="error-message" id="errorMessage" style="display: none;">User information could not be loaded. Please try again later.</p>

    <script>
        // Fetch user information based on the username parameter in the URL
        async function fetchUserInfo(username) {
            try {
                // Call the backend API to fetch user information
                const response = await fetch(`http://localhost:1349/getusers/info?username=${username}`);

                // Handle the response
                if (response.ok) {
                    const user = await response.json();

                    // Populate user information in the UI
                    document.getElementById("info-username").textContent = user.username || "N/A";
                    document.getElementById("info-firstname").textContent = user.firstname || "N/A";
                    document.getElementById("info-name").textContent = user.name || "N/A";
                    document.getElementById("info-dob").textContent = user.dob || "N/A";
                    document.getElementById("info-role").textContent = user.role || "N/A";
                } else {
                    // Show an error message if the user is not found
                    showError("User information could not be found.");
                }
            } catch (error) {
                // Handle any network or API errors 
                console.error("Error fetching user information:", error);
                showError("An error occurred while fetching user information.");
            }
        }

        // Display an error message and hide the user information section
        function showError(message) {
            document.getElementById("userInfo").style.display = "none";
            const errorMessage = document.getElementById("errorMessage");
            errorMessage.textContent = message;
            errorMessage.style.display = "block";
        }

        // Get the username from the URL query string
        function getUsernameFromURL() {
            const urlParams = new URLSearchParams(window.location.search);
            return urlParams.get("username");
        }

        // On page load, fetch and display the user's information
        document.addEventListener("DOMContentLoaded", () => {
            const username = getUsernameFromURL();
            if (username) {
                fetchUserInfo(username);
            } else {
                showError("No username provided in the URL.");
            }
        });
    </script>
</body>
</html>
