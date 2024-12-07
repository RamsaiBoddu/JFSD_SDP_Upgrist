package com.example.model;

import jakarta.persistence.Entity;
import java.time.LocalDate;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "users") // Ensure this matches the actual database table name
public class User {

    @Id
    private String username;  // Assuming username is the primary key; adjust as needed
    private String password;
    private String name;
    private int year;
    private String firstname;
    private LocalDate dob;
    private String parent_email;
    private long phonenumber;
    private int id;
    private String role;
    public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public long getPhoneNumber() {
		return phonenumber;
	}

	public void setPhoneNumber(long phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getParentEmail() {
		return parent_email;
	}

	public void setParentEmail(String parent_email) {
		this.parent_email = parent_email;
	}

	// Getters and setters
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public String getFirstname() {
        return firstname;
    }

    public void setFirstName(String firstname) {
        this.firstname = firstname;
    }
    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }
    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }
}
