package com.example.demo.service;

import com.example.model.User;
import com.example.model.UserLogin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.repository.UserLoginRepository;
import com.example.repository.UserRepository; // Assuming you're using Spring Data JPA
import java.util.List;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


@Service
public class UserManager {

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private UserLoginRepository userLoginRepository;
    
    public User getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public void createUser(User user) {
        // Validate mandatory fields
        if (user.getUsername() == null || user.getPassword() == null || user.getRole() == null) {
            throw new IllegalArgumentException("Missing required fields (username, password, role)");
        }

        // Check for existing user
        Optional<User> existingUser = userRepository.findById(user.getUsername());
        if (existingUser.isPresent()) {
            throw new IllegalArgumentException("User already exists with this username.");
        }

        // Save user to the database
        userRepository.save(user);
        UserLogin userLogin = new UserLogin();
        userLogin.setUsername(user.getUsername());
        userLogin.setPassword(user.getPassword());
        userLogin.setRole(user.getRole());

        // Save user login to the UserLogin table
        userLoginRepository.save(userLogin);
    }
    
    // Fetch all users
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    // Update an existing user
    public boolean updateUser(User user) {
        Optional<User> existingUser = userRepository.findById(user.getUsername());
        if (existingUser.isPresent()) {
            User userToUpdate = existingUser.get();
            userToUpdate.setId(user.getId());
            userToUpdate.setFirstName(user.getFirstname());
            userToUpdate.setName(user.getName());
            userToUpdate.setYear(user.getYear());
            userToUpdate.setDob(user.getDob());
            userToUpdate.setPhoneNumber(user.getPhoneNumber()); // update phone number
            userToUpdate.setParentEmail(user.getParentEmail()); // update parent email
            userRepository.save(userToUpdate); // Save the updated user
            return true;
        }
        return false;
    }

    // Delete a user by their username
    public boolean deleteUser(String username) {
        if (userRepository.existsById(username)) {
            userRepository.deleteById(username);
            return true;
        }
        return false;
    }
    public void saveUser(User user) {
        userRepository.save(user);
    }
}
