package com.wt.jsonHandle;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wt.entity.User;
import com.wt.service.UserService;

public class ResetPasswordJsonHandle extends ActionSupport{

	private static final long serialVersionUID = 1L;

	private Map<String, Object> dataMap;
	
	private UserService userService;
	
	private Map<String, Object> session;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String jsonResetPassword() {
		
		dataMap = new HashMap<String, Object>();

		session = ActionContext.getContext().getSession();
		
		ActionContext context = ActionContext.getContext();
		
		HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST);
		
		HttpSession httpSession = request.getSession();
		
		// 获取用户输入的新密码等信息
		String new_password = request.getParameter("new_password");
		String captcha = request.getParameter("captcha");
		String reset_captcha = request.getParameter("reset_captcha");
		
		System.out.println("new_password --- " + new_password);
		System.out.println("captcha --- " + captcha);
		System.out.println("reset_captcha --- " + reset_captcha);
		
		
		// 获取用户
		String email = (String) httpSession.getAttribute("email");
		User user = userService.emailCheck(email);
		
		String validateCode = (String) httpSession.getAttribute("validateCode");
		
		// 不区分大小写的操作，将获取的 captcha 参数转为大写字母 
		captcha = captcha.toUpperCase();
		
		String randomNum = (String) httpSession.getAttribute("randomNum");
//		System.out.println("randomNum ----" + randomNum);
		
		if(!reset_captcha.equals(randomNum)){
//			System.out.println("!reset_captcha.equals(randomNum) ----");
			dataMap.put("data", "重置密钥有误, 请重新检查系统所发邮件！");
			dataMap.put("code", 1);
		}
		else{
			if(!captcha.equals(validateCode)){
//				System.out.println("!captcha.equals(validateCode) ----");
				dataMap.put("data", "验证码错误");
				dataMap.put("code", 1);
			}
			else{
//				System.out.println("captcha.equals(validateCode) ----");
				
				// 重新保存用户信息
				user.setUser_password(new_password);
				userService.saveOrUpdate(user);
				
				dataMap.put("data", "重置密码成功，请重新登录！");
				dataMap.put("code", 0);
			}
		}
		
		return SUCCESS;
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}
	
}
