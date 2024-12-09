package com.example.demo;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class ClientController {
	
	
	
	@GetMapping("/")
    public ModelAndView home() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("home");
        return mav;
    }
	@GetMapping("/about")
    public ModelAndView about() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("about");
        return mav;
    }
	@GetMapping("/signup")
	public ModelAndView signup() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("signup");
        return mav;
    }
	@GetMapping("/login")
	public ModelAndView login() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("login");
        return mav;
    }
	@GetMapping("/contact-support")
	public ModelAndView contactsupport() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("contact-support");
        return mav;
    }
	@GetMapping("/contactaf")
	public ModelAndView contactaf() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("contact_af");
        return mav;
    }
	@GetMapping("/aboutaf")
	public ModelAndView aboutaf() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("aboutaf");
        return mav;
    }
	@GetMapping("/adminhome_af_login")
    public ModelAndView adminhome_af_login() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/adminhome_af_login");
        return mav;
    }
	@GetMapping("/studenthome_af_login")
    public ModelAndView studenthome_af_login() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/studenthome_af_login");
        return mav;
    }
	@GetMapping("/teacherhome_af_login")
    public ModelAndView teacherhome_af_login() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/teacherhome_af_login");
        return mav;
    }
	@GetMapping("/display_users")
    public ModelAndView display_users() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("display_users");
        return mav;
    }
	@GetMapping("/display_faculty")
    public ModelAndView display_faculty() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("display_faculty");
        return mav;
    }
	@GetMapping("/display_course")
    public ModelAndView display_course() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("display_course");
        return mav;
    }
	@GetMapping("/course_mapping_csv")
    public ModelAndView course_mapping_csv() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("course_mapping_csv");
        return mav;
    }
	@GetMapping("/view_marks_teacher")
    public ModelAndView view_marks_teacher() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("view_marks_teacher");
        return mav;
    }
	@GetMapping("/admin_course_mapping")
    public ModelAndView admin_course_mapping() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin_course_mapping");
        return mav;
    }
	@GetMapping("/admin_view_attendance")
    public ModelAndView admin_view_attendance() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin_view_attendance");
        return mav;
    }
	@GetMapping("/display_users_teach")
    public ModelAndView display_users_teach() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("display_users_teach");
        return mav;
    }
	@GetMapping("/student_profile")
	public ModelAndView studentProfile(@RequestParam(name = "username", required = false) String username) {
	    ModelAndView mav = new ModelAndView();
	    if (username != null && !username.isEmpty()) {
	        // Add the username as a model attribute to pass to the view
	        mav.addObject("username", username);
	        mav.setViewName("student_profile");
	    } else {
	        // If username is missing, redirect to an error page or login page
	        mav.setViewName("error_page");
	        mav.addObject("errorMessage", "Username is missing. Please log in again.");
	    }
	    return mav;
	}
	@GetMapping("/student_display_marks")
	public ModelAndView student_display_marks(@RequestParam(name = "studentId", required = false) Integer studentId) {
	    ModelAndView mav = new ModelAndView();

	    if (studentId != null && studentId > 0) {
	        // Add the studentId as a model attribute to pass to the view
	        mav.addObject("studentId", studentId);
	        mav.setViewName("student_display_marks");
	    } else {
	        // If studentId is missing or invalid, set a generic error message
	        mav.addObject("errorMessage", "Student ID is missing or invalid. Please log in again.");
	        
	        // Return a default error page (make sure this view exists or adjust as necessary)
	        mav.setViewName("error");  // Ensure you have an error.html or error.jsp in your templates
	    }

	    return mav;
	}
	@GetMapping("/student_display_attendance")
	public ModelAndView student_display_attendance(@RequestParam(name = "studentId", required = false) Integer studentId) {
	    ModelAndView mav = new ModelAndView();

	    if (studentId != null && studentId > 0) {
	        // Add the studentId as a model attribute to pass to the view
	        mav.addObject("studentId", studentId);
	        mav.setViewName("student_display_attendance");
	    } else {
	        // If studentId is missing or invalid, set a generic error message
	        mav.addObject("errorMessage", "Student ID is missing or invalid. Please log in again.");
	        
	        // Return a default error page (make sure this view exists or adjust as necessary)
	        mav.setViewName("error");  // Ensure you have an error.html or error.jsp in your templates
	    }

	    return mav;
	}
}
