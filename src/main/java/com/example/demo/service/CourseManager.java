package com.example.demo.service;

import com.example.model.Course;
import com.example.repository.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseManager {

    @Autowired
    private CourseRepository courseRepository;

    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

    public Course getCourseById(int id) {
        return courseRepository.findById(id);
    }

    public Course addOrUpdateCourse(Course course) {
        return courseRepository.save(course);
    }

    public void deleteCourse(int id) {
        courseRepository.deleteById(id);
    }
}
