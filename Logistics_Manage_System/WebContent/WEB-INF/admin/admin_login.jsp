<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>管理员登录</title>

<script type="text/javascript" src="static/js/config.js"></script>
<script type="text/javascript" src="static/js/require.js"></script>

<!-- The styles -->
<link id="bs-css" href="css/bootstrap-cerulean.min.css" rel="stylesheet">

<link href="css/charisma-app.css" rel="stylesheet">

<!-- 自定义CSS样式 -->
<style type="text/css">

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

h2{
	font-size: 30px;
	font-family: source_code_pro,"PingFangSC-Regular",
	"Heiti SC","Microsoft Yahei",monospace;
}

a{
	color: #428bca;
}

.ch-container{
	margin-top: 80px;
}
</style>

<script type="text/javascript" src="static/js/account/adminLogins.js"></script>

<link rel="shortcut icon" href="image/favicon.ico" />

</head>

<body>

	<a href="/Logistics_Manage_System/">
		<p id="title">物流中心</p>
		<p id="title-tail">join &nbsp;us</p>
	</a>
	
	<div class="ch-container">
	    <div class="row">
	    
	        <div class="row">
		        <div class="col-md-12 center login-header">
		            <h2>管理员登录</h2>
		        </div>
		        <!--/span-->
		    </div><!--/row-->
	
			<div class="row">
				<div class="well col-md-5 center login-box">
					<div class="alert alert-info">
						请输入管理员名称及密码
					</div>
					
			        <form class="form-horizontal" method="post">
						<fieldset>
							<div class="form-group">
								<div class="input-group input-group-lg">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user red"></i>
									</span>
									<input type="text" class="form-control" 
										   id="adminName" name="adminName" placeholder="用户名">
								</div>
								<div class="clearfix"></div><br>
							</div>
		
							<div class="form-group">
								<div class="input-group input-group-lg">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-lock red"></i>
									</span>
									<input type="password" class="form-control" 
										   id="adminPassword" name="adminPassword" placeholder="密码">
								</div>
								<div class="clearfix"></div>
								<div class="clearfix"></div>
							</div>
					
							<div class="form-group">
								<p class="center col-md-5">
									<button type="submit" class="btn btn-primary">Login</button>
								</p>
							</div>
						</fieldset>
			        </form>
			        
				</div>
				<!--/span-->
			</div><!--/row-->
			
	    </div>
	</div>
	
	<jsp:include page="../base/footer.jsp"></jsp:include>
	
</body>


</html>