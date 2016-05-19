package com.wt.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class UserLoginShoppingInfoInterceptor extends AbstractInterceptor{

	private static final long serialVersionUID = 1L;

	private Map<String, Object> session;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {

		session = ActionContext.getContext().getSession();
		
		String username = (String) session.get("username");
		
		if(username != null){
			System.out.println("invocation ---- username " + username);
			return invocation.invoke();
		}
		else{
			return "userShoppingInfoLogin";
		}
		
	}
	
}
