package com.railway.service.Impl;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.annotation.Rollback;

import com.railway.entities.User;
import com.railway.repositories.UserRepository;

@DataJpaTest
@TestMethodOrder(OrderAnnotation.class)
@AutoConfigureTestDatabase(replace = Replace.NONE)
class UserRepositoryTest {

	@Autowired
	UserRepository userRepository;

	@Test
	@Order(1)
	public void saveUserTest() {
		User user = new User();
		user.setEmail("test@gmail.com");
		user.setFirstName("TestUser");
		user.setLastName("Test");
		user.setPassword("test@123");
		user.setMobileNumber("1234567899");
		assertNotNull(userRepository.save(user));
		;
	}
	
	@Test
	@Order(2)
	public void updateUserTest() {
		Optional<User> optionalUser=userRepository.findById("test@gmail.com");
		User olduser=optionalUser.get();
		olduser.setFirstName("TestUserChanged");
		User updatedUser=userRepository.save(olduser);
		assertThat(olduser.getFirstName()).isEqualTo(updatedUser.getFirstName());
	}
	@Test
	
	@Order(3)
	public void getUserList(){
		List<User> listOfUsers=userRepository.findAll();
		assertThat(listOfUsers).size().isPositive();
	}
	@Test
	@Order(4)
	public void findById(){
		String testId="test@gmail.com";
		assertNotNull(userRepository.findById(testId));
	}

	@Test
	@Order(5)
	public void deleteUserTest(){
		String testId="test@gmail.com";
		userRepository.deleteById(testId);
		boolean isUserExists=userRepository.findById(testId).isPresent();
		Assertions.assertFalse(isUserExists);
	}

}
