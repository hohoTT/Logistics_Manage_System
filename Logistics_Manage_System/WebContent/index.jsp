<%@ page language="java" import="java.util.*" 
contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>物流配送管理系统</title>


<!-- CSS 样式 -->
<link rel="stylesheet" href="static/css/shopping/style3.css" media="all">

<!-- CSS 样式部分引用 -->
<link rel="stylesheet" href="static/css/global.css" media="all">
<link rel="stylesheet" href="static/css/bootstrap/bootstrap.min.css">

<!-- JS 部分引用 -->
<script type="text/javascript" src="static/js/lib/jQuery/jquery.js"></script>
<script type="text/javascript" src="static/js/carousel.js"></script>

<link rel="shortcut icon" href="image/favicon.ico" />

</head>
<body>
	<div id="carousel-generic" class="carousel slide" data-ride="carousel"
		data-interval="3000">
		<!-- Wrapper for slides -->
		<div id="carousel" class="carousel-inner">
			<div class="item active">
				<img src="image/bg1.jpg" alt="...">
				<div class="carousel-caption">
					<jsp:include page="WEB-INF/base/index_content.jsp"></jsp:include>
					<h1>物流配送管理系统</h1>
					<p>
						<button class="btn btn-success btn-lg">WANG</button>
					</p>
				</div>
			</div>
			<div class="item">
				<img src="image/bg2.jpg" alt="...">
				<div class="carousel-caption">
					<jsp:include page="WEB-INF/base/index_content.jsp"></jsp:include>
					<h1>物流配送管理系统</h1>
					<p>
						<button class="btn btn-success btn-lg">WANG</button>
					</p>
				</div>
			</div>
			<div class="item">
				<img src="image/bg3.jpg" alt="...">
				<div class="carousel-caption">
					<jsp:include page="WEB-INF/base/index_content.jsp"></jsp:include>
					<h1>物流配送管理系统</h1>
					<p>
						<button class="btn btn-success btn-lg">WANG</button>
					</p>
				</div>
			</div>
			<div class="item">
				<img src="image/bg4.jpg" alt="...">
				<div class="carousel-caption">
					<jsp:include page="WEB-INF/base/index_content.jsp"></jsp:include>
					<h1>物流配送管理系统</h1>
					<p>
						<button class="btn btn-success btn-lg">WANG</button>
					</p>
				</div>
			</div>
			<div class="item">
				<img src="image/bg5.jpg" alt="...">
				<div class="carousel-caption">
					<jsp:include page="WEB-INF/base/index_content.jsp"></jsp:include>
					<h1>物流配送管理系统</h1>
					<p>
						<button class="btn btn-success btn-lg">WANG</button>
					</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 以下为链接部分 -->
	<div class="header-bottom-grids text-center">
		<a href="adminPage">
			<div class="header-bottom-grid1">
				<span class="glyphicon glyphicon-leaf"></span>					
				<h4>管理中心</h4>
			</div>
		</a>
		
		<a href="userShopping">
			<div class="header-bottom-grid2">
				<span class="glyphicon glyphicon-certificate"></span>
				<h4>商城</h4>
			</div>
		</a>
		
		<a href="userShoppingInfo">
			<div class="header-bottom-grid3">
				<span class="glyphicon glyphicon-tree-deciduous"></span>
				<h4>我的购物车</h4>
			</div>
		</a>
		
		<a href="userLogisticsInfo">
			<div class="header-bottom-grid4">
				<span class="glyphicon glyphicon-screenshot"></span>
				<h4>订单配送中心</h4>
			</div>
		</a>
		<div class="clearfix"></div>
	</div>

</body>
	<jsp:include page="WEB-INF/base/footer.jsp"></jsp:include>
</html>