$(function(){
	$("#content").css({"opacity":"0.7"}).fadeIn('normal');
	$("#sendbox").focus();
	$("#sendbox").keydown(function(e){
		if(e.keyCode == 13) {
			sendmsg();
		}
	});
	$("#sendbtn").click(function(){
		sendmsg();
	});
	
	setInterval(getMsg,3000);
	
	getOline();
	setInterval(getOline,30000);
});




function sendmsg()
{
	var msg = $("#sendbox").val();
	
	if(msg.length == 0)
	{
		alert("message empty");
		return;
	}
	$.ajax({
	     type: "post",
	     url: 'chat.do',
	     data: "do=sendmsg&msg="+msg+"&color="+$("#colorselect").val(),
	     success: function(data){

	     },
	     error: function(){
	      alert("error");
	     }
	    });
	$("#sendbox").val("");
	$("#sendbox").focus();
	getMsg();
	
	
}


function getMsg()
{	
	 $.ajax({
	     type: "post",
	     url: "chat.do",
	     data: "do=getmsg",
	     success: function(data){
		 var value = jQuery.parseJSON(data);
		 	for(var key in value){

		 			var username	 = value[key]["username"];
		 			var color 			 = value[key]["color"];
		 			var time 			 = value[key]["time"];
		 			var msg 			 = value[key]["msg"];
		 			
		 			addmsg(username, time, color, msg);
		 	}
	     	
	     },
	     error: function(){
	      alert("error");
	     }
	    });
}

function getOline()
{
	$.ajax({
	     type: "post",
	     url: 'chat.do',
	     data: "do=onlinelist",
	     success: function(data){
			showList(data);
	     },
	     error: function(){
	      alert("error");
	     }
	    });
}

function addmsg(nick, time, color, msg){
	var html = '<p class="m">'
		+'<span class="nick">'+nick+'</span>&nbsp;&nbsp;<span class="time">'+time+'</span><br />'
		+'<span class="msg" style="color:'+color+'">&nbsp;&nbsp;&nbsp;&nbsp;'+msg+'</span>'
		+'</p>';
	$("#message").append(html);
}




function showList(list){
	
	
	var html="";
	var value = jQuery.parseJSON(list);
	var nums = 0;

	for(var key in value){
		
		html+='<p class="user">'
			+value[key]['username']
			+'</p>';
		
		nums=nums+1;
	}

	var ren ='<p class="all">人数('+nums+')</p>';

	$("#list").html(html);
}

window.onbeforeunload=function()
{
	$("title").html("zzz");
	if(document.all)
	{
		if(event.clientY<0)
		{
			$("title").html("xxxxxx");
			return "刷新后将退出聊天室？";
		}
	}else{
		$("title").html("yyy");
		return "刷新后将退出聊天室？";
	}
}

window.onunload=function(){
	$.get($("#exit").attr("href"), function(result){});
}
