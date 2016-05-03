package com.noxue.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.dom4j.DocumentException;

import com.noxue.dao.msg;
import com.noxue.javabean.Msg;
import com.noxue.javabean.User;

public class chat extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		String name = (String) session.getAttribute("username");
		if (name == null) {
			resp.sendRedirect("login.do");
			return;
		}
		super.service(req, resp);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.getRequestDispatcher("/WEB-INF/jsp/chat.jsp").forward(request,
				response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		String action = request.getParameter("do");
		synchronized (this) {
			if (action.trim().equals("sendmsg")) {
				this.doSend(request, response);
			} else if (action.trim().equals("getmsg")) {
				this.doGetmsg(request, response);
			} else if (action.trim().equals("onlinelist")) {
				this.doOnline(request, response);
			}
		}
		out.flush();
		out.close();
	}

	public void doSend(HttpServletRequest request, HttpServletResponse response)throws IOException {
		synchronized(this){
		PrintWriter out = response.getWriter();
		String message = request.getParameter("msg");
		String color  = request.getParameter("color");

		out.flush();
		out.close();
		HttpSession session = request.getSession();
		Msg m = new Msg();
		m.setColor("#"+color);
		m.setMsg(message);
		m.setUser(session.getAttribute("username").toString());

		msg m1 = new msg();
		try {
			m1.add(m);
			System.out.println("#"+color + m.getUser() + " หตฃบ" + m.getMsg());
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}

	public void doGetmsg(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		synchronized(this){
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		List<Msg> msgs = null;
		JSONObject jsons = new JSONObject();
		JSONObject json = new JSONObject();

		msg m = new msg();
		long msgid = Long.parseLong(session.getAttribute("msgid").toString());

		try {
			msgs = m.getMsgs(msgid);
		} catch (DocumentException e) {
			e.printStackTrace();
		}

		Iterator i = msgs.iterator();

		if (i != null) {
			while (i.hasNext()) {
				Msg temp = (Msg) i.next();
				json.put("username", temp.getUser());
				json.put("color", temp.getColor());
				json.put("time", temp.getTime());
				json.put("msg", temp.getMsg());
				jsons.put(temp.getId(), json);
			}
		}

		msg m1 = new msg();
		try {
			session.setAttribute("msgid", m1.getMaxId());
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.println(jsons.toString());
		}
	}

	@SuppressWarnings("unchecked")
	public void doOnline(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		synchronized(this){
		PrintWriter out  = response.getWriter();
		ServletContext application = this.getServletContext();
		List<User> online = null;
		online = (List<User>) application.getAttribute("online");
		JSONObject users = new JSONObject();
		JSONObject user = new JSONObject();
		Iterator<User> i = online.iterator();
		if (i != null) {
			while (i.hasNext()) {
				User u = (User) i.next();
				System.out.println(u.getId() + "  " + u.getName() + "   "
						+ u.getEmail());
				user.put("username", u.getName());
				user.put("sex", u.getSex());
				users.put(u.getId(), user);
			}

		}
		
		out.print(users.toString());
		}
	}

}
