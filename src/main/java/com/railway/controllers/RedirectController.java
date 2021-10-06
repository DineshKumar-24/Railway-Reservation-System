package com.railway.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.railway.entities.User;
import com.railway.service.UserService;

@Controller
public class RedirectController {
	private static final Logger logger = LogManager.getLogger(RedirectController.class);
	@Autowired
	UserService userService;
	private static final String CURRENT_USER = "currentUser";  
	@RequestMapping("/")
	public ModelAndView defaultHome(@ModelAttribute("loginSuccess") String successMsg) {
		return new ModelAndView("index", "success", successMsg);
	}
	
	@RequestMapping("/logoutSuccess")
	public ModelAndView logout(RedirectAttributes redirectAttributes,Authentication authentication) {
		logger.info("Logged out success with id {}",authentication.getName());
		redirectAttributes.addFlashAttribute("successfulmsg", "Logout successful");
		return new ModelAndView("redirect:/");
	}
	@GetMapping("/home")
	public ModelAndView home() {
		return new ModelAndView("home");
	}

	@GetMapping("/login")
	public ModelAndView login() {
		return new ModelAndView("index");
	}

	@RequestMapping("/loggedIn")
	public ModelAndView defaultSuccess(HttpServletRequest request, Authentication authentication,
			RedirectAttributes redirectAttributes) {
		logger.info("Authentication Success,Logged in successful");
		User currentUser = userService.getUserById(authentication.getName());
		request.getSession().setAttribute(CURRENT_USER, currentUser);
		redirectAttributes.addFlashAttribute("successfulmsg", "Login Successful");
		if (currentUser.getRole().equals("ADMIN")) {
			logger.info("Logged in as ROLE_ADMIN with the id {}", authentication.getName());
			return new ModelAndView("redirect:/trainform");
		} else if (currentUser.getRole().equals("USER")) {
			logger.info("Logged in as ROLE_USER with the id {}", authentication.getName());
			return new ModelAndView("redirect:/home");
		} else {
			logger.info("No role assigned with the id {}", authentication.getName());
			return new ModelAndView("/");
		}
	}

	@GetMapping("/visitprofile")
	public ModelAndView profile(HttpSession session) {

		User user = (User) session.getAttribute(CURRENT_USER);
		if (user.getRole().equals("ADMIN")) {
			logger.info("visitng profile for Admin");
			return new ModelAndView("admin/adminprofile", CURRENT_USER, user);
		} else {
			logger.info("visitng profile for User");
			return new ModelAndView("profile", CURRENT_USER, user);
		}
	}

	@GetMapping("/trainform")
	public String trainform() {
		return "admin/trainform";
	}
}
