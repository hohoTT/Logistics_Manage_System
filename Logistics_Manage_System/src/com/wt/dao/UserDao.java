package com.wt.dao;

import java.util.List;

import org.hibernate.Query;

import com.wt.entity.User;

public class UserDao extends BaseDao{

	// 查询所有的用户
	public List<User> getAll(){
	
		String hql = "FROM User";
		
		return getSession().createQuery(hql).list();
		
	}
	
	// 用户的登录验证
	public User userCheck(String username, String password) {
		
		User user = null;
		
		String hql = "FROM User u WHERE u.user_name = ? and u.user_password = ?";
		
		Query query = getSession().createQuery(hql);
		
		query.setString(0, username);
		query.setString(1, password);
		
		user = (User) query.uniqueResult();
		
		return user;
	}
	
	// 用户注册，向数据库中插入数据;
	// 用户修改信息，调用相同的方法
	public void saveOrUpdate(User user){
		
		getSession().saveOrUpdate(user);
		
	}
	
	// 邮箱的验证
	public User emailCheck(String email){
		User user = null;
		
		String hql = "FROM User u WHERE u.user_email = ?";
		
		Query query = getSession().createQuery(hql);
		
		query.setString(0, email);
		
		user = (User) query.uniqueResult();
		
		return user;
	}
	
	// 用户名是否被注册的检验
	public User usernameCheck(String username){
		User user = null;
		
		String hql = "FROM User u WHERE u.user_name = ?";
		
		Query query = getSession().createQuery(hql);
		
		query.setString(0, username);
		
		user = (User) query.uniqueResult();
		
		return user;
	}
	
	// 删除用户
	public void delete(Integer id){
		
		String hql = "DELETE FROM User u WHERE u.id = ?";
		
		getSession().createQuery(hql).setInteger(0, id).executeUpdate();
		
	}
	
}
