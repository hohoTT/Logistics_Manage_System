<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<a href="/Logistics_Manage_System/">
		<p id="title">物流中心</p>
		<p id="title-tail">join &nbsp;us</p>
	</a>
	
	<%
		String div_style = "block";
		String is_online = "none";
		String again_login = "none";
		Object user = session.getAttribute("username");
		String username = (String) user;
		
		if (username != null) {
			div_style = "none";
			is_online = "block";
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
		<a href="index.jsp">
			<button class="btn btn-success btn-lg">
				<%=username%>
			</button> 
		</a>
		<a href="exit.jsp">
			<button class="btn btn-warning btn-lg">
				退出登录
			</button> 
		</a>
	</div>
	
</body>
</html>