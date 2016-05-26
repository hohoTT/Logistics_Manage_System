<%@page import="java.util.ArrayList"%>
<%@page import="com.wt.entity.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单配送中心</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/grayscale.css" rel="stylesheet">

<link rel="shortcut icon" href="image/favicon.ico" />

 <!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

<style type="text/css">
	td {
		color: black;
	}
</style>

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

    <!-- Navigation -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">
                    <i class="fa fa-play-circle"></i>  <span class="light">订单配送</span> 中心
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#Pending">待揽件</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#transport">运输</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#send">派送</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#sign">签收</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="/Logistics_Manage_System/">物流中心</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Intro Header -->
    <header class="intro">
        <div class="intro-body">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <h1 class="brand-heading">订单配送中心</h1>
                        <p class="intro-text">订单详情下拉或点击下方按钮可见 ~</p>
                        <a href="#Pending" class="btn btn-circle page-scroll">
                            <i class="fa fa-angle-double-down animated"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Pending Section -->
    <section id="Pending" class="container content-section text-center">
        <div class="download-section">
            <div class="container">
                <div class="col-lg-8 col-lg-offset-2">
                    <h2>待揽件</h2>
                    <s:if test="#session.pendingBooks.size() != 0">
						<table class="table table-striped">
							<thead>
							    <tr>
							        <th>ID</th>
							        <th>书名</th>
							        <th>数量</th>
							        <th>价格</th>
							    </tr>
						    </thead>
						    <tbody>
						    <s:iterator value="#session.pendingBooks">
							    <tr>
							        <td class="info">${ book_id }</td>
							        <td class="success">${ book_name }</td>
							        <td class="warning">${ quantity }</td>
							        <td class="danger">${ price }</td>
							    </tr>
							</s:iterator>
						    </tbody>
						</table>
					</s:if>
					<s:else>
						目前还没有待揽件的货物 ~~
					</s:else>
                </div>
            </div>
        </div>
    </section>

    <!-- transport Section -->
    <section id="transport" class="container content-section text-center">
        <div class="download-section">
            <div class="container">
                <div class="col-lg-8 col-lg-offset-2">
                    <h2>运输</h2>
                    <s:if test="#session.transportBooks.size() != 0">
                    	<table class="table table-striped">
						<thead>
						    <tr>
						        <th>ID</th>
						        <th>书名</th>
						        <th>数量</th>
						        <th>价格</th>
						    </tr>
					    </thead>
					    <tbody>
					    <s:iterator value="#session.transportBooks">
						    <tr>
						        <td class="info">${ book_id }</td>
						        <td class="success">${ book_name }</td>
						        <td class="warning">${ quantity }</td>
						        <td class="danger">${ price }</td>
						    </tr>
						</s:iterator>
					    </tbody>
					</table>
					</s:if>
					<s:else>
						目前还没有正在运输的货物 ~~
					</s:else>
                </div>
            </div>
        </div>
    </section>

    <!-- Send Section -->
    <section id="send" class="container content-section text-center">
        <div class="download-section">
            <div class="container">
                <div class="col-lg-8 col-lg-offset-2">
                    <h2>正在派送中</h2>
                    <s:if test="#session.sendBooks.size() != 0">
                    	<table class="table table-striped">
						<thead>
						    <tr>
						        <th>ID</th>
						        <th>书名</th>
						        <th>数量</th>
						        <th>价格</th>
						    </tr>
					    </thead>
					    <tbody>
					    <s:iterator value="#session.sendBooks">
						    <tr>
						        <td class="info">${ book_id }</td>
						        <td class="success">${ book_name }</td>
						        <td class="warning">${ quantity }</td>
						        <td class="danger">${ price }</td>
						    </tr>
						</s:iterator>
					    </tbody>
					</table>
					</s:if>
					<s:else>
						目前还没有正在派送中的货物 ~~
					</s:else>
                </div>
            </div>
        </div>
    </section>
	
	<!-- Sign Section -->
    <section id="sign" class="container content-section text-center">
        <div class="download-section">
            <div class="container">
                <div class="col-lg-8 col-lg-offset-2">
                    <h2>已签收的货物 </h2>
                    <s:if test="#session.signBooks.size() != 0">
                    	<table class="table table-striped">
						<thead>
						    <tr>
						        <th>ID</th>
						        <th>书名</th>
						        <th>数量</th>
						        <th>价格</th>
						    </tr>
					    </thead>
					    <tbody>
					    <s:iterator value="#session.signBooks">
						    <tr>
						        <td class="info">${ book_id }</td>
						        <td class="success">${ book_name }</td>
						        <td class="warning">${ quantity }</td>
						        <td class="danger">${ price }</td>
						    </tr>
						</s:iterator>
					    </tbody>
					</table>
					</s:if>
					<s:else>
						目前还没有已签收的货物 ~~
					</s:else>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container text-center">
            <p>Copyright © 2016 &nbsp; 王涛 &nbsp; Team WANG</p>
        </div>
    </footer>
	
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>

    <!-- Google Maps API Key - Use your own API key to enable the map feature. More information on the Google Maps API can be found at https://developers.google.com/maps/ -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRngKslUGJTlibkQ3FkfTxj3Xss1UlZDA&sensor=false"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/grayscale.js"></script>
</body>
</html>