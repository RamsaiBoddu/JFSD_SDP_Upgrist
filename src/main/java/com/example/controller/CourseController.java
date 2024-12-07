package com.example.controller;

import com.example.demo.service.CourseManager;
import com.example.model.Course;
import com.example.repository.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseRepository courseRepository;
    private CourseManager courseService;

    /**
     * Get all courses
     *
     * @return List of all courses
     */
    @GetMapping("/courses")
    public ResponseEntity<List<Course>> getAllCourses() {
        List<Course> courses = courseRepository.findAll();
        if (courses.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NO_CONTENT).body(courses);
        }
        return ResponseEntity.ok(courses);
    }

    /**
     * Add a new course
     *
     * @param course Course object to add
     * @return Success or error message
     */
    @PostMapping("/addCourse")
    public ResponseEntity<String> addCourse(@RequestBody Course course) {
        if (course.getName() == null || course.getName().isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Course name is required");
        }
        try {
            courseRepository.save(course);
            return ResponseEntity.status(HttpStatus.CREATED).body("Course added successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
        }
    }

    /**
     * Get course details by ID
     *
     * @param id Course ID
     * @return Course object or error message
     */
    @GetMapping("/{id}")
    public ResponseEntity<Course> getCourseById(@PathVariable int id) {
        Optional<Course> courseOptional = Optional.ofNullable(courseRepository.findById(id));
        if (courseOptional.isPresent()) {
            return ResponseEntity.ok(courseOptional.get());
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
    }

    /**
     * Update course details
     *
     * @param id     Course ID to update
     * @param course Course object with updated details
     * @return Success or error message
     */
    @PutMapping("/{id}")
    public ResponseEntity<String> updateCourse(@PathVariable int id, @RequestBody Course course) {
        if (!courseRepository.existsById(id)) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Course not found");
        }
        try {
            // Retrieve the existing course and update fields
            Optional<Course> existingCourseOptional = Optional.ofNullable(courseRepository.findById(id));
            if (existingCourseOptional.isPresent()) {
                Course existingCourse = existingCourseOptional.get();
                existingCourse.setName(course.getName());
                existingCourse.setDescription(course.getDescription());
                existingCourse.setTeacherId(course.getTeacherId());
                courseRepository.save(existingCourse);
                return ResponseEntity.ok("Course updated successfully");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to update course");
    }

    /**
     * Delete a course by ID
     *
     * @param id Course ID
     * @return Success or error message
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteCourse(@PathVariable int id) {
        if (!courseRepository.existsById(id)) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Course not found");
        }
        try {
            courseRepository.deleteById(id);
            return ResponseEntity.ok("Course deleted successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
        }
    }
    
    @GetMapping("/editCourse")
    public ResponseEntity<Course> editCourse(@RequestParam("id") int id) {
        Course course = courseRepository.findById(id);
        if (course == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(course);
    }

}
