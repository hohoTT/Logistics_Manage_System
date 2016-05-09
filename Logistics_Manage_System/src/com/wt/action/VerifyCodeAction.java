package com.wt.action;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.awt.Color;     
import java.awt.Font;     
import java.awt.Graphics2D;     
import java.awt.image.BufferedImage;     
import java.util.Random;     
     


import javax.imageio.ImageIO;     
import javax.servlet.ServletException;     
import javax.servlet.ServletOutputStream;    
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class VerifyCodeAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	
	/** 
    * 验证码图片的宽度。  
    */  
    private int width = 100;     
       
    /** 
    *  验证码图片的高度。 
    */  
    private int height = 30;     
     
    /** 
    * 验证码字符个数  
    */  
    private int codeCount = 4;     
     
    /** 
    * 字体高度    
    */  
    private int fontHeight;     
      
    /** 
    * 第一个字符的x轴值，因为后面的字符坐标依次递增，所以它们的x轴值是codeX的倍数 
    */  
    private int codeX;     
      
    /** 
    * codeY ,验证字符的y轴值，因为并行所以值一样 
    */  
    private int codeY;     
     
    /** 
    * codeSequence 表示字符允许出现的序列值 
    */  
    char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',     
            'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',     
            'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };     

    // 实现创建验证码的功能
	public void captcha(){
		
		ActionContext context = ActionContext.getContext();
		
		HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST);
		
		HttpServletResponse response = (HttpServletResponse) context.get(ServletActionContext.HTTP_RESPONSE);
		
		
		//width-4 除去左右多余的位置，使验证码更加集中显示，减得越多越集中。  
        //codeCount+1     //等比分配显示的宽度，包括左右两边的空格  
        codeX = (width-4) / (codeCount+1);  
        //height - 10 集中显示验证码  
        fontHeight = height - 10;    
        codeY = height - 7;  
        
        
        // 定义图像buffer     
        BufferedImage buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);     
        Graphics2D gd = buffImg.createGraphics();     
        // 创建一个随机数生成器类     
        Random random = new Random();     
        // 将图像填充为白色     
        //gd.setColor(Color.LIGHT_GRAY);     
        gd.fillRect(0, 0, width, height);     
        // 创建字体，字体的大小应该根据图片的高度来定。     
        Font font = new Font("Fixedsys", Font.PLAIN, fontHeight);     
        // 设置字体。     
        gd.setFont(font);     
        // 画边框。     
        //gd.setColor(Color.BLACK);     
        gd.drawRect(0, 0, width - 1, height - 1);     
        // 随机产生160条干扰线，使图象中的认证码不易被其它程序探测到。     
        gd.setColor(Color.gray);     
        for (int i = 0; i < 16; i++) {     
            int x = random.nextInt(width);     
            int y = random.nextInt(height);     
            int xl = random.nextInt(12);     
            int yl = random.nextInt(12);     
            gd.drawLine(x, y, x + xl, y + yl);     
        }     
        // randomCode用于保存随机产生的验证码，以便用户登录后进行验证。     
        StringBuffer randomCode = new StringBuffer();     
        int red = 0, green = 0, blue = 0;     
        // 随机产生codeCount数字的验证码。     
        for (int i = 0; i < codeCount; i++) {     
            // 得到随机产生的验证码数字。     
            String strRand = String.valueOf(codeSequence[random.nextInt(36)]);     
            // 产生随机的颜色分量来构造颜色值，这样输出的每位数字的颜色值都将不同。     
            red = random.nextInt(255);     
            green = random.nextInt(255);     
            blue = random.nextInt(255);     
            // 用随机产生的颜色将验证码绘制到图像中。     
            gd.setColor(new Color(red,green,blue));     
            gd.drawString(strRand, (i + 1) * codeX, codeY);     
            // 将产生的四个随机数组合在一起。     
            randomCode.append(strRand);     
        }     
        // 将四位数字的验证码保存到Session中。     
        HttpSession session = request.getSession();     
        session.setAttribute("validateCode", randomCode.toString());  
        // 禁止图像缓存。     
        response.setHeader("Pragma", "no-cache");     
        response.setHeader("Cache-Control", "no-cache");     
        response.setDateHeader("Expires", 0);     
     
        response.setContentType("image/jpeg");     
        // 将图像输出到Servlet输出流中。     
        //ServletOutputStream sos;
        OutputStream sos;
        
		try {
			sos = response.getOutputStream();
	        ImageIO.write(buffImg, "jpeg", sos);  
	        sos.flush();
	        sos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("error");
		}          
		
	}
	
}
