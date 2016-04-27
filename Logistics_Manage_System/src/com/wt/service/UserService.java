package com.wt.service;

import java.util.List;

import com.wt.dao.UserDao;
import com.wt.entity.User;

public class UserService {

	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public List<User> getAll(){
		
		List<User> users = userDao.getAll();
		
		return users;
		
	}
	
}
