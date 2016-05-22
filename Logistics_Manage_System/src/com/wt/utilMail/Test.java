package com.wt.utilMail;

import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.runtime.RuntimeConstants;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;


public class Test {
	
	public static void main(String[] args) {
		
		VelocityEngine ve = new VelocityEngine();
		ve.setProperty(RuntimeConstants.RESOURCE_LOADER, "classpath");
		ve.setProperty("classpath.resource.loader.class", ClasspathResourceLoader.class.getName());
		 
		ve.init();
		 
		Template template = ve.getTemplate("template/emailTemplate.vm", "gbk");
		VelocityContext ctx = new VelocityContext();
		
		// 生成六位随机字符串
		String chars = "0123456789";  
	    String randomNum ="";
	    
		char[] rands = new char[6];  
		
	    for (int i = 0; i < 6; i++) { 
	    	int rand = (int) (Math.random() * 10);  
	        rands[i] = chars.charAt(rand);  
			randomNum += rands[i];
	    }  
	    
	    System.out.println(randomNum);
		 
		ctx.put("title", "物流配送管理系统");
		ctx.put("username", "hohoTT");
		ctx.put("randomNum", randomNum);
		 
		StringWriter sw = new StringWriter();
		 
		template.merge(ctx, sw);
		 
		System.out.println(sw.toString());
	 
		
		//这个类主要是设置邮件   
		MailSenderInfo mailInfo = new MailSenderInfo();    
		mailInfo.setMailServerHost("smtp.163.com");    
		mailInfo.setMailServerPort("25");    
		mailInfo.setValidate(true);    
		mailInfo.setUserName("walk_wang_tt@163.com");
		
		// 开通smtp等服务时，设置你的邮箱授权码
		// 此时输入的为邮箱的授权码，而不是你的邮箱密码
		mailInfo.setPassword("******"); 
      	mailInfo.setFromAddress("walk_wang_tt@163.com");    
      	mailInfo.setToAddress("609029365@qq.com");    
      	mailInfo.setSubject("物流配送管理系统 登录信息找回");    
      	mailInfo.setContent(sw.toString());    
      	//这个类主要来发送邮件   
      	SimpleMailSender sms = new SimpleMailSender();   
      	//sms.sendTextMail(mailInfo);//发送文体格式    
      	
      	
		sms.sendHtmlMail(mailInfo);//发送html格式   
	}

}
