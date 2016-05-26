<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
	#title {
		color: #fff;
	}

	#title-tail {
		color: #fff;
	}
</style>

</head>
<body>

	<a href="/Logistics_Manage_System/">
		<p id="title">物流中心</p>
		<p id="title-tail">join &nbsp;us</p>
	</a>
	
	<%
		String div_style = "block";
		String is_online = "none";
		String admin_login = "none";
		
		// 获取普通的用户
		Object user = session.getAttribute("username");
		String username = (String) user;
		
		// 获取管理员
		Object admin = session.getAttribute("adminName");
		String adminName = (String) admin;
		

		if(username != null && adminName != null){
			session.removeAttribute(username);
			div_style = "none";
			admin_login = "block";
		}
		else if (username != null) {
			div_style = "none";
			is_online = "block";
		}
		else if(adminName != null){
			div_style = "none";
			admin_login = "block";
		}
	%>
	
	<div id="login" style="display: <%=div_style%>">
		<a href="userLogin">
			<button class="btn btn-success btn-lg">
			登录
			</button> 
		</a> 
		<a href="userRegister">
			<button class="btn btn-warning btn-lg">
			注册
			</button>
		</a>
	</div>
	
	<div id="login" style="display: <%=is_online%>">
		<a href="userInfoSetting">
			<button class="btn btn-success btn-lg">
				<%=username%>
			</button> 
		</a>
		<a href="user-exit">
			<button class="btn btn-warning btn-lg">
				退出登录
			</button> 
		</a>
	</div>
	
	<div id="login" style="display: <%=admin_login%>">
		<a href="index.jsp">
			<button class="btn btn-success btn-lg">
				<%=adminName%>
			</button> 
		</a>
		<a href="user-exit">
			<button class="btn btn-warning btn-lg">
				退出登录
			</button> 
		</a>
	</div>
	
</body>
</html>