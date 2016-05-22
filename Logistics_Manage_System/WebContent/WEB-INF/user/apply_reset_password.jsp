<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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

</head>
<body>

	<a href="/Logistics_Manage_System/">
		<p id="title">物流中心</p>
		<p id="title-tail">join &nbsp;us</p>
	</a>

	<div id="reset-div" class="container main">

        <div class="col-md-6 col-md-offset-3">
            <h2 class="text-center">找回登录信息</h2><br>
            
            <div>
                <p>请输入你注册时使用的邮箱地址，系统将自动向你的邮箱发送一封含有您登录信息的电子邮件，
                                                         你可以看到你的用户名，并可以选择重新设置登录密码，注意为了你的账户安全，重置密码链接仅在30分钟内有效
                </p>
            </div>
            
            <br>
            
            <form id="login-form">
            
                <div class="form-group">
                    <label for="email">注册电子邮件地址</label>
                    <input type="email" class="form-control input-lg" id="email" name="email" placeholder="邮箱地址"
                           data-remote="/api/email_check/?reset=true" data-remote-error="该邮箱未被注册！" data-error="请填写正确的邮箱地址"
                           required>

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