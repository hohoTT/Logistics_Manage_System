package com.wt.jsonHandle;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.wt.entity.User;
import com.wt.service.UserService;

public class RegisterJsonHandle extends ActionSupport implements 
	ModelDriven<User>, Preparable{

	private static final long serialVersionUID = 1L;

	private Map<String, Object> dataMap;
	
	private UserService userService;
	
	private User model;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public Map<String, Object> getDataMap() {
		return dataMap;
	}
	
	// 注册创建用户
	public String save(){
		
		dataMap = new HashMap<String, Object>();
		
		ActionContext context = ActionContext.getContext();
		
		HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST);
		
		String username = request.getParameter("username");
		
		String password = request.getParameter("password");
		
		String email = request.getParameter("email");
		
		String Str_userphone = request.getParameter("userphone");

		long userphone = Long.parseLong(Str_userphone);
		
		System.out.println(userphone);
		
		String useraddress = request.getParameter("useraddress");

		// 向数据库中插入一条用户数据
		if(username != null && password != null && email != null && Str_userphone != null && useraddress != null){
			System.out.println("username --- " + username + " password --- " + password + " email--- " + email + " userphone --- " + userphone + "useraddress ---" + useraddress);
			
			User user = new User();
			
			user.setUser_name(username);
			user.setUser_password(password);
			user.setUser_email(email);
			user.setUser_phone(userphone);
			user.setUser_address(useraddress);
			
			userService.saveOrUpdate(user);
			
			dataMap.put("user", model);
			dataMap.put("code", 0);
		}
			
		return SUCCESS;
	}

	@Override
	public void prepare() throws Exception {}

	@Override
	public User getModel() {
		return model;
	}
	
}
