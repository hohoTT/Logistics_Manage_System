<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>用户登录</title>

<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.css"/>
<link rel="stylesheet" href="dist/css/bootstrapValidator.css"/>

<script type="text/javascript" src="vendor/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="dist/js/bootstrapValidator.js"></script>

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

#login-form{
	margin-top: 50px;
}
</style>

</head>

<body>
	<a href="/Logistics_Manage_System/">
		<p id="title">Swim_Bar</p>
		<p id="title-tail">join &nbsp;us</p>
	</a>
	<div id="login-form" class="container main">
		<div class="col-md-6 col-md-offset-3">
			<h2 class="text-center">用户登录</h2>
	
			<form id="login-form" action="servlet/UserServlet" method="post">
				<div class="form-group">
					<label for="username">用户名</label> <input type="text"
						class="form-control input-lg" id="username" name="username"
						maxlength="30" placeholder="用户名" autofocus required>
	
					<div class="help-block with-errors"></div>
				</div>
				<div class="form-group">
					<label for="password">密码</label> <input type="password"
						class="form-control input-lg" id="password" name="password"
						maxlength="30" placeholder="密码" required>
	
					<div class="help-block with-errors"></div>
				</div>
				<div class="form-group" id="captcha-area"></div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary">提交</button>
				</div>
				<a href="userRegister">还没有帐号?点击注册</a> <input type="hidden"
					name="action" value="login">
			</form>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
		    $('#login-form')
		        .bootstrapValidator({
		            message: 'This value is not valid',
		            feedbackIcons: {
		                valid: 'glyphicon glyphicon-ok',
		                invalid: 'glyphicon glyphicon-remove',
		                validating: 'glyphicon glyphicon-refresh'
		            },
		            fields: {
		                username: {
		                    message: 'The username is not valid',
		                    validators: {
		                        notEmpty: {
		                            message: 'The username is required and can\'t be empty'
		                        },
		                        stringLength: {
		                            min: 6,
		                            max: 30,
		                            message: 'The username must be more than 6 and less than 30 characters long'
		                        },
		                        /*remote: {
		                            url: 'remote.php',
		                            message: 'The username is not available'
		                        },*/
		                        regexp: {
		                            regexp: /^[a-zA-Z0-9_\.]+$/,
		                            message: 'The username can only consist of alphabetical, number, dot and underscore'
		                        }
		                    }
		                },
		                password: {
		                    validators: {
		                        notEmpty: {
		                            message: 'The password is required and can\'t be empty'
		                        }
		                    }
		                }
		            }
		        })
		        .on('success.form.bv', function(e) {
		            // Prevent form submission
		            e.preventDefault();
		
		            // Get the form instance
		            var $form = $(e.target);
		
		            // Get the BootstrapValidator instance
		            var bv = $form.data('bootstrapValidator');
		
		            // Use Ajax to submit form data
		            $.post($form.attr('action'), $form.serialize(), function(result) {
		                console.log(result);
		            }, 'json');
		        });
		});
	</script>

</body>

</html>