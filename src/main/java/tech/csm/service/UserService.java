package tech.csm.service;

import java.util.List;

import tech.csm.model.User;

public interface UserService {

	User getUserByUserId(Integer userId);

	User saveUser(User user);

	List<User> getAllUser();

	User grantUser(User user);

}
