<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <!-- Google Fonts -->
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
            box-shadow: 0px 2px 4px -1px rgba(0, 0, 0, 0.2), 0px 4px 5px 0px rgba(0, 0, 0, 0.14), 0px 1px 10px 0px rgba(0, 0, 0, 0.12);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            height: 64px;
        }

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
            font-size: 24px;
            font-weight: bold;
        }

        .navbar-menu {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .navbar-menu a {
            text-decoration: none;
            color: black;
            font-size: 16px;
        }

        .navbar-menu a:hover {
            text-decoration: underline;
        }

        /* Main Content */
        .content {
            padding: 20px;
            margin: 0 auto;
            max-width: 1200px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        td {
            font-size: 14px;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .action-buttons button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px 16px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 5px;
        }

        .action-buttons button.delete {
            background-color: #ff4d4d;
        }

        .action-buttons button:hover {
            opacity: 0.9;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border-radius: 10px;
            width: 50%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .modal-header {
            font-size: 20px;
            margin-bottom: 20px;
        }

        .modal-footer {
            text-align: right;
        }

        .modal-footer button {
            margin-left: 10px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .modal-footer button.save {
            background-color: #007bff;
            color: white;
        }

        .modal-footer button.cancel {
            background-color: #ff4d4d;
            color: white;
        }

        .modal input {
            width: 100%;
            margin: 10px 0;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <!-- AppBar -->
    <div class="appbar">
        <div class="logo-brand">
            <img src="SDP_LOGO.jpg" alt="Upgrist Logo" width="40" height="40">
            <a href="" class="brand">upgrist</a>
        </div>
        <div class="navbar-menu">
            <a href="/"><i class="material-icons">home</i>Home</a>
            <a href="/contactaf"><i class="material-icons">contact_support</i>Contact</a>
            <a href="/aboutaf"><i class="material-icons">info</i>About</a>
            <a href="/"><i class="material-icons">person</i>Logout</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="content">
        <h1>User List</h1>
        <table>
            <thead>
                <tr>
                	<th>ID No</th>
                    <th>Username</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Year</th>
                    <th>Date of Birth</th>
                    <th>Phone Number</th>
<th>Parent Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="userTableBody">
                <!-- Rows will be added dynamically -->
            </tbody>
        </table>
    </div>

    <!-- Edit User Modal -->
    <div class="modal" id="editUserModal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>Edit User</h2>
        <form id="editUserForm">
        	<label for="id">ID No:</label>
            <input type="text" id="id" name="id" value="">
        
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="">

            <label for="firstname">First Name:</label>
            <input type="text" id="firstname" name="firstname" value="">

            <label for="lastname">Last Name:</label>
            <input type="text" id="lastname" name="lastname" value="">

            <label for="year">Year:</label>
            <input type="number" id="year" name="year" value="">

            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" value="">
            
            <label for="phonenumber">Phone Number:</label>
<input type="number" id="phonenumber" name="phonenumber" value="">

<label for="parentemail">Parent Email:</label>
<input type="email" id="parentemail" name="parentemail" value="">
            

            <button type="submit">Update</button>
        </form>
    </div>
</div>

    <script>
    let users = []; // To store user data

    // Fetch users from the API
    fetch('http://localhost:1349/user/allusers')
        .then(response => response.json())
        .then(data => {
            users = data;
            const tableBody = document.getElementById('userTableBody');
            tableBody.innerHTML = '';
            const studentUsers = data.filter(user => user.role === 'faculty');
            studentUsers.forEach(user => {
                const row = document.createElement('tr');
                row.innerHTML = `
                	<td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.firstname}</td>
                    <td>${user.name}</td>
                    <td>${user.year}</td>
                    <td>${user.dob}</td>
                    <td>${user.phoneNumber}</td>  <!-- Display phone number -->
                    <td>${user.parentEmail}</td>  <!-- Display parent email -->
                    <td>
                        <div class="action-buttons">
                            <button onclick="openEditModal('${user.username}')">Edit</button>
                            <button class="delete" onclick="deleteUser('${user.username}')">Delete</button>
                        </div>
                    </td>
                `;
                tableBody.appendChild(row);
            });
        });

    // Open edit modal and populate the form fields with user data
    function openEditModal(username) {
        const user = users.find(u => u.username === username);

        // Populate form fields with existing user data
        document.getElementById('id').value = user.id;
        document.getElementById('username').value = user.username;
        document.getElementById('firstname').value = user.firstname;
        document.getElementById('lastname').value = user.name;
        document.getElementById('year').value = user.year;
        document.getElementById('dob').value = user.dob;
        document.getElementById('phonenumber').value = user.phoneNumber;  // Set phone number
        document.getElementById('parentemail').value = user.parentEmail;  // Set parent email
        // Show the modal
        document.getElementById('editUserModal').style.display = 'block';
    }

    // Close the modal
    function closeModal() {
        document.getElementById('editUserModal').style.display = 'none';
    }

    // Save user changes
    document.getElementById('editUserForm').addEventListener('submit', function(event) {
        event.preventDefault();

        const form = document.getElementById('editUserForm');
        const userData = {
        	id: form.id.value,
            username: form.username.value,  // Username field
            firstname: form.firstname.value,
            name: form.lastname.value,      // 'name' field is used for last name
            year: form.year.value,
            dob: form.dob.value,
            phoneNumber: form.phonenumber.value,  // Add phone number
            parentEmail: form.parentemail.value 
        };
        // Send the updated user data to the backend
        fetch('http://localhost:1349/user/update', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(userData)
        })
        .then(response => {
            if (response.ok) {
                alert('User updated successfully!');
                location.reload(); // Reload the page to reflect the changes
            } else {
                alert('Failed to update user');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Error updating user');
        });
    });

    // Delete user
    function deleteUser(username) {
        if (confirm('Are you sure you want to delete this user?')) {
            fetch(`http://localhost:1349/user/delete`, {
                method: 'POST', 
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ username: username }) // Send username for deletion
            })
            .then(response => {
                if (response.ok) {
                    alert('User deleted successfully!');
                    location.reload(); // Reload the page to reflect the changes
                } else {
                    alert('Failed to delete user');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Error deleting user');
            });
        }
    }</script>

</body>
</html>
