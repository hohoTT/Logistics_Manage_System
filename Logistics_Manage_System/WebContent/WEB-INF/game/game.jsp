<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>娱乐一下</title>

<!-- JS 引入部分 -->
<script type="text/javascript" src="static/js/game/jquery-1.8.3.js"></script>
<script type="text/javascript" src="static/js/game/main2048.js"></script>
<script type="text/javascript" src="static/js/game/showanimation2048.js"></script>
<script type="text/javascript" src="static/js/game/support2048.js"></script>

<script type="text/javascript" src="static/js/lib/bootstrap/bootstrap.min.js"></script>

<!-- CSS 引入部分 -->
<link rel="stylesheet" href="static/css/shopping/lightbox.css" media="screen">
<link rel="stylesheet" href="static/css/shopping/responsiveslides.css">

<link rel="stylesheet" href="static/css/bootstrap/bootstrap.min.css">

<link rel="shortcut icon" href="image/favicon.ico" />

</head>
<body>

<jsp:include page="../base/nav_content.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="static/css/game/2048.css">

<header>
	<h1>2048</h1>
	<a href="javascript:newgame()" id="newgame">新游戏</a>
	<br><br>
	<p>
		分数:<span id="score">0</span>
	</p>
	</header>
	
	<div id="grid-container" style="width: 500px; height: 500px;">
		<div class="grid-cell" id="grid-cell-0-0"></div>
		<div class="grid-cell" id="grid-cell-0-1"></div>
		<div class="grid-cell" id="grid-cell-0-2"></div>
		<div class="grid-cell" id="grid-cell-0-3"></div>

		<div class="grid-cell" id="grid-cell-1-0"></div>
		<div class="grid-cell" id="grid-cell-1-1"></div>
		<div class="grid-cell" id="grid-cell-1-2"></div>
		<div class="grid-cell" id="grid-cell-1-3"></div>

		<div class="grid-cell" id="grid-cell-2-0"></div>
		<div class="grid-cell" id="grid-cell-2-1"></div>
		<div class="grid-cell" id="grid-cell-2-2"></div>
		<div class="grid-cell" id="grid-cell-2-3"></div>

		<div class="grid-cell" id="grid-cell-3-0"></div>
		<div class="grid-cell" id="grid-cell-3-1"></div>
		<div class="grid-cell" id="grid-cell-3-2"></div>
		<div class="grid-cell" id="grid-cell-3-3"></div>
		<div class="dialog-success">
			<div class="success">恭喜您完成2048</div>
			<div>
				<a href="javascript:again()" id="newgame">重新开始</a>
			</div>
			<div>
				<a href="javascript:conti()" id="continue">继续挑战</a>
			</div>
		</div>
		<div class="dialog-fail">
			<div class="fail">很遗憾您失败了</div>
			<div>
				<a href="javascript:again()" id="newgame">重新开始</a>
			</div>
		</div>
	</div>
	
	<br><br>
	
	<div class="wrap">
		<div id="game-div" style="width: 500px; height: 400px">
			<h2>游戏列表</h2>
		</div>
	</div>

	<jsp:include page="../base/footer.jsp"></jsp:include>
</body>
</html>