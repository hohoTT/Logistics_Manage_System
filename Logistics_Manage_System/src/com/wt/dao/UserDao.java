package com.wt.dao;

import java.util.List;

import org.hibernate.Query;

import com.wt.entity.User;

public class UserDao extends BaseDao{

	public List<User> getAll(){
	
		String hql = "FROM User";
		
		return getSession().createQuery(hql).list();
		
	}
	
	public User userCheck(String username, String password) {
		
		User user = null;
		
		String hql = "FROM User u WHERE u.user_name = ? and u.user_password = ?";
		
		Query query = getSession().createQuery(hql);
		
		query.setString(0, username);
		query.setString(1, password);
		
		user = (User) query.uniqueResult();
		
		return user;
	}
	
}
