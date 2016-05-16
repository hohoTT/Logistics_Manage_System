<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员界面</title>

<!-- The styles -->
<link id="bs-css" href="css/bootstrap-cerulean.min.css" rel="stylesheet">

<link href="css/charisma-app.css" rel="stylesheet">
<link href='bower_components/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
<link href='bower_components/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>
<link href='bower_components/chosen/chosen.min.css' rel='stylesheet'>
<link href='bower_components/colorbox/example3/colorbox.css' rel='stylesheet'>
<link href='bower_components/responsive-tables/responsive-tables.css' rel='stylesheet'>
<link href='bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>
<link href='css/jquery.noty.css' rel='stylesheet'>
<link href='css/noty_theme_default.css' rel='stylesheet'>
<link href='css/elfinder.min.css' rel='stylesheet'>
<link href='css/elfinder.theme.css' rel='stylesheet'>
<link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
<link href='css/uploadify.css' rel='stylesheet'>
<link href='css/animate.min.css' rel='stylesheet'>

<!-- jQuery -->
<script src="bower_components/jquery/jquery.min.js"></script>

<style type="text/css">	
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
	    -webkit-appearance: none !important;
	    margin: 0;
	}
</style>

<link rel="shortcut icon" href="image/favicon.ico" />

</head>
<body>
	
	<!-- topbar starts -->
    <div class="navbar navbar-default" role="navigation">

        <div class="navbar-inner">
        	<a class="navbar-brand" href="/Logistics_Manage_System/"> 
				<span>Back</span>
			</a>

            <!-- user dropdown starts -->
            <div class="btn-group pull-right">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs"> ${ adminName }</span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="#">Profile</a></li>
                    <li class="divider"></li>
                    <li><a href="user-exit">Logout</a></li>
                </ul>
            </div>
            <!-- user dropdown ends -->

            <!-- theme selector starts -->
            <div class="btn-group pull-right theme-container animated tada">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-tint"></i><span
                        class="hidden-sm hidden-xs">  换个样式试试 ~~</span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" id="themes">
                    <li><a data-value="classic" href="#"><i class="whitespace"></i> Classic</a></li>
                    <li><a data-value="cerulean" href="#"><i class="whitespace"></i> Cerulean</a></li>
                    <li><a data-value="cyborg" href="#"><i class="whitespace"></i> Cyborg</a></li>
                    <li><a data-value="simplex" href="#"><i class="whitespace"></i> Simplex</a></li>
                    <li><a data-value="darkly" href="#"><i class="whitespace"></i> Darkly</a></li>
                    <li><a data-value="lumen" href="#"><i class="whitespace"></i> Lumen</a></li>
                    <li><a data-value="slate" href="#"><i class="whitespace"></i> Slate</a></li>
                    <li><a data-value="spacelab" href="#"><i class="whitespace"></i> Spacelab</a></li>
                    <li><a data-value="united" href="#"><i class="whitespace"></i> United</a></li>
                </ul>
            </div>
            <!-- theme selector ends -->

        </div>
    </div>
    <!-- topbar ends -->
    
	<div class="ch-container">
	    <div class="row">
	        
	        <!-- left menu starts -->
	        <div class="col-sm-2 col-lg-2">
	            <div class="sidebar-nav">
	                <div class="nav-canvas">
	                    <div class="nav-sm nav nav-stacked">
	
	                    </div>
	                    <ul class="nav nav-pills nav-stacked main-menu">
	                        <li class="nav-header hidden-md">主要操作</li>
	                        <li><a class="ajax-link" href="adminPage">
		                        	<i class="glyphicon glyphicon-align-justify"></i>
		                        	<span> 用户信息</span>
	                        	</a>
	                        </li>
	                        <li><a class="ajax-link" href="adminFile">
		                        	<i class="glyphicon glyphicon-star"></i>
		                        	<span> 文件管理</span>
	                        	</a>
	                        </li>
	                        <li class="accordion">
	                            <a href="#"><i class="glyphicon glyphicon-plus"></i><span> Accordion Menu</span></a>
	                            <ul class="nav nav-pills nav-stacked">
	                                <li><a href="#">Child Menu 1</a></li>
	                                <li><a href="#">Child Menu 2</a></li>
	                            </ul>
	                        </li>
	                        <li><a class="ajax-link" href="calendar.html"><i class="glyphicon glyphicon-calendar"></i><span> Calendar</span></a>
	                        </li>
	                        <li class="nav-header">辅助操作</li>
	                        <li><a class="ajax-link" href="adminGallery"><i class="glyphicon glyphicon-picture"></i><span> 图片整理</span></a>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	        <!--/span-->
	        <!-- left menu ends -->
	
		<!-- 以下为用户信息的开始 -->
        <div id="content" class="col-lg-10 col-sm-10">
	
	    <div class="row">
	    <div class="box col-md-12">
	    <div class="box-inner">
	    <div class="box-header well" data-original-title="">
	        <h2><i class="glyphicon glyphicon-user"></i> 用户信息</h2>
	
	        <div class="box-icon">
	            <a href="#" class="btn btn-minimize btn-round btn-default"><i
	                    class="glyphicon glyphicon-chevron-up"></i></a>
	            <a href="#" class="btn btn-close btn-round btn-default"><i class="glyphicon glyphicon-remove"></i></a>
	        </div>
	    </div>
	    <div class="box-content">
	    <div class="alert alert-info"></a></div>
	    <table class="table table-striped table-bordered bootstrap-datatable datatable responsive">
		    <thead>
			    <tr>
			        <th>ID</th>
			        <th>用户名</th>
			        <th>邮箱</th>
			        <th>手机</th>
			        <th>地址</th>
			        <th>注册时间</th>
			        <th>用户评级</th>
			        <th>操作</th>
			    </tr>
		    </thead>
		    <tbody>
		    <s:iterator value="#session.userLists">
			    <tr>
			        <td>${ user_id }</td>
			        <td>${ user_name }</td>
			        <td class="center">${ user_email }</td>
			        <td class="center">${ user_phone }</td>
			        <td class="center">${ user_address }</td>
			        <td class="center">
			        	<s:date name="createTime" format="yyyy-MM-dd"/>
			        </td>
			        <td class="center">
			        	<s:if test="user_state == 1">
			        		<span class="label-success label label-default">优秀</span>
			        	</s:if>
			        	<s:elseif test="user_state == 2">
							<span class="label-warning label label-default">良好</span>
			        	</s:elseif>
			        	<s:else>
            				<span class="label-default label label-danger">不良</span>
			        	</s:else>
			        </td>
			        <td class="center">
			            <a class="btn btn-info" href="#">
			                <i class="glyphicon glyphicon-edit icon-white"></i>
			                Edit
			            </a>
			            <a class="btn btn-danger delete" href="user-delete?id=${ user_id }">
			                <i class="glyphicon glyphicon-trash icon-white"></i>
			                Delete
			            </a>
						<input type="hidden" value="${ user_name }"/>
			        </td>
			    </tr>
			</s:iterator>
		    </tbody>
	    </table>
	    </div>
	    </div>
	    </div>
	    <!--/span-->
	
	    </div><!--/row-->
	
	    <!-- content ends -->
	    
	    <!-- 以下为用户信息部分的结尾 -->
	    </div><!--/#content.col-md-0-->


		<!-- 以下为用户信息的修改部分 -->
		<div id="content" class="col-lg-10 col-sm-10" style="display: none;">
		<div class="row">
		<div class="box col-md-12">
  			<div class="box-inner">
   			<div class="box-header well" data-original-title="">
		        <h2><i class="glyphicon glyphicon-user"></i> 用户编辑</h2>
		
		        <div class="box-icon">
		            <a href="#" class="btn btn-minimize btn-round btn-default"><i
		                    class="glyphicon glyphicon-chevron-up"></i></a>
		            <a href="#" class="btn btn-close btn-round btn-default"><i class="glyphicon glyphicon-remove"></i></a>
		        </div>
		    </div>
		    <div class="box-content" style="text-align :center">
		    	<div class="alert alert-info"></a></div>
		    	<!-- 以下为编辑表单的部分 -->
		    	<form id="register-form" method="post">
            
                <div class="form-group">
                    <input type="text" class="form-control input-lg" id="username" name="username" placeholder="用户名" 
                    data-remote="usernameCheck" data-remote-error="该用户名已被注册！" data-error="请填写用户名" required autofocus>
                    <div class="help-block with-errors"></div>
                </div>
                
                <div class="form-group">
                    <input type="email" class="form-control input-lg" id="email" name="email" placeholder="邮箱地址" 
                    data-remote="emailCheck" data-remote-error="该邮箱已被注册！" data-error="请填写正确的邮箱地址" required>
                    <div class="help-block with-errors"></div>
                </div>
                
                <div class="form-group">
                    <input type="number" class="form-control input-lg" id="userphone" name="userphone" placeholder="手机号码" 
                    data-error="请填写手机号码" data-minlength="11" data-minlength-error="请添加正确的手机号码" required>
                    <div class="help-block with-errors"></div>
                </div>
                
                <div class="form-group">
                    <input type="text" class="form-control input-lg" id="useraddress" name="useraddress" placeholder="配送地址" 
                    data-error="请填写配送地址" required>
                    <div class="help-block with-errors"></div>
                </div>
                
                <div class="form-group">
                    <input type="password" class="form-control input-lg" id="password" name="password" 
                    data-error="请填写密码" placeholder="密码"required>
                    <div class="help-block with-errors"></div>
                </div>
                
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">提交</button>
                </div>
                
            </form>
		    </div>
  			</div>
   		</div>
		</div>
		</div>
	    
		</div><!--/fluid-row-->
		
	    <hr>
		
	</div><!--/.fluid-container-->
	
	
	<jsp:include page="../base/footer.jsp"></jsp:include>

