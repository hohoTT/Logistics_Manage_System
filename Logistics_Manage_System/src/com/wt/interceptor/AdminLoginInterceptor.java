package com.wt.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AdminLoginInterceptor extends AbstractInterceptor{

	private static final long serialVersionUID = 1L;

	private Map<String, Object> session;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {

		session = ActionContext.getContext().getSession();
		
		String AdminName = (String) session.get("adminName");
		
		if(AdminName != null){
			System.out.println("invocation ---- adminName " + AdminName);
			return invocation.invoke();
		}
		else{
			return "adminLogin";
		}
		
	}
	
}
