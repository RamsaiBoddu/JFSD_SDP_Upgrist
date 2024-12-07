<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upgrist - Signup</title>
    
    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap">
    
    <style>
        /* Reuse styles from the login page */
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
        }

        .signup-container {
            max-width: 500px;
            margin: 8rem auto 2rem;
            padding: 2rem;
            background-color: var(--bg-white);
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }

        .signup-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .signup-header h1 {
            font-size: 1.875rem;
            font-weight: 700;
            color: var(--text-primary);
        }

        .signup-header p {
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

        .signup-button {
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

        .signup-button:hover {
            background-color: var(--primary-hover);
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
    <main class="signup-container">
        <div class="signup-header">
            <h1>Create Your Account</h1>
            <p>Join us and start managing your profile</p>
        </div>

        <form onsubmit="submitSignup(event)">
        	<div class="form-group">
                <label for="username" class="form-label">Id</label>
                <input 
                    type="text" 
                    id="id" 
                    name="id" 
                    class="form-input" 
                    placeholder="Enter your Id"
                    required
                >
            </div>
            <!-- Username -->
            <div class="form-group">
                <label for="username" class="form-label">Username</label>
                <input 
                    type="text" 
                    id="username" 
                    name="username" 
                    class="form-input" 
                    placeholder="Enter your username"
                    required
                >
            </div>

            <!-- Password -->
            <div class="form-group">
                <label for="password" class="form-label">Password</label>
                <input 
                    type="password" 
                    id="password" 
                    name="password" 
                    class="form-input" 
                    placeholder="Create a password"
                    required
                >
            </div>

            <!-- First Name -->
            <div class="form-group">
                <label for="firstname" class="form-label">First Name</label>
                <input 
                    type="text" 
                    id="firstname" 
                    name="firstname" 
                    class="form-input" 
                    placeholder="Enter your first name"
                    required
                >
            </div>

            <!-- Last Name -->
            <div class="form-group">
                <label for="lastname" class="form-label">Last Name</label>
                <input 
                    type="text" 
                    id="lastname" 
                    name="lastname" 
                    class="form-input" 
                    placeholder="Enter your last name"
                    required
                >
            </div>

            <!-- Role -->
            <div class="form-group">
                <label for="role" class="form-label">Role</label>
                <select 
                    id="role" 
                    name="role" 
                    class="form-input" 
                    required>
                    <option value="student">Student</option>
                    <option value="faculty">Faculty</option>
                </select>
            </div>

            <!-- Date of Birth -->
            <div class="form-group">
                <label for="dob" class="form-label">Date of Birth</label>
                <input 
                    type="date" 
                    id="dob" 
                    name="dob" 
                    class="form-input"
                    required
                >
            </div>

            <!-- Parent Email -->
            <div class="form-group">
                <label for="parentEmail" class="form-label">Parent Email</label>
                <input 
                    type="email" 
                    id="parentEmail" 
                    name="parentEmail" 
                    class="form-input"
                    placeholder="Enter parent's email"
                    required
                >
            </div>

            <!-- Phone Number -->
            <div class="form-group">
                <label for="phoneNumber" class="form-label">Phone Number</label>
                <input 
                    type="tel" 
                    id="phoneNumber" 
                    name="phoneNumber" 
                    class="form-input"
                    placeholder="Enter your phone number"
                    required
                >
            </div>

            <button type="submit" class="signup-button">Sign Up</button>
        </form>
    </main>

    <script>
        function submitSignup(event) {
            event.preventDefault();

            const formData = {
            	id: document.getElementById("id").value,
                username: document.getElementById("username").value,
                password: document.getElementById("password").value,
                firstname: document.getElementById("firstname").value,
                lastname: document.getElementById("lastname").value,
                role: document.getElementById("role").value,
                dob: document.getElementById("dob").value,
                parentEmail: document.getElementById("parentEmail").value,
                phoneNumber: document.getElementById("phoneNumber").value
            };

            const url = "/user/signup";

            fetch(url, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(formData)
            })
            .then(response => {
                if (response.ok) {
                    alert("Signup successful! Please log in.");
                    window.location.href = "/login";
                } else {
                    alert("Error signing up. Please try again.");
                }
            })
            .catch(error => {
                console.error("Signup error: ", error);
                alert("An error occurred. Please try again.");
            });
        }
    </script>
</body>
</html>
