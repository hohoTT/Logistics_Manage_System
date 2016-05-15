<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HTML 更多介绍</title>

<!-- CSS 样式 -->
<link rel="stylesheet" href="static/css/shopping/style.css" media="all">
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="static/css/bootstrap/bootstrap.min.css">

<!-- JS -->
<script type="text/javascript">
	var video;
	var copy;
	var copycanvas;
	var draw;
	
	var TILE_WIDTH = 32;
	var TILE_HEIGHT = 24;
	var TILE_CENTER_WIDTH = 16;
	var TILE_CENTER_HEIGHT = 12;
	var SOURCERECT = {x:0, y:0, width:0, height:0};
	var PAINTRECT = {x:0, y:0, width:1000, height:700};
	
	function init(){
		video = document.getElementById('sourcevid');
		copycanvas = document.getElementById('sourcecopy');
		copy = copycanvas.getContext('2d');
		var outputcanvas = document.getElementById('output');
		draw = outputcanvas.getContext('2d');
		setInterval("processFrame()", 33);
	}
	function createTiles(){
		var offsetX = TILE_CENTER_WIDTH+(PAINTRECT.width-SOURCERECT.width)/2;
		var offsetY = TILE_CENTER_HEIGHT+(PAINTRECT.height-SOURCERECT.height)/2;
		var y=0;
		while(y < SOURCERECT.height){
			var x=0;
			while(x < SOURCERECT.width){
				var tile = new Tile();
				tile.videoX = x;
				tile.videoY = y;
				tile.originX = offsetX+x;
				tile.originY = offsetY+y;
				tile.currentX = tile.originX;
				tile.currentY = tile.originY;
				tiles.push(tile);
				x+=TILE_WIDTH;
			}
			y+=TILE_HEIGHT;
		}
	}
	
	var RAD = Math.PI/180;
	var randomJump = false;
	var tiles = [];
	var debug = false;
	function processFrame(){
		if(!isNaN(video.duration)){
			if(SOURCERECT.width == 0){
				SOURCERECT = {x:0,y:0,width:video.videoWidth,height:video.videoHeight};
				createTiles();
			}
			//this is to keep my sanity while developing
			if(randomJump){
				randomJump = false;
				video.currentTime = Math.random()*video.duration;
			}
			//loop
			if(video.currentTime == video.duration){
				video.currentTime = 0;
			}
		}
		var debugStr = "";
		//copy tiles
		copy.drawImage(video, 0, 0);
		draw.clearRect(PAINTRECT.x, PAINTRECT.y,PAINTRECT.width,PAINTRECT.height);
		
		for(var i=0; i<tiles.length; i++){
			var tile = tiles[i];
			if(tile.force > 0.0001){
				//expand
				tile.moveX *= tile.force;
				tile.moveY *= tile.force;
				tile.moveRotation *= tile.force;
				tile.currentX += tile.moveX;
				tile.currentY += tile.moveY;
				tile.rotation += tile.moveRotation;
				tile.rotation %= 360;
				tile.force *= 0.9;
				if(tile.currentX <= 0 || tile.currentX >= PAINTRECT.width){
					tile.moveX *= -1;
				}
				if(tile.currentY <= 0 || tile.currentY >= PAINTRECT.height){
					tile.moveY *= -1;
				}
			}else if(tile.rotation != 0 || tile.currentX != tile.originX || tile.currentY != tile.originY){
				//contract
				var diffx = (tile.originX-tile.currentX)*0.2;
				var diffy = (tile.originY-tile.currentY)*0.2;
				var diffRot = (0-tile.rotation)*0.2;
				
				if(Math.abs(diffx) < 0.5){
					tile.currentX = tile.originX;
				}else{
					tile.currentX += diffx;
				}
				if(Math.abs(diffy) < 0.5){
					tile.currentY = tile.originY;
				}else{
					tile.currentY += diffy;
				}
				if(Math.abs(diffRot) < 0.5){
					tile.rotation = 0;
				}else{
					tile.rotation += diffRot;
				}
			}else{
				tile.force = 0;
			}
			draw.save();
			draw.translate(tile.currentX, tile.currentY);
			draw.rotate(tile.rotation*RAD);
			draw.drawImage(copycanvas, tile.videoX, tile.videoY, TILE_WIDTH, TILE_HEIGHT, -TILE_CENTER_WIDTH, -TILE_CENTER_HEIGHT, TILE_WIDTH, TILE_HEIGHT);
			draw.restore();
		}
		if(debug){
			debug = false;
			document.getElementById('trace').innerHTML = debugStr;
		}
	}
	
	function explode(x, y){
		for(var i=0; i<tiles.length; i++){
			var tile = tiles[i];
			
			var xdiff = tile.currentX-x;
			var ydiff = tile.currentY-y;
			var dist = Math.sqrt(xdiff*xdiff + ydiff*ydiff);
			
			var randRange = 220+(Math.random()*30);
			var range = randRange-dist;
			var force = 3*(range/randRange);
			if(force > tile.force){
				tile.force = force;
				var radians = Math.atan2(ydiff, xdiff);
				tile.moveX = Math.cos(radians);
				tile.moveY = Math.sin(radians);
				tile.moveRotation = 0.5-Math.random();
			}
		}
		tiles.sort(zindexSort);
		processFrame();
	}
	function zindexSort(a, b){
		return (a.force-b.force);
	}
	
	function dropBomb(evt, obj){
		var posx = 0;
		var posy = 0;
		var e = evt || window.event;
		if (e.pageX || e.pageY){
			posx = e.pageX;
			posy = e.pageY;
		}else if (e.clientX || e.clientY) {
			posx = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
			posy = e.clientY + document.body.scrollTop + document.documentElement.scrollTop;
		}
		var canvasX = posx-obj.offsetLeft;
		var canvasY = posy-obj.offsetTop;
		explode(canvasX, canvasY);
	}
	
	function Tile(){
		this.originX = 0;
		this.originY = 0;
		this.currentX = 0;
		this.currentY = 0;
		this.rotation = 0;
		this.force = 0;
		this.z = 0;
		this.moveX= 0;
		this.moveY= 0;
		this.moveRotation = 0;
		
		this.videoX = 0;
		this.videoY = 0;
	}
	
	
	/*
		getPixel
		return pixel object {r,g,b,a}
	*/
	function getPixel(imageData, x, y){
		var data = imageData.data;
		var pos = (x + y * imageData.width) * 4;
		return {r:data[pos], g:data[pos+1], b:data[pos+2], a:data[pos+3]}
	}
	/*
		setPixel
		set pixel object {r,g,b,a}
	*/
	function setPixel(imageData, x, y, pixel){
		var data = imageData.data;
		var pos = (x + y * imageData.width) * 4;
		data[pos] = pixel.r;
		data[pos+1] = pixel.g;
		data[pos+2] = pixel.b;
		data[pos+3] = pixel.a;
	}
	/*
		copyPixel
		faster then using getPixel/setPixel combo
	*/
	function copyPixel(sImageData, sx, sy, dImageData, dx, dy){
		var spos = (sx + sy * sImageData.width) * 4;
		var dpos = (dx + dy * dImageData.width) * 4;
		dImageData.data[dpos] = sImageData.data[spos];     //R
		dImageData.data[dpos+1] = sImageData.data[spos+1]; //G
		dImageData.data[dpos+2] = sImageData.data[spos+2]; //B
		dImageData.data[dpos+3] = sImageData.data[spos+3]; //A
	}

