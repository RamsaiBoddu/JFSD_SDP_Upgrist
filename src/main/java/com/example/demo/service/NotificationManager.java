package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class NotificationManager {

	private final JavaMailSender mailSender;

    @Autowired
    public NotificationManager(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }
    public String sendEmail(String senderEmail, String toEmail, String subject, String msg) {
        try {
            SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setFrom(senderEmail);
            mailMessage.setTo(toEmail);
            mailMessage.setSubject(subject);
            mailMessage.setText(msg);

            mailSender.send(mailMessage);
            return "Email sent successfully";
        } catch (Exception e) {
            return "Error while sending email: " + e.getMessage();
        }
    }
}