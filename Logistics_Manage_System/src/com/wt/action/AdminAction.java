package com.wt.action;

import com.opensymphony.xwork2.ActionSupport;
import com.wt.service.AdminService;

public class AdminAction extends ActionSupport{

	private static final long serialVersionUID = 1L;

	private AdminService adminService;
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	
	
}
