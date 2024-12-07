package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages="com.example.controller")
@ComponentScan(basePackages = "com.example.demo")
@EntityScan("com.example.model")
@ComponentScan(basePackages = "com.example.model") 
@EnableJpaRepositories(basePackages = "com.example.repository")
public class SdpProject1Application {

	public static void main(String[] args) {
		SpringApplication.run(SdpProject1Application.class, args);
		System.out.println("Running");
	}
}
