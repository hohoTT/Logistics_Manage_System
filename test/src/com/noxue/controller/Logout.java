package com.noxue.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.noxue.javabean.User;

public class Logout extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		HttpSession session = request.getSession();
		String hash = request.getParameter("hash");
		if(hash.trim().equals(session.getAttribute("hash").toString())){
			
			/*从在线列表中移除*/
			ServletContext application  = this.getServletContext();
			List<User> online = (List<User>) application.getAttribute("online");
			for(Iterator<User> i=online.iterator(); i.hasNext();){
				User u = (User) i.next();
				if(u.getName().equals(session.getAttribute("username").toString())){
					i.remove();
				}
			}
			session.invalidate();
			request.setAttribute("msg", "退出成功");
			request.setAttribute("url", "chat.do");
		} else {
			request.setAttribute("msg", "来路错误");
			request.setAttribute("url", "javascript:history.go(-1);");
		}
		response.sendRedirect("login.do");
	}
}
