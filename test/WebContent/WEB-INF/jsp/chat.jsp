<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>网络聊天室-www.zixue7.com</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="网络聊天室">
		<meta http-equiv="description" content="网络聊天室">

		<script type="text/javascript"
			src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/chat.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/color.js"></script>
		<style type="text/css">
html,body {
	margin: 0;
	padding: 0;
	border: 0;
	background-color:#000;
	font-family:"microsoft yahei";
	background:url(<%=basePath%>images/bg1.jpg) no-repeat;
}
#sendbox {
	width: 550px;
	height: 40px;
	font-size: 14px;
	line-height: 40px;
	border: 1px solid #ddd;
	padding-left: 10px;
	background:#666;
	border:0;
	color:#fff;
}
#colorselect{
	width:100px; height:40px; background:#ffffff;float:left;border:0;
}

#sendbtn {
	width: 150px;
	height: 40px;
	float:right;
	background:#999;
	border:0;
}

#body {
	text-align: center;
}

#content {
	margin: 50 auto;
	width: 1000px;
}

#msg {
	width: 800px;
	height: 500px;
	float: left;
}

#list {
	width: 200px;
	height: 500px;
	float: right;
	background-color: #373737;
	overflow-y: scroll;
	overflow-x: hidden;
}

#list .user {
	padding-left: 20px;
	height: 30px;
	line-height: 30px;
	background: url(<%=basePath%>js/headpic.png) no-repeat;
	cursor: pointer;
}

#list .user:hover {
	background-color: #373737;
}

.nick {
	color: #eee;
}

.time {
	color: #aaa;
}

.msg {
	font-size: 16px;
	width:780px;
	float:left;
}

#msgbox {
	
	width: 800px;
	height: 500px;
	overflow: hidden;
	background-color:#242424;
	position:relative;
}

#message {
	position:absolute;
	left:0;
	bottom:0px;
	width: 780px;
	margin:10px;
	min-height: 500px;
	word-break: break-all;
	float: left;
	
	background-color:#242424;
}

.colorpicker{width:356px;height:176px;overflow:hidden;position:absolute;background:url(images/colorpicker_background.png);font-family:Arial, Helvetica, sans-serif;display:none;}
.colorpicker_color{width:150px;height:150px;left:14px;top:13px;position:absolute;background:#f00;overflow:hidden;cursor:crosshair;}
.colorpicker_color div{position:absolute;top:0;left:0;width:150px;height:150px;background:url(images/colorpicker_overlay.png);}
.colorpicker_color div div{position:absolute;top:0;left:0;width:11px;height:11px;overflow:hidden;background:url(images/colorpicker_select.png);margin:-5px 0 0 -5px;}
.colorpicker_hue{position:absolute;top:13px;left:171px;width:35px;height:150px;cursor:n-resize;}
.colorpicker_hue div{position:absolute;width:35px;height:9px;overflow:hidden;background:url(images/colorpicker_indic.gif) left top;margin:-4px 0 0 0;left:0px;}
.colorpicker_new_color{position:absolute;width:60px;height:30px;left:213px;top:13px;background:#f00;}
.colorpicker_current_color{position:absolute;width:60px;height:30px;left:283px;top:13px;background:#f00;}
.colorpicker input{background-color:transparent;border:1px solid transparent;position:absolute;font-size:10px;font-family:Arial, Helvetica, sans-serif;color:#898989;top:4px;right:11px;text-align:right;margin:0;padding:0;height:11px;}
.colorpicker_hex{position:absolute;width:72px;height:22px;background:url(images/colorpicker_hex.png) top;left:212px;top:142px;}
.colorpicker_hex input{right:6px;}
.colorpicker_field{height:22px;width:62px;background-position:top;position:absolute;}
.colorpicker_field span{position:absolute;width:12px;height:22px;overflow:hidden;top:0;right:0;cursor:n-resize;}
.colorpicker_rgb_r{background-image:url(images/colorpicker_rgb_r.png);top:52px;left:212px;}
.colorpicker_rgb_g{background-image:url(images/colorpicker_rgb_g.png);top:82px;left:212px;}
.colorpicker_rgb_b{background-image:url(images/colorpicker_rgb_b.png);top:112px;left:212px;}
.colorpicker_hsb_h{background-image:url(images/colorpicker_hsb_h.png);top:52px;left:282px;}
.colorpicker_hsb_s{background-image:url(images/colorpicker_hsb_s.png);top:82px;left:282px;}
.colorpicker_hsb_b{background-image:url(images/colorpicker_hsb_b.png);top:112px;left:282px;}
.colorpicker_submit{position:absolute;width:51px;height:22px;background:url(images/colorpicker_submit.png) top;left:293px;top:142px;overflow:hidden;cursor:pointer;}
.colorpicker_focus{background-position:center;}
.colorpicker_hex.colorpicker_focus{background-position:bottom;}
.colorpicker_submit.colorpicker_focus{background-position:bottom;}
.colorpicker_slider{background-position:bottom;}
/* colorpicker ie6 hack */
.colorpicker_color div{_background:none;_filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/colorpicker_overlay.png',sizingMethod='crop');}
.colorpicker_color div div{_background:none;_filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/colorpicker_select.png',sizingMethod='crop');}
</style>
	</head>

	<body>
		<a id="exit" href="logout.do?hash=${hash}">退出</a>
		<div id="content">

			<div id="msg">
				<div id="msgbox">
					<div id="message">

					</div>
				</div>
				<input type="text" id="colorselect" value="ffffff" style="background:#333" />
				<input type="text" id="sendbox"></input>
				<button id="sendbtn">
					发送/(回车)Enter
				</button>
				
			</div>

			<div id="list">

			</div>
			
		</div>
		
		
		<script type="text/javascript">
		$('#colorselect').css('backgroundColor', '#' + $('#colorselect').val());
	 	$('#colorselect').ColorPicker({
		color: '#ffffff',
		onSubmit: function(hsb, hex, rgb, el) {
			$(el).val(hex);
			$(el).ColorPickerHide();
			
		},
		onBeforeShow: function () {
			$(this).ColorPickerSetColor(this.value);
			$('#colorselect').css('backgroundColor', '#' + this.value);
		},
		onChange: function (hsb, hex, rgb) {
			$('#colorselect').css('backgroundColor', '#' + hex);
		}
	})
	.bind('keyup', function(){
		$(this).ColorPickerSetColor(this.value);
		
	});
		</script>
	</body>
</html>
