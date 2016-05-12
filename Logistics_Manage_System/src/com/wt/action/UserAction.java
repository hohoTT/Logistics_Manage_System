package com.wt.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.json.JSONArray;
import org.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.wt.entity.User;
import com.wt.service.UserService;

public class UserAction extends ActionSupport implements RequestAware,
ModelDriven<User>, Preparable{

	private static final long serialVersionUID = 1L;
	
	private UserService userService;
	
	private Integer id;
	
	private InputStream inputStream;
	
	private String userName;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public InputStream getInputStream() {
		return inputStream;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String list() {

		List<User> users = userService.getAll();
		
		// 以下为测试时使用
		for (User user : users) {
			
			System.out.println("User_name --- " + user.getUser_name());
			
		}
		
		return "list";
	}
	
	// 用户登出
	public String exit(){
		
		Map<String, Object> session = ActionContext.getContext().getSession();
		
		session.clear();
		
		// 测试时使用
		//System.out.println("111111");
		
		return "exit";
	}
	
	// 删除用户
	public String delete(){
		
		try {
			userService.delete(id);
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (Exception e) {
			e.printStackTrace();
			try {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}

		return "ajax-success";
	}

	@Override
	public void prepare() throws Exception {}

	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}

}
