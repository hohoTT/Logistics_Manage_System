package com.wt.jsonHandle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wt.entity.User;
import com.wt.service.UserService;

public class UserValidate extends ActionSupport{

	private static final long serialVersionUID = 1L;

	private UserService userService;
	
	ActionContext context = ActionContext.getContext();
	
	HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST);
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	// 用户名验证
	public String usernameCheck(){
		
		String username = request.getParameter("username");
		
		// 验证用户名是否被注册使用
		User usernameCheckUser = userService.usernameCheck(username);
				
		// 如果用户名已被注册，返回该用户名已被注册！的错误消息
		if(usernameCheckUser != null){
			return "usernameError";
		}
		else{
			return "usernameSuccess";
		}
	}
	
	// 邮箱验证
	public String emailCheck(){
		
		String email = request.getParameter("email");
		
		// 验证邮箱是否被注册使用
		User emailCheckUser = userService.emailCheck(email);
				
		// 如果用户名已被注册，返回该用户名已被注册！的错误消息
		if(emailCheckUser != null){
			return "emailError";
		}
		else{
			return "emailSuccess";
		}
	}
	
	// 发送邮件修改密码时的邮箱验证
	public String resetPasswordEmailCheck(){
		
		String email = request.getParameter("email");
		
		// 验证邮箱是否被注册使用
		User emailCheckUser = userService.emailCheck(email);
				
		// 如果用户名已被注册，返回该用户名已被注册！的错误消息
		if(emailCheckUser != null){
			return "emailSuccess";
		}
		else{
			return "emailError";
		}
	}
	
}
