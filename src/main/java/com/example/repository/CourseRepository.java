package com.example.repository;

import com.example.model.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CourseRepository extends JpaRepository<Course, Integer> {
	@Query("SELECT c FROM Course c WHERE c.id = :id")
	Course findById(@Param("id") int id);

}

