package com.ebook.service;

import com.ebook.model.User;

public interface UserService {
	
	/**
	 * 
	 * @param username
	 * @return
	 */
	public boolean isUserExist(String username);
	
	/**
	 * 
	 * @param user
	 * @return
	 */
	public int saveUser(User user, String role);

}
