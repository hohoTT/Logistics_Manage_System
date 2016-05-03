<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	body{text-align:center;background:#f4f4f4}
	form{margin:100px auto;text-align:left;width:300px;}
	</style>
  </head>
  
  <body>
    <form action="reg.do" method="post">
    	<h3>用户注册</h3>
    	<label>昵称：<input type="text" name="username" /></label><br />
    	<label>邮箱：<input type="text" name="email" /></label><br />
    	<label>性别：<select name="sex">
    		<option value="女">腐女</option>
    		<option value="男">宅男</option>
    	</select>
    	</label><br />
    	<label>密码：<input type="password" name="password" /></label> <br />
    	<label>重复：<input type="password" name="password2" /></label> <br />
    	<input type="submit" name="submit" value="注册" />
    </form>
    <a href="login.do">已有账号？登陆</a>
  </body>
</html>
