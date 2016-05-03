<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登陆</title>
    
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
    <form action="login.do" method="post">
    	<h3>用户登陆</h3>
    	<label>昵称：<input type="text" name="username" /></label><br />
    	<label>密码：<input type="password" name="password" /></label> <br />
    	<input type="submit" name="submit" value="登陆" />
    </form>
    <a href="reg.do">无账号？注册</a>
  </body>
</html>
