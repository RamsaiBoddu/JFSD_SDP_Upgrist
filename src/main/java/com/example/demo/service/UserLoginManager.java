package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.model.UserLogin;
import com.example.repository.UserLoginRepository;

@Service
public class UserLoginManager {

    @Autowired
    private UserLoginRepository ur;

    public String userValidate(UserLogin u) {
        if (ur.validate(u.getUsername(), u.getPassword()).equals("1")) {
            // Fetch the role of the user from the database
            String role = ur.getRoleByUsername(u.getUsername());
            
            if ("student".equalsIgnoreCase(role)) {
                return "Authorized User - Student";  // Return response for student
            } else if ("faculty".equalsIgnoreCase(role)) {
                return "Authorized User - Faculty";  // Return response for faculty
            } else if("admin".equalsIgnoreCase(role)) {
                return "Authorized User - Admin";  // Return error if role is not valid
            }else {
                return "Invalid Role";  // Return error if role is not valid
            }
        } else {
            return "Unauthorized User";  // Return error if credentials are invalid
        }
    }
    
    public void createUserLogin(UserLogin userLogin) {
        // Validate mandatory fields
        if (userLogin.getUsername() == null || userLogin.getPassword() == null || userLogin.getRole() == null) {
            throw new IllegalArgumentException("Missing required fields (username, password, role)");
        }

        // Save the new user login
        ur.save(userLogin);
    }
}
