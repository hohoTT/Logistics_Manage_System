package com.wt.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wt.entity.User;
import com.wt.service.AdminService;
import com.wt.service.UserService;

public class AdminAction extends ActionSupport{

	private static final long serialVersionUID = 1L;

	private AdminService adminService;
	
	private UserService userService;
	
	private Map<String, Object> session;
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String userList() {
		
		session = ActionContext.getContext().getSession();

		List<User> userLists = userService.getAll();
		
		// 以下为测试时使用
		for (User user : userLists) {
			
			System.out.println("User_name --- " + user.getUser_name() + 
					"   user_state --- " + user.getUser_state());
			
		}

		session.put("userLists", userLists);
		
		return "userList";
	}
	
}
