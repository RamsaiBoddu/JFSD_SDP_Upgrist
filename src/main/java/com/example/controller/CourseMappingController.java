package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.example.demo.service.CourseMappingManager;
import com.example.demo.service.UserManager;
import com.example.model.CourseMapping;
import com.example.model.User;
import com.example.repository.CourseMappingRepository;

@RestController
@RequestMapping("/course")
public class CourseMappingController {

    private static final Logger logger = LoggerFactory.getLogger(CourseMappingController.class);
    @Autowired
    private UserManager userManager;
    @Autowired
    private CourseMappingRepository userRepositorymap;
    @Autowired
    private CourseMappingManager courseMappingService;
    @PostMapping("/upload")
    public ResponseEntity<String> uploadCourseMappingFile(@RequestParam("file") MultipartFile file) {
        try {
            if (file.isEmpty()) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("No file uploaded");
            }
            logger.info("Starting the file upload process...");
            courseMappingService.processExcelFile(file);
            logger.info("File upload and processing completed successfully.");
            return ResponseEntity.ok("Course mapping data uploaded successfully!");
        } catch (Exception e) {
            logger.error("Error uploading file: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error uploading file: " + e.getMessage());
        }
    }
    @GetMapping("/course-mapping")
    public List<CourseMapping> getCourseMappingsByStudentId(int studentId) {
        // Log the studentId to confirm it's being passed correctly
        System.out.println("Fetching course mappings for studentId: " + studentId);

        // Fetch the course mappings from the repository
        List<CourseMapping> courseMappings = userRepositorymap.findByStudentId(studentId);

        // Log the fetched course mappings
        if (courseMappings != null && !courseMappings.isEmpty()) {
            System.out.println("Found course mappings:");
            for (CourseMapping courseMapping : courseMappings) {
                System.out.println("Course ID: " + courseMapping.getCourseId());
                System.out.println("Course Name: " + courseMapping.getCourseName());
                System.out.println("Marks: " + courseMapping.getMarks());
                System.out.println("Attendance: " + courseMapping.getAttendance());
                System.out.println("-----");
            }
        } else {
            System.out.println("No course mappings found for studentId: " + studentId);
        }

        return courseMappings;
    }




    @GetMapping("/marks")
    public ResponseEntity<List<CourseMapping>> getAllCourseMappings() {
        try {
            List<CourseMapping> mappings = courseMappingService.getAllCourseMappings();
            return ResponseEntity.ok(mappings);
        } catch (Exception e) {
            logger.error("Error fetching course mappings: {}", e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
}
