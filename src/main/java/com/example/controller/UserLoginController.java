package com.example.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;

import com.example.demo.service.UserLoginManager;
import com.example.demo.service.UserManager;
import com.example.model.Course;
import com.example.model.User;
import com.example.model.UserLogin;
import com.example.repository.CourseRepository;

@RestController
@RequestMapping("/user")
public class UserLoginController {
	
    private final UserLoginManager UM;
    private final UserManager usermanager;

    public UserLoginController(UserManager usermanager, UserLoginManager UM) {
        this.usermanager = usermanager;
        this.UM = UM;
    }

    @PostMapping("/validate")
    public ResponseEntity<String> validate(@RequestBody UserLogin u) {
        String result = UM.userValidate(u);

        // Check the response from userValidate method
        if ("Authorized User - Student".equalsIgnoreCase(result)) {
            return ResponseEntity.ok("Authorized User - Student");
        } else if ("Authorized User - Faculty".equalsIgnoreCase(result)) {
            return ResponseEntity.ok("Authorized User - Faculty");
        } else if ("Authorized User - Admin".equalsIgnoreCase(result)) {
            return ResponseEntity.ok("Authorized User - Admin");
        } else if ("Invalid Role".equalsIgnoreCase(result)) {
            return ResponseEntity.status(400).body("Invalid Role");
        } else {
            return ResponseEntity.status(401).body("Unauthorized User");
        }
    }
    
    @PostMapping("/signup")
    public ResponseEntity<String> signup(@RequestBody User user) {
        try {
        	usermanager.createUser(user);
            return ResponseEntity.status(HttpStatus.CREATED).body("User registered successfully!");
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred during signup.");
        }
    }
    
    @Autowired
    private UserManager userManager;

    @GetMapping("/allusers")
    public List<User> getAllUsers() {
        return userManager.getAllUsers(); // Fetch users from the database
    }
    
    @PostMapping("/update")
    public ResponseEntity<String> updateUser(@RequestBody User user) {
        boolean updated = userManager.updateUser(user); // Assume updateUser is a method in your UserManager
        if (updated) {
            return ResponseEntity.ok("User updated successfully");
        } else {
            return ResponseEntity.status(400).body("Failed to update user");
        }
    }
    
    @PostMapping("/delete")
    public ResponseEntity<String> deleteUser(@RequestBody User user) {
        boolean deleted = userManager.deleteUser(user.getUsername());
        if (deleted) {
            return ResponseEntity.ok("User deleted successfully");
        } else {
            return ResponseEntity.status(400).body("Failed to delete user");
        }
    }
    
    @Autowired
    private CourseRepository courseRepository;

    @GetMapping("/courses")
    public String getAllCourses(Model model) {
        List<Course> courses = courseRepository.findAll();
        model.addAttribute("courseList", courses);
        return "courses";
    }

    @PostMapping("/addCourse")
    public String addCourse(@ModelAttribute Course course) {
        courseRepository.save(course);
        return "redirect:/courses";
    }

    @GetMapping("/editCourse")
    public String editCourse(@RequestParam int id, Model model) {
        Course course = courseRepository.findById(id).orElse(null);
        model.addAttribute("course", course);
        return "editCourse";
    }

    @PostMapping("/updateCourse")
    public String updateCourse(@ModelAttribute Course course) {
        courseRepository.save(course);
        return "redirect:/courses";
    }

    @GetMapping("/deleteCourse")
    public String deleteCourse(@RequestParam int id) {
        courseRepository.deleteById(id);
        return "redirect:/courses";
    }

}
