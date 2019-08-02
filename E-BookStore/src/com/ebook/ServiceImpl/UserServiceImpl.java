package com.ebook.ServiceImpl;

import com.ebook.dao.UserDao;
import com.ebook.model.User;
import com.ebook.service.UserService;

public class UserServiceImpl implements UserService{

	@Override
	public boolean isUserExist(String username) {
		return UserDao.isUserExist(username);
	}

	@Override
	public int saveUser(User user, String role) {
		if (user == null) {
			throw new IllegalArgumentException("User object is null!!!");
		}
		return UserDao.saveUser(user, role);
	}

}
