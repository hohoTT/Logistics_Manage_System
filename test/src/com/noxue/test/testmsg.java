package com.noxue.test;

import java.io.IOException;

import org.dom4j.DocumentException;

import com.noxue.dao.msg;
import com.noxue.javabean.Msg;

public class testmsg {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Msg msg = new Msg();
		
		msg.setColor("#000000");
		msg.setUser("admin");
		msg.setMsg("ÄãºÃÄãºÃ");
		
		msg m = new msg();
		try {
			m.add(msg);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
