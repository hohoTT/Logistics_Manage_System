<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书城</title>

<!-- CSS 样式 -->
<link rel="stylesheet" href="static/css/shopping/style.css" media="all">
<link rel="stylesheet" href="static/css/shopping/lightbox.css" media="screen">
<link rel="stylesheet" href="static/css/shopping/responsiveslides.css">

<link rel="stylesheet" href="static/css/bootstrap/bootstrap.min.css">

<!-- JS 部分引用 -->
<script type="text/javascript" src="static/js/lib/jQuery/jquery.js"></script>

<script type="text/javascript" src="static/js/lib/bootstrap/bootstrap.min.js"></script>

<script type="text/javascript" src="static/js/shopping/responsiveslides.min.js"></script>
<script type="text/javascript" src="static/js/shopping/jquery.lightbox.js"></script>
<script type="text/javascript" src="static/js/shopping/shopping.js"></script>

<style>
.actGotop{position:fixed; _position:absolute; bottom:100px; right:50px; width:150px; height:195px; display:none;}
.actGotop a,.actGotop a:link{width:150px; height:195px; display:inline-block; background:url(image/backToTop/blog7year_gotop.png) no-repeat; _background:url(image/backToTop/blog7year_gotop.gif) no-repeat; outline:none;}
.actGotop a:hover{width:150px; height:195px; background:url(image/backToTop/blog7year_gotopd.gif) no-repeat; outline:none;}
</style>

<link rel="shortcut icon" href="image/favicon.ico" />

</head>
<body>
	
	<jsp:include page="../base/nav_content.jsp"></jsp:include>

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
					<a href="htmlBuy">
						<div class="image_grid portfolio_4col">
							<ul style="" id="list" class="portfolio_list da-thumbs">
								<li><img src="image\book\html.jpg" alt="img">
								</li>
							</ul>
						</div> </a>
					<h3>有关 HTML 书籍</h3>
					<br>
					<div class="more">
						<a href="htmlMore" class="button">Read More</a>
					</div>
				</div>
		
				<div class="col_1_of_4 span_1_of_4">
					<a href="javaBuy">
						<div class="image_grid portfolio_4col">
							<ul style="" id="list" class="portfolio_list da-thumbs">
								<li><img src="image\book\java.jpg" alt="img">
								</li>
							</ul>
						</div> </a>
					<h3>有关 JAVA 书籍</h3>
					<br>
					<div class="more">
						<a href="htmlMore" class="button">Read More</a>
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
						<a href="htmlMore" class="button">Read More</a>
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
						<a href="htmlMore" class="button">Read More</a>
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
						<a href="htmlMore" class="button">Read More</a>
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
						<a href="htmlMore" class="button">Read More</a>
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
						<a href="htmlMore" class="button">Read More</a>
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
						<a href="htmlMore" class="button">Read More</a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			
		</div>

	</div>
	
	<!-- backToTop -->
	<div style="position:fixed; top:50px; left:0px; width:100%;">
	</div>
	<div class="actGotop"><a href="javascript:;" title="Top"></a></div>
	
	<script type="text/javascript">
	$(function(){	
		$(window).scroll(function() {		
			if($(window).scrollTop() >= 100){
				$('.actGotop').fadeIn(300); 
			}else{    
				$('.actGotop').fadeOut(300);    
			}  
		});
		$('.actGotop').click(function(){$('html,body').animate({scrollTop: '0px'}, 800);});	
	});
	</script>
	
	<jsp:include page="../base/footer.jsp"></jsp:include>
</body>
</html>