package com.wt.jsonHandle;

import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.runtime.RuntimeConstants;
import org.apache.velocity.runtime.log.CommonsLogLogChute;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wt.entity.User;
import com.wt.service.UserService;
import com.wt.utilMail.MailSenderInfo;
import com.wt.utilMail.SimpleMailSender;

public class ApplyResetPasswordJsonHandle extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private Map<String, Object> dataMap;

	private UserService userService;

	private Map<String, Object> session;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String jsonApplyResetPassword() {

		dataMap = new HashMap<String, Object>();

		session = ActionContext.getContext().getSession();

		ActionContext context = ActionContext.getContext();

		HttpServletRequest request = (HttpServletRequest) context.get(ServletActionContext.HTTP_REQUEST);

		// 获取用户输入的邮箱
		String email = request.getParameter("email");
		String captcha = request.getParameter("captcha");

		HttpSession httpSession = request.getSession();

		String validateCode = (String) httpSession.getAttribute("validateCode");

		// 不区分大小写的操作，将获取的 captcha 参数转为大写字母
		captcha = captcha.toUpperCase();

		// 以下为验证邮箱是否存在
		User user = userService.emailCheck(email);

		String new_username = user.getUser_name();

		// System.out.println("11111111");

		// 此时为邮箱不存在的情况，可以进行邮件的发送
		if (user == null) {
			dataMap.put("code", 1);
			dataMap.put("data", "邮箱未被注册，请重新输入！");
		}
		// 此时为邮箱存在的情况，可以进行邮件的发送
		else {

			if (!captcha.equals(validateCode)) {
				dataMap.put("data", "验证码错误");
				dataMap.put("code", 1);
			} else {
				// System.out.println("22222222");

				// 以下为发送邮件的过程
				// 废除之前使用传统的发送邮件的方式
				// VelocityEngine ve = new VelocityEngine();
				// System.out.println("333333");
				// ve.setProperty(RuntimeConstants.RESOURCE_LOADER,
				// "classpath");
				// System.out.println("44444");
				// ve.setProperty("classpath.resource.loader.class",
				// ClasspathResourceLoader.class.getName());
				//
				// ve.init();
				// System.out.println("555555");

				// 以下为使用新的魔板进行的更改，测试发送邮件成功
				VelocityEngine ve = new VelocityEngine();
				ve.setProperty(RuntimeConstants.RESOURCE_LOADER, "classpath");
				ve.setProperty("classpath.resource.loader.class", ClasspathResourceLoader.class.getName());

				// send Velocity log to SLF4J (via Commons Logging)
				ve.setProperty(VelocityEngine.RUNTIME_LOG_LOGSYSTEM_CLASS, CommonsLogLogChute.class.getName());

				// this allows unit tests to detect missing context vars:
				ve.setProperty("runtime.references.strict", true);
				ve.init();

				Template template = ve.getTemplate("template/emailTemplate.vm", "gbk");
				VelocityContext ctx = new VelocityContext();

				// 生成六位随机字符串
				String chars = "0123456789";
				String randomNum = "";

				char[] rands = new char[6];

				for (int i = 0; i < 6; i++) {
					int rand = (int) (Math.random() * 10);
					rands[i] = chars.charAt(rand);
					randomNum += rands[i];
				}

				System.out.println(randomNum);

				ctx.put("title", "物流配送管理系统");
				ctx.put("username", new_username);
				ctx.put("randomNum", randomNum);

				StringWriter sw = new StringWriter();

				template.merge(ctx, sw);

				// System.out.println(sw.toString());

				// 这个类主要是设置邮件
				MailSenderInfo mailInfo = new MailSenderInfo();
				mailInfo.setMailServerHost("smtp.163.com");
				mailInfo.setMailServerPort("25");
				mailInfo.setValidate(true);
				mailInfo.setUserName("walk_wang_tt@163.com");

				// 开通smtp等服务时，设置你的邮箱授权码
				// 此时输入的为邮箱的授权码，而不是你的邮箱密码
				mailInfo.setPassword("686833wt");
				mailInfo.setFromAddress("walk_wang_tt@163.com");
				mailInfo.setToAddress(email);
				mailInfo.setSubject("物流配送管理系统 登录信息找回~");
				mailInfo.setContent(sw.toString());

				// 这个类主要来发送邮件
				SimpleMailSender sms = new SimpleMailSender();

				sms.sendHtmlMail(mailInfo);// 发送html格式

				httpSession.setAttribute("email", email);
				httpSession.setAttribute("new_username", new_username);

				// 将生成的验证数字写入 session 属性中
				httpSession.setAttribute("randomNum", randomNum);

				dataMap.put("data", "邮件发送成功,请前往您的邮箱查收！");
				dataMap.put("code", 0);
			}

		}

		return SUCCESS;
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

}
