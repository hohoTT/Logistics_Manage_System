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

<title>用户注册</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="static/css/global.css" media="all">

<link rel="stylesheet" href="static/css/bootstrap/bootstrap.min.css"/>
<link rel="stylesheet" href="static/css/bootstrap/todc-bootstrap.min.css"/>

<script type="text/javascript" src="static/js/config.js"></script>
<script type="text/javascript" src="static/js/require.js"></script>

<script type="text/javascript" src="static/js/account/register.js"></script>

</head>

<style type="text/css">

body{
	background:url("image/bg5.jpg") top center no-repeat; 
	background-size:cover;
}

#register-form{
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

#register-div{
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

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    -webkit-appearance: none !important;
    margin: 0;
}
</style>

<link rel="shortcut icon" href="image/favicon.ico" />

<body>
	<a href="/Logistics_Manage_System/">
		<p id="title">物流中心</p>
		<p id="title-tail">join &nbsp;us</p>
	</a>

	 <div id="register-div" class="container main">
        <div class="col-md-6 col-md-offset-3">
            <h2 class="text-center">用户注册</h2>

            <form id="register-form" method="post">
            
                <div class="form-group">
                    <label for="username">用户名</label>
                    <input type="text" class="form-control input-lg" id="username" name="username" placeholder="用户名" 
                    data-remote="usernameCheck" data-remote-error="该用户名已被注册！" data-error="请填写用户名" required autofocus>
                    <div class="help-block with-errors"></div>
                </div>
                
                <div class="form-group">
                    <label for="email">邮箱地址</label>
                    <input type="email" class="form-control input-lg" id="email" name="email" placeholder="邮箱地址" 
                    data-remote="emailCheck" data-remote-error="该邮箱已被注册！" data-error="请填写正确的邮箱地址" required>
                    <div class="help-block with-errors"></div>
                </div>
                
                <div class="form-group">
                    <label for="userphone">手机</label>
                    <input type="number" class="form-control input-lg" id="userphone" name="userphone" placeholder="手机号码" 
                    data-error="请填写手机号码" data-minlength="11" data-minlength-error="请添加正确的手机号码" required>
                    <div class="help-block with-errors"></div>
                </div>
                
                <div class="form-group">
                    <label for="useraddress">配送地址</label>
                    <input type="text" class="form-control input-lg" id="useraddress" name="useraddress" placeholder="配送地址" 
                    data-error="请填写配送地址" required>
                    <div class="help-block with-errors"></div>
                </div>
                
                <div class="form-group">
                    <label for="password">密码</label>
                    <input type="password" class="form-control input-lg" id="password" name="password" 
                    data-error="请填写密码" placeholder="密码" data-minlength="6" data-minlength-error="密码不得少于6位" required>
                    <div class="help-block with-errors"></div>
                </div>
                
                <div class="form-group">
                    <label for="confirm_password">确认密码</label>
                    <input type="password" class="form-control input-lg" id="confirm_password" name="confirm_password"
                           placeholder="确认密码" data-match="#password" data-match-error="两个密码不一致" data-error="请填写确认密码" required>
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
                
            </form>
        </div>
    </div>
    
    <jsp:include page="../base/footer.jsp"></jsp:include>
	
</body>

</html>
