<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Upgrist - Contact Support</title>
  
  <!-- Google Fonts for the style -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <style>
    body {
      font-family: 'Roboto', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f9f9f9;
    }

    /* AppBar Styles */
    .appbar {
      background-color: white;
      border-bottom: 1px solid #e0e0e0;
      box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
      position: static;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 0 20px;
      height: 64px;
    }

    /* Logo and Brand Section */
    .logo-brand {
      display: flex;
      align-items: center;
    }

    .logo-brand img {
      height: 40px;
      width: auto;
      margin-right: 10px;
    }

    .logo-brand .brand {
      font-family: 'Roboto', sans-serif;
      color: black;
      text-decoration: none;
      font-size: 28px;
    }

    /* Navbar Menu */
    .navbar-menu {
      display: flex;
      gap: 20px;
      align-items: center;
    }

    .navbar-menu a {
      text-decoration: none;
      color: black;
      font-size: 16px;
      display: flex;
      align-items: center;
    }

    .navbar-menu a:hover {
      text-decoration: underline;
    }

    .navbar-menu i {
      margin-right: 8px;
    }

    /* Contact Support Section */
    .contact-support {
      margin: 40px auto;
      max-width: 800px;
      background-color: white;
      padding: 20px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }

    .contact-support h2 {
      text-align: center;
      margin-bottom: 20px;
      color: #333;
    }

    .contact-support form {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    .contact-support input, .contact-support textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 16px;
    }

    .contact-support button {
      padding: 10px 20px;
      background-color: #28a745;
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
    }

    .contact-support button:hover {
      background-color: #218838;
    }

    @media (max-width: 768px) {
      .navbar-menu {
        display: none;
      }

      .menu-icon {
        display: block;
        cursor: pointer;
      }
    }
  </style>
</head>
<body>

  <!-- AppBar -->
  <div class="appbar">
    <div class="logo-brand">
      <img src="SDP_LOGO.jpg" alt="Upgrist Logo" width="40" height="40">
      <a href="#" class="brand">upgrist</a>
    </div>
    <div class="navbar-menu">
      <a href="/" class="nav-link">Home</a>
      <a href="/about" class="nav-link">About</a>
      <a href="/login"><i class="material-icons">person</i>Login</a>
    </div>
  </div>

  <!-- Contact Support Section -->
  <div class="contact-support">
    <h2>Contact Support</h2>
    <form action="#" method="post">
      <label for="name">Name</label>
      <input type="text" id="name" name="name" placeholder="Your name" required>

      <label for="email">Email</label>
      <input type="email" id="email" name="email" placeholder="Your email" required>

      <label for="message">Message</label>
      <textarea id="message" name="message" rows="5" placeholder="How can we help you?" required></textarea>

      <button type="submit">Submit</button>
    </form>
  </div>

  <script>
    // Toggle mobile menu visibility (Optional, if needed later)
    function toggleMenu() {
      const menu = document.getElementById('mobileMenu');
      menu.style.display = (menu.style.display === 'block') ? 'none' : 'block';
    }
  </script>

</body>
</html>
