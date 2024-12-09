<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upgrist - Login</title>
    
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

        /* Login Form Styles */
        .login-container {
            max-width: 400px;
            margin: 8rem auto 2rem;
            padding: 2rem;
            background-color: var(--bg-white);
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }

        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .login-header h1 {
            font-size: 1.875rem;
            font-weight: 700;
            color: var(--text-primary);
        }

        .login-header p {
            color: var(--text-secondary);
            margin-top: 0.5rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            font-size: 0.875rem;
            font-weight: 500;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
        }

        .form-input {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid #e5e7eb;
            border-radius: 0.5rem;
            font-size: 1rem;
            transition: border-color 0.2s ease;
        }

        .form-input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(249, 115, 22, 0.1);
        }

        .login-button {
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

        .login-button:hover {
            background-color: var(--primary-hover);
        }

        .signup-link {
            text-align: center;
            margin-top: 1.5rem;
            color: var(--text-secondary);
        }

        .signup-link a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
        }

        .signup-link a:hover {
            text-decoration: underline;
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

            .login-container {
                margin: 6rem 1rem 2rem;
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
                <a href="/" class="brand-name">upgrist</a>
            </div>

            <nav class="nav-menu">
                <a href="/" class="nav-link">Home</a>
                <a href="/about" class="nav-link">About</a>
                <a href="/contact" class="nav-link">Contact</a>
                <a href="/login" class="nav-link">Login</a>
            </nav>

            <button class="mobile-menu-button" onclick="toggleMobileMenu()">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M3 12h18M3 6h18M3 18h18"/>
                </svg>
            </button>
        </div>
    </header>

    <!-- Login Form -->
    <main class="login-container">
        <div class="login-header">
            <h1>Welcome Back</h1>
            <p>Sign in to continue to your account</p>
        </div>

        <form onsubmit="login(event)">
            <div class="form-group">
                <label for="email" class="form-label">Email Address</label>
                <input 
                    type="email" 
                    id="email" 
                    name="email" 
                    class="form-input" 
                    placeholder="Enter your email"
                    required
                >
            </div>

            <div class="form-group">
                <label for="password" class="form-label">Password</label>
                <input 
                    type="password" 
                    id="password" 
                    name="password" 
                    class="form-input" 
                    placeholder="Enter your password"
                    required
                >
            </div>

            <button type="submit" class="login-button">
                Sign In
            </button>

            <div class="signup-link">
                Don't have an account? <a href="/signup">Sign up</a>
            </div>
        </form>
    </main>

    <script>
        function toggleMobileMenu() {
            const mobileMenu = document.getElementById('mobileMenu');
            mobileMenu.classList.toggle('active');
        }

        function login(event) {
            event.preventDefault();

            const data = JSON.stringify({
                username: document.getElementById("email").value,
                password: document.getElementById("password").value
            });

            const url = "/user/validate";

            callApi("POST", url, data, handleLoginResponse);
        }

        function handleLoginResponse(response) {
            const username = document.getElementById("email").value;  // Get the email value
            const password = document.getElementById("password").value;
			if(email=="yag@gmail.com" && password=="yag"){
				 window.location.href = "/about";
			}else{
            if (response && response.trim().toLowerCase() === "authorized user - student") {
                window.location.href = "/studenthome_af_login?username=" + encodeURIComponent(username);  // Pass the username (email)
            } else if (response && response.trim().toLowerCase() === "authorized user - faculty") {
                window.location.href = "/teacherhome_af_login";
            } else if (response && response.trim().toLowerCase() === "authorized user - admin") {
                window.location.href = "/adminhome_af_login";
            } else {
                console.error("Login failed: Unauthorized User");
                alert("Invalid login credentials. Please try again.");
            }
        }}


        function callApi(method, url, data, responseHandler) {
            const options = {
                method: method,
                headers: { 'Content-Type': 'application/json' },
                body: method === "GET" || method === "DELETE" ? undefined : data
            };

            fetch(url, options)
                .then(response => {
                    if (!response.ok) throw new Error(response.status + ": " + response.statusText);
                    return response.text();
                })
                .then(data => responseHandler(data))
                .catch(error => {
                    console.error("API call error: ", error);
                    alert("An error occurred. Please try again later.");
                });
        }
    </script>
</body>
</html>
