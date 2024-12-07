package com.example.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "course")
public class Course {
	@Id
	private int id;
	private String name;
	private String description;
	private int teacher_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getTeacherId() {
		return teacher_id;
	}
	public void setTeacherId(int teacher_id) {
		this.teacher_id = teacher_id;
	}
	public Course orElse(Object object) {
		// TODO Auto-generated method stub
		return null;
	}
}
