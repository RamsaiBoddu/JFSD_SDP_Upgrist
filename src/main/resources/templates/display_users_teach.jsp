<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upgrist - User Dashboard</title>
    
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
            --border-color: #e5e7eb;
            --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
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
            border-bottom: 1px solid var(--border-color);
            box-shadow: var(--shadow-sm);
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

        /* Main Content */
        .dashboard-container {
            max-width: 1280px;
            margin: 6rem auto 2rem;
            padding: 0 2rem;
        }

        .dashboard-header {
            margin-bottom: 2rem;
        }

        .dashboard-title {
            font-size: 1.875rem;
            font-weight: 700;
            color: var(--text-primary);
        }

        /* Table Styles */
        .table-container {
            background-color: var(--bg-white);
            border-radius: 0.75rem;
            box-shadow: var(--shadow-md);
            overflow: hidden;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
        }

        .data-table th {
            background-color: var(--primary-color);
            color: white;
            font-weight: 600;
            text-align: left;
            padding: 1rem;
            font-size: 0.875rem;
        }

        .data-table td {
            padding: 1rem;
            border-bottom: 1px solid var(--border-color);
            font-size: 0.875rem;
            color: var(--text-secondary);
        }

        .data-table tr:hover {
            background-color: var(--bg-gray);
        }

        /* Action Buttons */
        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }

        .btn {
            padding: 0.5rem 1rem;
            border-radius: 0.375rem;
            font-weight: 500;
            font-size: 0.875rem;
            cursor: pointer;
            transition: all 0.2s ease;
            border: none;
        }

        .btn-edit {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-edit:hover {
            background-color: var(--primary-hover);
        }

        .btn-delete {
            background-color: #ef4444;
            color: white;
        }

        .btn-delete:hover {
            background-color: #dc2626;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            inset: 0;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            padding: 1rem;
        }
        
        .modal {
    display: none;
    position: fixed;
    inset: 0; /* Covers the entire viewport */
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 1000;
    padding: 1rem;
    overflow-y: auto; /* Enables vertical scrolling */
}

.modal-content {
    background-color: var(--bg-white);
    border-radius: 0.75rem;
    max-width: 500px;
    margin: auto;
    padding: 2rem;
    box-shadow: var(--shadow-md);
    max-height: 90vh; /* Restricts modal height to viewport */
    overflow-y: auto; /* Enables scrolling within the modal */
}

        .modal-content {
            background-color: var(--bg-white);
            border-radius: 0.75rem;
            max-width: 500px;
            margin: 2rem auto;
            padding: 2rem;
            box-shadow: var(--shadow-md);
        }

        .modal-header {
            margin-bottom: 1.5rem;
        }

        .modal-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--text-primary);
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
            padding: 0.75rem;
            border: 1px solid var(--border-color);
            border-radius: 0.375rem;
            font-size: 0.875rem;
            transition: border-color 0.2s ease;
        }

        .form-input:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(249, 115, 22, 0.1);
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
            margin-top: 2rem;
        }

        /* Mobile Styles */
        @media (max-width: 768px) {
            .nav-menu {
                display: none;
            }

            .table-container {
                overflow-x: auto;
            }

            .data-table {
                min-width: 800px;
            }

            .dashboard-container {
                margin-top: 5rem;
                padding: 0 1rem;
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

    <!-- Main Content -->
    <main class="dashboard-container">
        <div class="dashboard-header">
        <h1 class="dashboard-title">Student Details</h1>
      <!--   <button class="btn btn-edit" onclick="openCreateModal()">Add New User</button>  --> 
    </div>

        <div class="table-container">
            <table class="data-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Year</th>
                        <th>Date of Birth</th>
                        <th>Phone Number</th>
                        <th>Parent Email</th>
                      <!--   <th>Actions</th>  --> 
                    </tr>
                </thead>
                <tbody id="userTableBody">
                    <!-- Data will be populated dynamically -->
                </tbody>
            </table>
        </div>
    </main>
    
    <div id="createModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2 class="modal-title">Add New User</h2>
        </div>
        <form id="createForm">
            <div class="form-group">
                <label class="form-label" for="newUsername">Username</label>
                <input type="text" id="newUsername" name="username" class="form-input" required>
            </div>
            <div>
            <label class="form-label" for="password">Password</label>
    <input type="password" id="password" name="password" class="form-input" required>
    </div>
            <div class="form-group">
                <label class="form-label" for="newFirstname">First Name</label>
                <input type="text" id="newFirstname" name="firstname" class="form-input" required>
            </div>
            <div class="form-group">
                <label class="form-label" for="newLastname">Last Name</label>
                <input type="text" id="newLastname" name="lastname" class="form-input" required>
            </div>
            <div class="form-group">
                <label class="form-label" for="newYear">Year</label>
                <input type="number" id="newYear" name="year" class="form-input" required>
            </div>
            <div class="form-group">
                <label class="form-label" for="newDob">Date of Birth</label>
                <input type="date" id="newDob" name="dob" class="form-input" required>
            </div>
            <div class="form-group">
                <label class="form-label" for="newPhoneNumber">Phone Number</label>
                <input type="tel" id="newPhoneNumber" name="phonenumber" class="form-input" required>
            </div>
            <div class="form-group">
                <label class="form-label" for="newParentEmail">Parent Email</label>
                <input type="email" id="newParentEmail" name="parentemail" class="form-input" required>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-delete" onclick="closeModal('createModal')">Cancel</button>
                <button type="submit" class="btn btn-edit">Create User</button>
            </div>
        </form>
    </div>
</div>

    <!-- Edit Modal -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title">Edit User</h2>
            </div>
            <form id="editForm">
                <div class="form-group">
                    <label class="form-label" for="id">ID</label>
                    <input type="text" id="id" name="id" class="form-input" readonly>
                </div>
                <div class="form-group">
                    <label class="form-label" for="username">Username</label>
                    <input type="text" id="username" name="username" class="form-input" required>
                </div>
                <div class="form-group">
                    <label class="form-label" for="firstname">First Name</label>
                    <input type="text" id="firstname" name="firstname" class="form-input" required>
                </div>
                <div class="form-group">
                    <label class="form-label" for="lastname">Last Name</label>
                    <input type="text" id="lastname" name="lastname" class="form-input" required>
                </div>
                <div class="form-group">
                    <label class="form-label" for="year">Year</label>
                    <input type="number" id="year" name="year" class="form-input" required>
                </div>
                <div class="form-group">
                    <label class="form-label" for="dob">Date of Birth</label>
                    <input type="date" id="dob" name="dob" class="form-input" required>
                </div>
                <div class="form-group">
                    <label class="form-label" for="phonenumber">Phone Number</label>
                    <input type="tel" id="phonenumber" name="phonenumber" class="form-input" required>
                </div>
                <div class="form-group">
                    <label class="form-label" for="parentemail">Parent Email</label>
                    <input type="email" id="parentemail" name="parentemail" class="form-input" required>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-delete" onclick="closeModal()">Cancel</button>
                    <button type="submit" class="btn btn-edit">Save Changes</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Fetch and display users
        fetch('http://localhost:1349/user/allusers')
            .then(response => response.json())
            .then(data => {
                const tableBody = document.getElementById('userTableBody');
                const studentUsers = data.filter(user => user.role === 'student');
                
                studentUsers.forEach(user => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.firstname}</td>
                        <td>${user.name}</td>
                        <td>${user.year}</td>
                        <td>${user.dob}</td>
                        <td>${user.phoneNumber}</td>
                        <td>${user.parentEmail}</td>
                   
                    `;
                    tableBody.appendChild(row);
                });
            })
            .catch(error => console.error('Error fetching users:', error));

        // Modal functions
        function openEditModal(username) {
            const modal = document.getElementById('editModal');
            const user = users.find(u => u.username === username);

            // Populate form fields
            document.getElementById('id').value = user.id;
            document.getElementById('username').value = user.username;
            document.getElementById('firstname').value = user.firstname;
            document.getElementById('lastname').value = user.name;
            document.getElementById('year').value = user.year;
            document.getElementById('dob').value = user.dob;
            document.getElementById('phonenumber').value = user.phoneNumber;
            document.getElementById('parentemail').value = user.parentEmail;

            modal.style.display = 'block';
        }

        function closeModal() {
            document.getElementById('editModal').style.display = 'none';
        }

        // Form submission
        document.getElementById('editForm').addEventListener('submit', function(event) {
            event.preventDefault();

            const formData = {
                id: this.id.value,
                username: this.username.value,
                firstname: this.firstname.value,
                name: this.lastname.value,
                year: this.year.value,
                dob: this.dob.value,
                phoneNumber: this.phonenumber.value,
                parentEmail: this.parentemail.value
            };

            fetch('http://localhost:1349/user/update', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(formData)
            })
            .then(response => {
                if (response.ok) {
                    alert('User updated successfully!');
                    location.reload();
                } else {
                    throw new Error('Failed to update user');
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
                fetch('http://localhost:1349/user/delete', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ username: username })
                })
                .then(response => {
                    if (response.ok) {
                        alert('User deleted successfully!');
                        location.reload();
                    } else {
                        throw new Error('Failed to delete user');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Error deleting user');
                });
            }
        }
        
     // Open the New User Modal
        function openCreateModal() {
            document.getElementById('createModal').style.display = 'block';
        }

        // Close the Modal
        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }

        // Handle New User Form Submission
        document.getElementById('createForm').addEventListener('submit', function(event) {
            event.preventDefault();

            const formData = {
            	    username: this.newUsername.value,
            	    password: this.password.value, // Fix this
            	    firstname: this.newFirstname.value,
            	    lastname: this.newLastname.value,
            	    year: this.newYear.value,
            	    dob: this.newDob.value,
            	    phoneNumber: this.newPhoneNumber.value,
            	    parentEmail: this.newParentEmail.value,
            	};


            fetch('http://localhost:1349/user/signup', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(formData)
            })
                .then(response => {
                    if (response.ok) {
                        alert('User created successfully!');
                        location.reload();
                    } else {
                        throw new Error('Failed to create user');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Error creating user');
                });
        });

    </script>
</body>
</html>