package com.wt.jsonHandle;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.json.JSONArray;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wt.entity.User;

public class LoginJsonHandle extends ActionSupport{

	private static final long serialVersionUID = 1L;
	
	private Map<String, Object> dataMap;

	public String jsonLogin() {
		
		dataMap = new HashMap<String, Object>();
		
		ActionContext context = ActionContext.getContext();
		
		HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST);
		
		String username = request.getParameter("username");
		
		String password = request.getParameter("password");
		
		System.out.println("username ---- " + username);
		System.out.println("password ---- " + password);
		System.out.println("-----------------------------");
		
		User user = new User();
		user.setUser_name(username);
		user.setUser_password(password);
		
		if(username.equals("aaa")){
			dataMap.put("data", "exists");
			dataMap.put("code", 1);
		}
		else{
			dataMap.put("user", user);
			dataMap.put("code", 0);
		}
		
		
		return SUCCESS;
	}
	
	public Map<String, Object> getDataMap() {
		return dataMap;
	}

}
