package com.wt.jsonHandle;

import java.util.HashMap;
import java.util.Map;

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
	ModelDriven<User>, Preparable, ServletResponseAware{

	private static final long serialVersionUID = 1L;

	private Map<String, Object> dataMap;
	
	private UserService userService;
	
	private User model;
	
	HttpServletResponse response;
	
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

		System.out.println("username --- " + username + " password --- " + password + " email--- " + email);
		
		// 向数据库中插入一条用户数据
		if(username != null && password != null && email != null){
			System.out.println("username --- " + username + " password --- " + password + " email--- " + email);
			System.out.println("model " + model);
			
			userService.saveOrUpdate(model);
			System.out.println("11111");
			
			dataMap.put("user", model);
			dataMap.put("code", 0);
		}
			
		return SUCCESS;
	}
	
	
	public void prepareSave(){
		
		model = new User();
				
	}

	@Override
	public void prepare() throws Exception {}

	@Override
	public User getModel() {
		return model;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}
	
	
}
