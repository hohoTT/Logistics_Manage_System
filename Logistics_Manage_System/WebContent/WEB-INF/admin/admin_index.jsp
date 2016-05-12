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
	                        <li class="nav-header">Main</li>
	                        <li><a class="ajax-link" href="gallery.html"><i class="glyphicon glyphicon-picture"></i><span> Gallery</span></a>
	                        </li>
	                        <li class="nav-header hidden-md">Sample Section</li>
	                        <li><a class="ajax-link" href="adminPage"><i
	                                    class="glyphicon glyphicon-align-justify"></i><span> 用户信息</span></a></li>
	                        <li class="accordion">
	                            <a href="#"><i class="glyphicon glyphicon-plus"></i><span> Accordion Menu</span></a>
	                            <ul class="nav nav-pills nav-stacked">
	                                <li><a href="#">Child Menu 1</a></li>
	                                <li><a href="#">Child Menu 2</a></li>
	                            </ul>
	                        </li>
	                        <li><a class="ajax-link" href="calendar.html"><i class="glyphicon glyphicon-calendar"></i><span> Calendar</span></a>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	        <!--/span-->
	        <!-- left menu ends -->
	
        <noscript>
            <div class="alert alert-block col-md-12">
                <h4 class="alert-heading">Warning!</h4>

                <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a>
                    enabled to use this site.</p>
            </div>
        </noscript>
	
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
			        <th>用户名</th>
			        <th>邮箱</th>
			        <th>手机</th>
			        <th>地址</th>
			        <th>注册时间</th>
			        <th>状态</th>
			        <th>操作</th>
			    </tr>
		    </thead>
		    <tbody>
		    <s:iterator value="#session.userLists">
			    <tr>
			        <td>${ user_name }</td>
			        <td class="center">${ user_email }</td>
			        <td class="center">${ user_phone }</td>
			        <td class="center">${ user_address }</td>
			        <td class="center">
			        	<s:date name="createTime" format="yyyy-MM-dd"/>
			        </td>
			        <td class="center">
			        	1
			        </td>
			        <td class="center">
			            <a class="btn btn-info" href="#">
			                <i class="glyphicon glyphicon-edit icon-white"></i>
			                Edit
			            </a>
			            <a class="btn btn-danger" href="#">
			                <i class="glyphicon glyphicon-trash icon-white"></i>
			                Delete
			            </a>
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
	    </div><!--/#content.col-md-0-->
		</div><!--/fluid-row-->
		
	    <hr>
		
	</div><!--/.fluid-container-->

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


</body>
</html>