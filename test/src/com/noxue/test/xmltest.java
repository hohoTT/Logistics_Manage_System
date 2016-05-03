package com.noxue.test;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Iterator;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.XMLWriter;

import com.noxue.dao.*;
import com.noxue.javabean.User;

public class xmltest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		User user1 = new User();
		
		user1.setName("noxue");
		user1.setPassword("123456");
		user1.setEmail("30670835@qq.com");
		user1.setSex("male");
		
		user u = new user();
		u.adduser(user1);
		
		user u1 = new user();
		try {
			System.out.println(u1.getMaxId());
		} catch (DocumentException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static int createXMLFile(String filename){
	       /** 返回操作结果, 0表失败, 1表成功 */
	       int returnValue = 0;
	       /** 建立document对象 */
	       Document document = DocumentHelper.createDocument();
	       /** 建立XML文档的根books */
	       Element booksElement = document.addElement("books");
	       /** 加入一行注释 */
	       booksElement.addComment("This is a test for dom4j, holen, 2004.9.11");
	       /** 加入第一个book节点 */
	       Element bookElement = booksElement.addElement("book");
	       /** 加入show属性内容 */
	       bookElement.addAttribute("show","yes");
	       /** 加入title节点 */
	       Element titleElement = bookElement.addElement("title");
	       /** 为title设置内容 */
	       titleElement.setText("Dom4j Tutorials");
	      
	       /** 类似的完成后两个book */
	       bookElement = booksElement.addElement("book");
	       bookElement.addAttribute("show","yes");
	       titleElement = bookElement.addElement("title");
	       titleElement.setText("Lucene Studing");
	       bookElement = booksElement.addElement("book");
	       bookElement.addAttribute("show","no");
	       titleElement = bookElement.addElement("title");
	       titleElement.setText("Lucene in Action");
	      
	       /** 加入owner节点 */
	       Element ownerElement = booksElement.addElement("owner");
	       ownerElement.setText("O'Reilly");
	      
	       try{
	           /** 将document中的内容写入文件中 */
	           XMLWriter writer = new XMLWriter(new FileWriter(new File(filename)));
	           writer.write(document);
	           writer.close();
	           /** 执行成功,需返回1 */
	           returnValue = 1;
	       }catch(Exception ex){
	           ex.printStackTrace();
	       }
	             
	       return returnValue;
	    }

}
