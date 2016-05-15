<%@ page language="java" import="java.util.*" 
contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'footer.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="shortcut icon" href="image/favicon.ico" />

</head>

<body>

	<!-- footer -->
	
	<div class="footer" style="background: rgba(0, 28, 50, 0)">
		<p class="text-muted text-center">Copyright © 2016 &nbsp; 王涛
			&nbsp; Team WANG</p>
	</div>
	
</body>
</html>
