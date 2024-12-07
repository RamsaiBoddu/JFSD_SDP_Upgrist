<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upgrist - About</title>
    
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

        /* About Content Styles */
        .about-container {
            max-width: 1000px;
            margin: 8rem auto 4rem;
            padding: 0 2rem;
        }

        .about-header {
            text-align: center;
            margin-bottom: 4rem;
        }

        .about-header h1 {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 1rem;
        }

        .about-header p {
            font-size: 1.125rem;
            color: var(--text-secondary);
            max-width: 600px;
            margin: 0 auto;
            line-height: 1.7;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .feature-card {
            background: var(--bg-white);
            border-radius: 1rem;
            padding: 2rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease;
        }

        .feature-card:hover {
            transform: translateY(-4px);
        }

        .feature-icon {
            width: 48px;
            height: 48px;
            background-color: #fff3e0;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.5rem;
        }

        .feature-icon svg {
            width: 24px;
            height: 24px;
            color: var(--primary-color);
        }

        .feature-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 1rem;
        }

        .feature-description {
            color: var(--text-secondary);
            line-height: 1.6;
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

            .about-header h1 {
                font-size: 2rem;
            }

            .about-container {
                margin-top: 6rem;
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
                <a href="/aboutaf" class="brand-name">upgrist</a>
            </div>

            <nav class="nav-menu">
                <a href="/aboutaf" class="nav-link">Home</a>
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

    </header>

    <!-- About Content -->
    <main class="about-container">
        <div class="about-header">
            <h1>About Upgrist</h1>
            <p>Empowering education through innovative technology and data-driven insights. We help institutions and students achieve their full potential with our comprehensive analytics platform.</p>
        </div>

        <div class="features-grid">
            <!-- Analytics Feature -->
            <div class="feature-card">
                <div class="feature-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M21 21H3M21 21V3M21 16L17 12L13 16L9 12L5 16"/>
                    </svg>
                </div>
                <h3 class="feature-title">Advanced Analytics</h3>
                <p class="feature-description">Gain valuable insights through interactive dashboards and detailed performance metrics tracking.</p>
            </div>

            <!-- Reports Feature -->
            <div class="feature-card">
                <div class="feature-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/>
                        <path d="M14 2v6h6M16 13H8M16 17H8M10 9H8"/>
                    </svg>
                </div>
                <h3 class="feature-title">Comprehensive Reports</h3>
                <p class="feature-description">Generate detailed academic reports with customizable parameters for in-depth analysis.</p>
            </div>

            <!-- Performance Feature -->
            <div class="feature-card">
                <div class="feature-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M22 12h-4l-3 9L9 3l-3 9H2"/>
                    </svg>
                </div>
                <h3 class="feature-title">Performance Tracking</h3>
                <p class="feature-description">Monitor academic progress with real-time updates and historical performance data.</p>
            </div>

            <!-- Collaboration Feature -->
            <div class="feature-card">
                <div class="feature-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/>
                        <circle cx="9" cy="7" r="4"/>
                        <path d="M23 21v-2a4 4 0 00-3-3.87M16 3.13a4 4 0 010 7.75"/>
                    </svg>
                </div>
                <h3 class="feature-title">Seamless Collaboration</h3>
                <p class="feature-description">Enable effective communication between students, teachers, and administrators.</p>
            </div>
        </div>
    </main>

    <script>
        function toggleMobileMenu() {
            const mobileMenu = document.getElementById('mobileMenu');
            mobileMenu.classList.toggle('active');
        }
    </script>
</body>
</html>