<!-- external javascript -->

<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- library for cookie management -->
<script src="js/jquery.cookie.js"></script>
<!-- calender plugin -->
<script src='bower_components/moment/min/moment.min.js'></script>
<script src='bower_components/fullcalendar/dist/fullcalendar.min.js'></script>
<!-- data table plugin -->
<script src='js/jquery.dataTables.min.js'></script>

<!-- select or dropdown enhancer -->
<script src="bower_components/chosen/chosen.jquery.min.js"></script>
<!-- plugin for gallery image view -->
<script src="bower_components/colorbox/jquery.colorbox-min.js"></script>
<!-- notification plugin -->
<script src="js/jquery.noty.js"></script>
<!-- library for making tables responsive -->
<script src="bower_components/responsive-tables/responsive-tables.js"></script>
<!-- tour plugin -->
<script src="bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
<!-- star rating plugin -->
<script src="js/jquery.raty.min.js"></script>
<!-- for iOS style toggle switch -->
<script src="js/jquery.iphone.toggle.js"></script>
<!-- autogrowing textarea plugin -->
<script src="js/jquery.autogrow-textarea.js"></script>
<!-- multiple file upload plugin -->
<script src="js/jquery.uploadify-3.1.min.js"></script>
<!-- history.js for cross-browser state change on ajax -->
<script src="js/jquery.history.js"></script>
<!-- application script for Charisma demo -->
<script src="js/charisma.js"></script>

<script type="text/javascript" src="static/js/config.js"></script>
<script type="text/javascript" src="static/js/require.js"></script>

<script type="text/javascript" src="static/js/admin/manage/user_delete.js"></script>

</body>
</html>