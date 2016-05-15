require(["jquery", "user_delete_bsAlert", "csrfToken", "validator"], function ($, user_delete_bsAlert, csrfTokenHeader) {
	
	//1. 点击 delete 时, 弹出 确定是要删除 xx 的信息吗 ? 
	// 若确定, 执行删除, 若不确定, 则取消
	$(".delete").click(function(){
		var user_name = $(this).next(":hidden").val();
		
		var flag = confirm("确定要删除  " + user_name + "  用户的信息吗?");
		
		//var flag = user_delete_bsAlert("确定要删除  " + user_name + "  用户的信息吗?");
		
		console.log("flag ---- " + flag);
		
		if(flag){

			// 获取这行的首项，即这一行
			var $tr = $(this).parent().parent();
			
			//删除, 使用 ajax 的方式
			var url = this.href;
			var args = {"time" : new Date()};
			
			$.post(url, args, function(data){
				
				//若 data 的返回值为 1, 则提示 删除成功, 且把当前行删除
				if(data == "1"){
					user_delete_bsAlert("用户已成功删除!");

					// 删除当前行
					$tr.remove();
				}
				else{
					//若 data 的返回值不是 1, 提示删除失败. 
					user_delete_bsAlert("删除失败!");
				}
				
			});	
		}
		
		//取消超链接的默认行为
		return false;
	});		
    
});