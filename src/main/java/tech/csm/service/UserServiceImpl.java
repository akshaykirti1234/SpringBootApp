package tech.csm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.csm.model.User;
import tech.csm.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Override
	public User getUserByUserId(Integer userId) {
		return userRepository.findUserById(userId);
	}

	@Override
	public User saveUser(User user) {
		return userRepository.save(user);
	}

	@Override
	public List<User> getAllUser() {
		return userRepository.findAll();
	}

	@Override
	public User grantUser(User user) {
		return userRepository.save(user);
	}

}
