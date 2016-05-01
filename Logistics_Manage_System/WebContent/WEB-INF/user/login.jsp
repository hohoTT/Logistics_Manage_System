<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>用户登录</title>

<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.css"/>

<script type="text/javascript" src="static/js/config.js"></script>
<script type="text/javascript" src="static/js/require.js"></script>

<script type="text/javascript" src="static/js/account/login.js"></script>

<style type="text/css">

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

#login-form{
	margin-top: 50px;
}
</style>

</head>

<body>
	<a href="/Logistics_Manage_System/">
		<p id="title">物流中心</p>
		<p id="title-tail">join &nbsp;us</p>
	</a>
	
	<div id="login-form" class="container main">
	    <div class="col-md-6 col-md-offset-3">
	        <h2 class="text-center">用户登录</h2>
	
	        <form id="login-form">
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
	            
	            <div class="form-group">
	                <button type="submit" class="btn btn-primary">提交</button>
	            </div>
	            <a href="userRegister">还没有帐号?点击注册</a>
	
	        </form>
	    </div>
	</div>
		
</body>

</html>