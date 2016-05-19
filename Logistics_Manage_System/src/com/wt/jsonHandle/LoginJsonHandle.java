package com.wt.jsonHandle;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wt.entity.User;
import com.wt.service.UserService;

public class LoginJsonHandle extends ActionSupport{

	private static final long serialVersionUID = 1L;
	
	private Map<String, Object> dataMap;
	
	private UserService userService;
	
	private Map<String, Object> session;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String jsonLogin() {
		
		dataMap = new HashMap<String, Object>();

		session = ActionContext.getContext().getSession();
		
		ActionContext context = ActionContext.getContext();
		
		HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST);
		
		String username = request.getParameter("username");
		
		String password = request.getParameter("password");
		
		String captcha = request.getParameter("captcha");
		
		HttpSession httpSession = request.getSession();
		
		String validateCode = (String) httpSession.getAttribute("validateCode");
		
		// 不区分大小写的操作，将获取的 captcha 参数转为大写字母 
		captcha = captcha.toUpperCase();
		
		// 测试时使用
		System.out.println("username ---- " + username);
		System.out.println("password ---- " + password);
		System.out.println("captcha ---- " + captcha);
		System.out.println("validateCode ---- " + validateCode);
		System.out.println("-----------------------------");
		
		User user = userService.userCheck(username, password);
		
		// 测试时使用 
//		System.out.println("user **** " + user);
//		System.out.println("user ------- " + user.getUser_name() + " --- " + user.getUser_password());
		
		if(user == null){
			dataMap.put("data", "用户名或密码错误");
			dataMap.put("code", 1);
//			System.out.println("error------用户名或密码错误");
		}
		else{

			if(!captcha.equals(validateCode)){
				dataMap.put("data", "验证码错误");
				dataMap.put("code", 1);
//				System.out.println("error------验证码错误");
			}
			else{
				
				// 此时的用户评级为 3， 即为不良，因此禁止用户的登录操作
				if(user.getUser_state() == 3){
					dataMap.put("data", "存在不良记录禁止登录，如有意见可联系管理员或反馈意见   :  )");
					dataMap.put("code", 1);
				}
				else{
					session.clear();
					session.put("username", user.getUser_name());
					
					// 测试时使用
//					System.out.println("success------");
//					System.out.println("session.put ---- " + user.getUser_name());
					
					dataMap.put("user", user);
					dataMap.put("code", 0);
				}
			}
			
		}

		return SUCCESS;
	}
	
	public Map<String, Object> getDataMap() {
		return dataMap;
	}

}
