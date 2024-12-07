package com.example.controller;

import com.example.model.CourseMapping;
import com.example.model.User;
import com.example.repository.CourseMappingRepository;
import com.example.repository.UserRepository;
import com.example.demo.service.UserManager;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/getusers")
public class UserController {
	
    @Autowired
    private UserManager userService;
    
    @Autowired
    private UserRepository userRepository;
    
    
    @GetMapping("/allusers")
    public List<User> getAllUsers() {
        return userService.getAllUsers(); // Fetch users from the database
    }
    @GetMapping("student/{username}")
    public ResponseEntity<Map<String, Object>> getStudentIdByUsername(@PathVariable String username) {
        // Assuming your User entity has a 'username' field and 'id' field
        Optional<User> userOptional = Optional.ofNullable(userRepository.findByUsername(username));
        
        if (userOptional.isPresent()) {
            User student = userOptional.get();
            Map<String, Object> response = new HashMap<>();
            response.put("studentId", student.getId()); // Returning the student ID
            return ResponseEntity.ok(response); // Return the studentId in the response
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                                 .body(Collections.singletonMap("error", "Student not found"));
        }
    }
   

    @GetMapping("/info")
    public ResponseEntity<User> getUserInfo(@RequestParam String username) {
        User user = userService.getUserByUsername(username);
        if (user != null) {
            return ResponseEntity.ok(user);
        } else {
            return ResponseEntity.status(404).body(null);
        }
    }    @PostMapping("/uploadExcel")
    public ResponseEntity<String> uploadExcelFile(@RequestParam("file") MultipartFile file) throws IOException {
        // Process the Excel file
        if (file.isEmpty()) {
            return ResponseEntity.badRequest().body("No file uploaded");
        }

        try (XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream())) {
            Sheet sheet = workbook.getSheetAt(0); // Get the first sheet
            Iterator<Row> rowIterator = sheet.iterator();

            while (rowIterator.hasNext()) {
                Row row = rowIterator.next();
                if (row.getRowNum() == 0) continue; // Skip header row

                // Parse the Excel row
                String username = row.getCell(0).getStringCellValue();
                String password = row.getCell(1).getStringCellValue();
                String name = row.getCell(2).getStringCellValue();
                int year = (int) row.getCell(3).getNumericCellValue();
                String firstname = row.getCell(4).getStringCellValue();
                String dobString = row.getCell(5).getStringCellValue(); // Assuming it's a string in the Excel file
                
                // You may need to parse the dob if it's a string
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // Adjust if needed
                LocalDate dob = LocalDate.parse(dobString, formatter);
                String parentEmail = row.getCell(6).getStringCellValue();
                long phoneNumber = (long) row.getCell(7).getNumericCellValue();
                int id = (int) row.getCell(8).getNumericCellValue();
                String role = row.getCell(9).getStringCellValue();

                // Create User object and save it
                User user = new User();
                user.setUsername(username);
                user.setPassword(password);
                user.setName(name);
                user.setYear(year);
                user.setFirstName(firstname);
                user.setDob(dob);
                user.setParentEmail(parentEmail);
                user.setPhoneNumber(phoneNumber);
                user.setId(id);
                user.setRole(role);
                userService.saveUser(user);
            }
        } catch (IOException e) {
            return ResponseEntity.status(500).body("Failed to process file");
        }

        return ResponseEntity.ok("File uploaded and users created successfully");
    }

}
