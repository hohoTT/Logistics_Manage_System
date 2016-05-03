package com.noxue.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dom4j.DocumentException;

import com.noxue.dao.msg;
import com.noxue.dao.user;
import com.noxue.javabean.User;

public class login extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,
				response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		out.println("login post");
		
		User user1 = new User();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		

		if (username.trim().isEmpty()) {
			request.setAttribute("message", "用户名不能为空");
			request.setAttribute("url", "javascript:history.go(-1);");
			request.getRequestDispatcher("/WEB-INF/jsp/message.jsp")
					.forward(request, response);
			return;
		} else if (password.trim().isEmpty()) {
			request.setAttribute("message", "密码不能为空");
			request.setAttribute("url", "javascript:history.go(-1);");
			request.getRequestDispatcher("/WEB-INF/jsp/message.jsp")
					.forward(request, response);
			return;
		}

		user1.setName(username);
		user1.setPassword(password);
		

		user u = new user();
		HttpSession session = request.getSession();
		try {
			if (u.checkLogin(user1)) {
				session.setAttribute("username", user1.getName());
				
				/*----用户添加到在线列表----*/
				 ServletContext application=this.getServletContext();   
				 List<User> online = null;
			     user1 = u.findUserByName(user1.getName());
				online = (List<User>) application.getAttribute("online");  
				if(online == null){
					online = new ArrayList<User>();
				}
			    online.add(user1); 
			    application.setAttribute("online", online);
			    /*----用户添加到在线列表----*/
			    
			    session.setAttribute("hash", UUID.randomUUID().toString());
			    
			    
			    this.getServletContext().log("user:"+user1.getName()+" login success");
			    
				msg m = new msg();
				session.setAttribute("msgid", m.getMaxId());
				request.setAttribute("message", "登陆成功");
				request.setAttribute("url", "chat.do");
				
				out.println("login ok");
				
			} else {
				session.invalidate();
				request.setAttribute("message", "用户不存在或密码错误");
				request.setAttribute("url", "javascript:history.go(-1)");
				
				out.println("login no");
			}
			request.getRequestDispatcher("/WEB-INF/jsp/message.jsp")
			.forward(request, response);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			out.println("login failed");
		}
	}

}
