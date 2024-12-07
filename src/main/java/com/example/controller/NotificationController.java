package com.example.controller;

import com.example.demo.service.NotificationManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Map;
@RestController
@RequestMapping("/email")
public class NotificationController {
    @Autowired
    NotificationManager notificationManager;
    @PostMapping("/contact")
    public String sendContactEmail(@RequestParam String name,
                                                @RequestParam String email,
                                                @RequestParam String message) {
        String subject = "Thank you for contacting Upgrist Support!";
        String emailContent = String.format(
                "Dear %s,\n\nThank you for reaching out to our support team. Here is a copy of your message:\n\n%s\n\n" +
                "Our team is actively working to address your concerns. We will get back to you shortly.\n\n" +
                "Best regards,\nThe Upgrist Support Team",
                name, message);
        String from = "support@upgrist.com";  // Replace with your sender email
        try {
            notificationManager.sendEmail(from, email, subject, emailContent);
            return "Email sent successfully.";
        } catch (Exception e) {
            return "Failed to send email. Please try again later.";
        }
    }
}