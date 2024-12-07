package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.model.UserLogin;

@Repository
public interface UserLoginRepository extends JpaRepository<UserLogin, String> {

    // Query to validate the username and password
    @Query("select count(u) from UserLogin u where u.username = :uname and u.password = :pwd")
    public String validate(@Param("uname") String uname, @Param("pwd") String pwd);

    // Query to fetch the role of a user
    @Query("select u.role from UserLogin u where u.username = :uname")
    public String getRoleByUsername(@Param("uname") String uname);
}
