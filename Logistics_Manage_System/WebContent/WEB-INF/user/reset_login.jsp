<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>重置密码成功，请重新登录</title>

<script type="text/javascript" src="static/js/config.js"></script>
<script type="text/javascript" src="static/js/require.js"></script>

<link rel="stylesheet" href="static/css/global.css" media="all">
<link rel="stylesheet" href="static/css/bootstrap/bootstrap.min.css"/>
<link rel="stylesheet" href="static/css/bootstrap/todc-bootstrap.min.css"/>

<style type="text/css">

body{
	background:url("image/bg5.jpg") top center no-repeat; 
	background-size:cover;
}

#login-form{
	margin-top: 50px;
}

#title {
	position: fixed;
	top: 50px;
	left: 100px;
	font-size: 40px;
}

#title-tail {
	position: fixed;
	top: 130px;
	left: 210px;
	font-size: 20px;
}

#login-div{
	margin-top: 50px;
}

h2{
	font-size: 30px;
	font-family: source_code_pro,"PingFangSC-Regular",
	"Heiti SC","Microsoft Yahei",monospace;
}

a{
	color: #428bca;
}
</style>

<script type="text/javascript" src="static/js/account/login.js"></script>

<link rel="shortcut icon" href="image/favicon.ico" />

</head>

<body>

	<%
		Thread.sleep(1500);
	%>

	<a href="/Logistics_Manage_System/">
		<p id="title">物流中心</p>
		<p id="title-tail">join &nbsp;us</p>
	</a>
	
	<div id="login-div" class="container main">
	    <div class="col-md-6 col-md-offset-3">
	        <h2 class="text-center">重置密码成功，请重新登录</h2>
	
	        <form id="login-form" method="post">
	            <div class="form-group">
	                <label for="username">用户名</label>
	                <input type="text" class="form-control input-lg" id="username" name="username" maxlength="30"
	                       data-error="请填写用户名" placeholder="用户名" autofocus required>
	
	                <div class="help-block with-errors"></div>
	            </div>
	            
	            <div class="form-group">
	                <label for="password">密码</label>
	                <input type="password" class="form-control input-lg" id="password" name="password" maxlength="30"
	                       data-error="请填写密码" placeholder="密码" required>
	
	                <div class="help-block with-errors"></div>
	            </div>
	            
	            <div class="form-group" id="captcha-area">
	                <label for="captcha">验证码</label>&nbsp;&nbsp;
	                <img src="captcha" id="captcha-img">
	                <small><p></p></small>
	                <input type="text" class="form-control input-lg" id="captcha" name="captcha"
	                      placeholder="验证码" maxlength="4" data-error="请填写验证码" required>
	                <div class="help-block with-errors"></div>
	            </div>
	            
	            <div class="form-group">
	                <button type="submit" class="btn btn-primary">提交</button>
	            </div>
	            <a href="applyResetPassword">忘记用户名/密码</a><br>
	            <a href="userRegister">还没有帐号?点击注册</a>
	
	        </form>
	    </div>
	</div>
	
	<jsp:include page="../base/footer.jsp"></jsp:include>
	
</body>


</html>