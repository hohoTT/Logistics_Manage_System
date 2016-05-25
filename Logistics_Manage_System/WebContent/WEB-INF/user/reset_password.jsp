<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>重置密码</title>

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

#reset-div{
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

<script type="text/javascript" src="static/js/account/resetPassword.js"></script>

<link rel="shortcut icon" href="image/favicon.ico" />

</head>
<body>

	<%
		String new_username = (String) session.getAttribute("new_username");
		String email = (String) session.getAttribute("email");
	%>

	<a href="/Logistics_Manage_System/">
		<p id="title">物流中心</p>
		<p id="title-tail">join &nbsp;us</p>
	</a>

	<div id="reset-div" class="container main">

        <div class="col-md-6 col-md-offset-3">
            <h2 class="text-center">重置密码</h2><br>
            <br>

            <form id="login-form">
            
                <div class="form-group">
                    <label for="email">注册电子邮件地址</label>
                    <input type="text" class="form-control input-lg" name="email" value="<%= email %>" disabled="true" readonly>
                </div>
                
                <div class="form-group">
                    <label for="username">用户名</label>
                    <input type="text" class="form-control input-lg" name="username" value="<%= new_username %>" disabled="true" readonly>
                </div>
                
                <div class="form-group">
                    <label for="new_password">新密码</label>
                    <input type="password" class="form-control input-lg" id="new_password" name="new_password"
                           placeholder="新密码" maxlength="30" data-minlength="6" data-error="密码不得少于6位" required>

                    <div class="help-block with-errors"></div>
                </div>
                
                <div class="form-group">
                    <label for="confirm_password">确认密码</label>
                    <input type="password" class="form-control input-lg" id="confirm_password" name="confirm_password"
                           placeholder="确认密码" maxlength="30" data-match="#new_password" data-error="请输入确认密码"
                           data-match-error="两次密码不一致"
                           required>

                    <div class="help-block with-errors"></div>
                </div>
                
                <div class="form-group">
                    <label for="new_password">重置密钥</label>
                    <input type="text" class="form-control input-lg" id="reset_captcha" name="reset_captcha" 
                    	   placeholder="重置密钥" maxlength="6" required>

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
                
	            <a href="userLogin">点击这里/返回登录</a>
	            
            </form>
        </div>
    </div>
    
</body>
</html>