</script>
   
<style>
body{
	background: #78D1FB;
}

.brand img{
    width:100px;
    height:100px;
    float:left;
    padding: 10px;
}
</style>

<link rel="shortcut icon" href="image/favicon.ico" />

</head>
<body onload="init()">

	<jsp:include page="../base/nav_content.jsp"></jsp:include>
	

	<div class="wrap" align="center">
		<div style="display:none" >
			<video   width="600px" id="sourcevid" controls   autoplay loop >
				<source  src="video/MIUI.mp4" type="video/mp4"/>

			</video>
			<canvas id="sourcecopy" width="800" height="600"></canvas>
		</div>
     </div>
     
    <canvas id="output" width="1000" height="600" 
		onmousedown="dropBomb(event, this)" style="border: 1px none">
	</canvas>
	
	<div id="content">
		<p>超文本标记语言，标准通用标记语言下的一个应用。</p>
		<p>“超文本”就是指页面内可以包含图片、链接，甚至音乐、程序等非文字元素。</p>
		<P>超文本标记语言的结构包括“头”部分（英语：Head）、和“主体”部分（英语：Body），
		        其中“头”部提供关于网页的信息，“主体”部分提供网页的具体内容。</P>
		<P>网页的本质就是超级文本标记语言，通过结合使用其他的Web技术（如：脚本语言、
		公共网关接口、组件等），可以创造出功能强大的网页。</p>
		<P>因而，超级文本标记语言是万维网
		（Web）编程的基础，也就是说万维网是建立在超文本基础之上的。超级文本标记语言之所以
		称为超文本标记语言，</p>
		<p>是因为文本中包含了所谓“超级链接”点。</P>
	</div>

	<jsp:include page="../base/footer.jsp"></jsp:include>
</body>
</html>