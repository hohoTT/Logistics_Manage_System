<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- CSS 样式 -->
<link rel="stylesheet" href="static/css/shopping/style.css" media="all">
<link rel="stylesheet" href="static/css/shopping/lightbox.css" media="screen">
<link rel="stylesheet" href="static/css/shopping/responsiveslides.css">

<link rel="stylesheet" href="static/css/bootstrap/bootstrap.min.css">

<!-- JS 部分引用 -->
<script type="text/javascript" src="static/js/lib/jQuery/jquery.js"></script>
<script type="text/javascript" src="static/js/shopping/responsiveslides.min.js"></script>
<script type="text/javascript" src="static/js/shopping/jquery.lightbox.js"></script>
<script type="text/javascript" src="static/js/shopping/shopping.js"></script>

</head>
<body>

	<!--start-image-slider---->
	<div class="image-slider">
		<!-- Slideshow 1 -->
		<ul class="rslides" id="slider">
			<li><img src="image/banner/banner1.jpg" alt="">
			</li>
			<li><img src="image/banner/banner2.jpg" alt="">
			</li>
			<li><img src="image/banner/banner3.jpg" alt="">
			</li>
			<li><img src="image/banner/banner4.jpg" alt="">
			</li>
		</ul>
		<!-- Slideshow 2 -->
	</div>
	<!--End-image-slider---->
	
	<div class="wrap">

		<div class="main">
	
			<div class="section group">
				<div class="col_1_of_4 span_1_of_4">
					<a href="shopping_trolley.jsp">
						<div class="image_grid portfolio_4col">
							<ul style="" id="list" class="portfolio_list da-thumbs">
								<li><img src="image\book\html.jpg" alt="img">
								</li>
							</ul>
						</div> </a>
					<h3>有关 HTML 书籍</h3>
					<br>
					<div class="more">
						<a href="html_intent.jsp" class="button">Read More</a>
					</div>
				</div>
		
				<div class="col_1_of_4 span_1_of_4">
					<a href="java_trolley.jsp">
						<div class="image_grid portfolio_4col">
							<ul style="" id="list" class="portfolio_list da-thumbs">
								<li><img src="image\book\java.jpg" alt="img">
								</li>
							</ul>
						</div> </a>
					<h3>有关 JAVA 书籍</h3>
					<br>
					<div class="more">
						<a href="java_content.jsp" class="button">Read More</a>
					</div>
				</div>
		
				<div class="col_1_of_4 span_1_of_4">
					<a href="shopping.jsp">
						<div class="image_grid portfolio_4col">
							<ul style="" id="list" class="portfolio_list da-thumbs">
								<li><img src="image\book\js.jpg" alt="img">
								</li>
							</ul>
						</div> </a>
					<h3>有关 JavaScript 书籍</h3>
					<br>
					<p></p>
					<br>
					<div class="more">
						<a href="shopping.jsp" class="button">Read More</a>
					</div>
				</div>
		
				<div class="col_1_of_4 span_1_of_4">
					<a href="shopping.jsp">
						<div class="image_grid portfolio_4col">
							<ul style="" id="list" class="portfolio_list da-thumbs">
								<li><img src="image\book\jquery.jpg" alt="img">
								</li>
							</ul>
						</div> </a>
					<h3>有关 JQUERY 书籍</h3>
					<br>
					<div class="more">
						<a href="shopping.jsp" class="button">Read More</a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		
			<!-- The second group -->
		
			<div class="section group">
				<div class="col_1_of_4 span_1_of_4">
					<a href="shopping.jsp">
						<div class="image_grid portfolio_4col">
							<ul style="" id="list" class="portfolio_list da-thumbs">
								<li><img src="image\book\php.jpg" alt="img"></li>
							</ul>
						</div> </a>
					<h3>有关 PHP 书籍</h3>
					<br>
					<div class="more">
						<a href="shopping.jsp" class="button">Read More</a>
					</div>
				</div>
		
				<div class="col_1_of_4 span_1_of_4">
					<a href="shopping.jsp">
						<div class="image_grid portfolio_4col">
							<ul style="" id="list" class="portfolio_list da-thumbs">
								<li><img src="image\book\android.jpg" alt="img"></li>
							</ul>
						</div> </a>
					<h3>有关 ANDROID 书籍</h3>
					<br>
					<div class="more">
						<a href="shopping.jsp" class="button">Read More</a>
					</div>
				</div>
		
				<div class="col_1_of_4 span_1_of_4">
					<a href="shopping.jsp">
						<div class="image_grid portfolio_4col">
							<ul style="" id="list" class="portfolio_list da-thumbs">
								<li><img src="image\book\apple.jpg" alt="img"></li>
							</ul>
						</div> </a>
					<h3>有关 APPLE 书籍</h3>
					<br>
					<p></p>
					<br>
					<div class="more">
						<a href="shopping.jsp" class="button">Read More</a>
					</div>
				</div>
		
				<div class="col_1_of_4 span_1_of_4">
					<a href="shopping.jsp">
						<div class="image_grid portfolio_4col">
							<ul style="" id="list" class="portfolio_list da-thumbs">
								<li><img src="image\book\css.jpg" alt="img"></li>
							</ul>
						</div> </a>
					<h3>有关 CSS 书籍</h3>
					<br>
					<div class="more">
						<a href="shopping.jsp" class="button">Read More</a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			
		</div>

	</div>
	
	<jsp:include page="../base/footer.jsp"></jsp:include>
</body>
</html>