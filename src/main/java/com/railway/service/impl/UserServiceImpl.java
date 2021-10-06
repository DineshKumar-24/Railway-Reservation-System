package com.railway.service.impl;

import java.util.List;
import java.util.Optional;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railway.entities.User;
import com.railway.exceptions.CommonUserException;
import com.railway.repositories.UserRepository;
import com.railway.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	private static final Logger logger = LogManager.getLogger(UserServiceImpl.class);
	@Autowired
	UserRepository userRepository;

	@Override
	public User createUser(User user) throws CommonUserException {

		Optional<User> checkingUser = userRepository.findById(user.getEmail());

		if (checkingUser.isPresent()) {
			logger.warn("Error Creating User");
			throw new CommonUserException("E100", "Email Already Exists,Try with another.");
		}

		return userRepository.save(user);
	}

	@Override
	public void deleteUserById(String email) {
		userRepository.deleteById(email);
	}

	@Override
	public User getUserById(String email) {
		Optional<User> user = userRepository.findById(email);
		if (user.isPresent()) {
			return user.get();
		}
		return null; 
	}

	@Override
	public List<User> listofUsers() {
		return userRepository.findAll();
	}

	@Override
	public void updateUser(User updateUser) {
		Optional<User> optionalUser = userRepository.findById(updateUser.getEmail());
		if (optionalUser.isPresent()) {
			User oldUser = optionalUser.get();
			oldUser.setEmail(updateUser.getEmail());
			oldUser.setFirstName(updateUser.getFirstName());
			oldUser.setLastName(updateUser.getLastName());
			oldUser.setMobileNumber(updateUser.getMobileNumber());
			userRepository.save(oldUser);
		} else {
			logger.warn("Update Failed");
			throw new CommonUserException("E101", "User Not Found");
		}
	}

}
