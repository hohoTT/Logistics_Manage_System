package com.wt.service;

import java.util.List;

import org.hibernate.Query;

import com.wt.dao.AdminDao;
import com.wt.entity.Admin;

public class AdminService {

	private AdminDao adminDao;
	
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	// 查询所有的管理员
	public List<Admin> getAll(){
	
		return adminDao.getAll();
		
	}
	
	// 管理员的登录验证
	public Admin adminCheck(String admin_name, String admin_password) {
		
		return adminDao.adminCheck(admin_name, admin_password);
	}
	
}
