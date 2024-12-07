<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upgrist - Admin Dashboard</title>
    
    <!-- Google Fonts -->
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

        /* Hero Section */
        .hero {
            margin-top: 4rem;
            position: relative;
            height: 400px;
            overflow: hidden;
        }

        .hero-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .hero-overlay {
            position: absolute;
            inset: 0;
            background: rgba(0, 0, 0, 0.5);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .hero-title {
            color: white;
            font-size: 3rem;
            font-weight: 700;
            text-align: center;
            max-width: 800px;
            padding: 0 2rem;
        }

        /* Dashboard Grid */
        .dashboard {
            max-width: 1280px;
            margin: 3rem auto;
            padding: 0 2rem;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 1.5rem;
        }

        .dashboard-card {
            background: var(--bg-white);
            border-radius: 0.75rem;
            padding: 1.5rem;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .dashboard-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .card-icon {
            width: 48px;
            height: 48px;
            background-color: var(--primary-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
        }

        .card-icon svg {
            width: 24px;
            height: 24px;
            color: white;
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .card-description {
            color: var(--text-secondary);
            margin-bottom: 1.5rem;
        }

        .card-button {
            width: 100%;
            padding: 0.75rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 0.5rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .card-button:hover {
            background-color: var(--primary-hover);
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

            .hero-title {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-container">
            <div class="logo-section">
                <img src="SDP_LOGO.jpg" alt="Upgrist Logo" width="40" height="40">
                <a href="/adminhome_af_login" class="brand-name">upgrist</a>
            </div>

            <nav class="nav-menu">
                <a href="/adminhome_af_login" class="nav-link">Home</a>
                <a href="/contactaf" class="nav-link">Contact</a>
                <a href="/aboutaf" class="nav-link">About</a>
                <a href="/" class="nav-link">Logout</a>
            </nav>

            <button class="mobile-menu-button" onclick="toggleMobileMenu()">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M3 12h18M3 6h18M3 18h18"/>
                </svg>
            </button>
        </div>

       <!--   <div id="mobileMenu" class="mobile-menu">
            <a href="/adminhome_af_login" class="mobile-nav-link">Home</a>
            <a href="/contactaf" class="mobile-nav-link">Contact</a>
            <a href="//aboutaf" class="mobile-nav-link">About</a>
            <a href="/login" class="mobile-nav-link">Login</a>
        </div> -->
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <img src="https://images.unsplash.com/photo-1606761568499-6d2451b23c66?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80" 
             alt="Education Background" 
             class="hero-image">
        <div class="hero-overlay">
            <h1 class="hero-title">Welcome to Admin Dashboard</h1>
        </div>
    </section>

    <!-- Dashboard Section -->
    <!-- Dashboard Section -->
<section class="dashboard">
    <div class="dashboard-grid">
        <!-- Grades Card -->
        

        <!-- Marks Card -->
        <div class="dashboard-card">
            <div class="card-icon">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M9 11l3 3L22 4"/>
                    <path d="M21 12v7a2 2 0 01-2 2H5a2 2 0 01-2-2V5a2 2 0 012-2h11"/>
                </svg>
            </div>
            <h2 class="card-title">View Marks</h2>
            <p class="card-description">Access your examination scores and results</p>
            <a href="/view_marks_teacher">
            <button class="card-button">View Marks</button>
            </a>
        </div>
        
        <div class="dashboard-card">
            <div class="card-icon">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M9 11l3 3L22 4"/>
                    <path d="M21 12v7a2 2 0 01-2 2H5a2 2 0 01-2-2V5a2 2 0 012-2h11"/>
                </svg>
            </div>
            <h2 class="card-title">Map Courses</h2>
            <p class="card-description">Map courses with Students & Faculty</p>
            <a href="/course_mapping_csv">
            <button class="card-button">Map Courses</button>
            </a>
        </div>

        <!-- Details Card -->
        

        <!-- Attendance Card -->
        <div class="dashboard-card">
            <div class="card-icon">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"/>
                    <line x1="16" y1="2" x2="16" y2="6"/>
                    <line x1="8" y1="2" x2="8" y2="6"/>
                    <line x1="3" y1="10" x2="21" y2="10"/>
                </svg>
            </div>
            <h2 class="card-title">View Attendance</h2>
            <p class="card-description">Track your attendance records and history</p>
            <a href="/admin_view_attendance">
            <button class="card-button">View Attendance</button>
            </a>
        </div>

        <!-- View Users Card -->
        <div class="dashboard-card">
            <div class="card-icon">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M12 14c2 0 4 1 4 2v2H8v-2c0-1 2-2 4-2z"/>
                    <circle cx="12" cy="7" r="4"/>
                </svg>
            </div>
            <h2 class="card-title">View Users</h2>
            <p class="card-description">View the list of registered users</p>
            <a href="/display_users">
                <button class="card-button">View Users</button>
            </a>
        </div>

        <!-- View Faculty Card -->
        <div class="dashboard-card">
            <div class="card-icon">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <circle cx="12" cy="7" r="4"/>
                    <path d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4 4v2"/>
                </svg>
            </div>
            <h2 class="card-title">View Faculty</h2>
            <p class="card-description">View details about the faculty members</p>
            <a href="/display_faculty">
                <button class="card-button">View Faculty</button>
            </a>
        </div>
    </div>
</section>


    <script>
        function toggleMobileMenu() {
            const mobileMenu = document.getElementById('mobileMenu');
            mobileMenu.classList.toggle('active');
        }
    </script>
</body>
</html>