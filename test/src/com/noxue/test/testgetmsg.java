package com.noxue.test;

import java.util.Iterator;
import java.util.List;

import org.dom4j.DocumentException;

import com.noxue.dao.msg;
import com.noxue.javabean.Msg;

public class testgetmsg {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		msg m = new msg();
		try {
			List<Msg> msgs = m.getMsgs(2);
			Iterator i = msgs.iterator();
			if(i==null){
				System.out.println("Œﬁ–≈œ¢");
				return;
			}
			for(;i.hasNext();)
			{
				Msg temp = (Msg) i.next();
				System.out.println(temp.getMsg());
			}
			
			
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
