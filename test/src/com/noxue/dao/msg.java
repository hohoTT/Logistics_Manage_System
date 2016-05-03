package com.noxue.dao;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;

import com.noxue.javabean.Msg;

public class msg {
	private String filename = "";
	

	public msg() {
		filename = this.getClass().getClassLoader().getResource("/").getPath()
				+ "messages.xml";
	//filename = "e:/jsp/chat/WebRoot/WEB-INF/db/messages.xml";
		System.out.println(filename);
	}

	public void add(Msg m) throws DocumentException, IOException {
	
		
		Xml xml  = new Xml();
		Document doc = xml.getDocument(filename);
		Element root = doc.getRootElement();
		Element m1 =  root.addElement("msg");
		m1.addAttribute("id", (this.getMaxId()+1)+"");
		m1.addAttribute("user", m.getUser());
		m1.addAttribute("color", m.getColor());
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss");
		m1.addAttribute("time", df.format(new Date())); 
		
		m1.addAttribute("msg", m.getMsg());
		
		xml.WriteToXML(doc, filename);
	}
	

	public List<Msg> getMsgs(long id) throws DocumentException {
		List<Msg> messages = new ArrayList<Msg>();

		Xml xml = new Xml();
		Document doc = xml.getDocument(filename);
		Element root = doc.getRootElement();

		for (Iterator i = root.elementIterator(); i.hasNext();) {
			Element temp = (Element) i.next();
			if (temp == null)
				return null;
			Long ID = Long.parseLong(temp.attributeValue("id"));
			if (ID > id) {
				Msg m = new Msg();

				String user = temp.attributeValue("user");
				String color = temp.attributeValue("color");
				String time = temp.attributeValue("time");
				String msg1 = temp.attributeValue("msg");

				m.setId(ID);
				m.setUser(user);
				m.setColor(color);
				m.setTime(time);
				m.setMsg(msg1);
				
				messages.add(m);
			}

		}

		return messages;
	}
	
	
	public long getMaxId() throws DocumentException {
		long id=0;
		Xml xml = new Xml();
		Document doc = xml.getDocument(filename);
		Element root = doc.getRootElement();
		Iterator i = root.elementIterator(); 
		Element temp = null;
		for (;i.hasNext();){
			temp  = (Element) i.next();
		}
		
		if(temp == null) {
			id= 0;
		} else {
			id = Long.parseLong(temp.attributeValue("id"));
		}
		return id;
	}
}
