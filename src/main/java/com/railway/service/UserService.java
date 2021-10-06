package com.railway.service;

import java.util.List;
import com.railway.entities.User;

public interface UserService {
	User createUser(User user);

	void deleteUserById(String email);

	User getUserById(String email);

	List<User> listofUsers();

	void updateUser(User updateUser);
}
