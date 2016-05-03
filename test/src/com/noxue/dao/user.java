package com.noxue.dao;

import java.io.IOException;
import java.util.Iterator;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;

import com.noxue.javabean.User;
import com.noxue.tool.MD5Util;

public class user {

	private String filename = "";

	public user() {
		filename = this.getClass().getClassLoader().getResource("/").getPath()
				+ "users.xml";
	}

	public boolean adduser(User u) {
		try {
			if (this.exist(u))
				return false; // 用户已存在

			Xml xml = new Xml();
			Document doc;

			doc = xml.getDocument(filename);

			Element root = doc.getRootElement();
			Element user = root.addElement("user");

			user.addAttribute("id", (this.getMaxId() + 1) + "");

			user.addAttribute("name", u.getName());
			user.addAttribute("password", MD5Util.MD5(u.getPassword()));
			user.addAttribute("sex", u.getSex());
			user.addAttribute("email", u.getEmail());

			xml.WriteToXML(doc, filename);

		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public long getMaxId() throws DocumentException {
		long id = 0;
		Xml xml = new Xml();
		Document doc = xml.getDocument(filename);
		Element root = doc.getRootElement();
		Iterator i = null;
		Element last = null;
		for (i = root.elementIterator(); i.hasNext();) {
			last = (Element) i.next();
		}
		if (last != null) {
			String ids = last.attributeValue("id");
			id = Long.parseLong(ids);
		} else {
			id = 0;
		}

		return id;
	}

	public boolean exist(User u) {

		boolean flag = false;
		User user1;
		try {
			user1 = this.findUserByName(u.getName());
		} catch (DocumentException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		if (user1 != null && user1.getName().equals(u.getName())) {
			flag = true;
		}
		return flag;
	}

	public boolean checkLogin(User u) throws DocumentException {
		boolean flag = false;
		User user = this.findUserByName(u.getName());
		if (user != null) {
			if (user.getPassword().equals(MD5Util.MD5(u.getPassword()))) {
				flag = true;
			}
		}
		return flag;

	}

	public User findUserByName(String name) throws DocumentException {
		User u = new User();

		Xml xml = new Xml();
		Document doc = xml.getDocument(filename);
		Element root = doc.getRootElement();
		for (Iterator i = root.elementIterator(); i.hasNext();) {
			Element node = (Element) i.next();
			if (node == null)
				break;
			String username = node.attributeValue("name");
			if (username.equals(name)) {
				String passwrod = node.attributeValue("password");
				String email = node.attributeValue("email");
				String sex = node.attributeValue("sex");
				String ids = node.attributeValue("id");

				u.setId(Long.parseLong(ids));
				u.setEmail(email);
				u.setName(username);
				u.setPassword(passwrod);
				u.setSex(sex);

				return u;
			}
		}

		return null;
	}

}
