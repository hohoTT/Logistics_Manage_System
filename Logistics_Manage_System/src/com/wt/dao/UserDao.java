package com.wt.dao;

import java.util.List;

import com.wt.entity.User;

public class UserDao extends BaseDao{

	public List<User> getAll(){
	
		String hql = "FROM User";
		
		return getSession().createQuery(hql).list();
		
	}
	
}
