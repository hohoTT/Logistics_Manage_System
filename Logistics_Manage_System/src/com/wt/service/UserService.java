package com.wt.service;

import java.util.List;

import com.wt.dao.UserDao;
import com.wt.entity.User;

public class UserService {

	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	// 返回用户列表
	public List<User> getAll(){
		
		List<User> users = userDao.getAll();
		
		return users;
		
	}
	
	// 用户登录的验证
	public User userCheck(String username, String password) {
		return userDao.userCheck(username, password);
	}
	
	// 用户注册，向数据库中插入一条用户数据
	public void saveOrUpdate(User user) {
		userDao.saveOrUpdate(user);
	}
	
	// 邮箱是否被注册的检验
	public User emailCheck(String email){
		return userDao.emailCheck(email);
	}

	// 用户名是否被注册的检验
	public User usernameCheck(String username){
		return userDao.usernameCheck(username);
	}
	
	// 删除用户
	public void delete(Integer id){
		userDao.delete(id);
	}
	
}
