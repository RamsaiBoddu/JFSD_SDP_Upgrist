package com.example.repository;

import com.example.model.User;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
    // JpaRepository provides basic CRUD methods by default.
    // You can define custom queries here if needed.
	@Query("SELECT u FROM User u WHERE u.username = :username")
    User findByUsername(String username);
	
	
}
