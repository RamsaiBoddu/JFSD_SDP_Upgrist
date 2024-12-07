package com.example.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.example.model.CourseMapping;
@Repository
public interface CourseMappingRepository extends JpaRepository<CourseMapping, Integer> {

	@Query("SELECT u FROM CourseMapping u WHERE u.studentId = :studentId")
	List<CourseMapping> findByStudentId(int studentId);
}

