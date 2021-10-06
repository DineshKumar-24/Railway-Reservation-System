package com.railway.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.railway.dto.UserDTO;
import com.railway.entities.User;
import com.railway.exceptions.CommonUserException;

import com.railway.service.UserService;

@Controller
public class UserController {
	private static final Logger logger = LogManager.getLogger(UserController.class);
	@Autowired
	UserService userService;

	@PostMapping("/signup")
	public String signup(@ModelAttribute UserDTO user, RedirectAttributes redirectAttributes) throws CommonUserException {
		logger.info("Creating new user....");
		userService.createUser(user.converToEntity());
		redirectAttributes.addFlashAttribute("loginSuccess", "Registered Successful,Login to continue");
		logger.info("User Created Successful For {},Redirecting to login page...",user.getEmail());
		return "redirect:/";
	}

	@GetMapping("/viewusers")
	public ModelAndView listOfUsers() {
		logger.info("Getting list of users...");
		List<User> listOfUsers = userService.listofUsers();
		return new ModelAndView("/admin/viewusers", "listOfUsers", listOfUsers);
	}

	@GetMapping("/deleteuser/{email}")
	public String deleteUser(@PathVariable String email,RedirectAttributes redirectAttributes) {
		logger.info("Trying to delete a user");
		userService.deleteUserById(email);
		logger.info("User with {} has deleted successful",email);
		redirectAttributes.addFlashAttribute("successfulmsg", "User deleted successful");
		return "redirect:/viewusers";

	}

	@PostMapping("/updateuser")
	public String updateUser(@ModelAttribute UserDTO updateUser, HttpSession session,RedirectAttributes redirectAttributes) throws CommonUserException {
		logger.info("Updating User....");
		userService.updateUser(updateUser.converToEntity());
		logger.info("User with {} has updated successfully",updateUser.getEmail());
		redirectAttributes.addFlashAttribute("successfulmsg", "Profile updated successful");
		session.setAttribute("currentUser", userService.getUserById(updateUser.getEmail()));
		return "redirect:/visitprofile";

	}
}
