require(["jquery", "bsAlert", "csrfToken", "validator"], function ($, bsAlert, csrfTokenHeader) {
    $('form').validator().on('submit', function (e) {
        if (!e.isDefaultPrevented()) {

        	var params = $("input").serialize();
        	
            $.ajax({
                beforeSend: csrfTokenHeader,
                url: "save",
                data: params,
                dataType: "json",
                method: "post",
                success: function (data) {
                    function getLocationVal(id){
	                    var temp = unescape(location.search).split(id+"=")[1] || "";
	                    return temp.indexOf("&")>=0 ? temp.split("&")[0] : temp;
	                }
	                var from = getLocationVal("__from");
	                if(from != ""){
	                    console.log(from);
	                    window.location.href = from;
	                }
	                else{
	                    location.href = "/Logistics_Manage_System";
	                }
                },
                error: function(){
                    bsAlert("额 好像出错了，请刷新页面重试。如还有问题，请填写页面导航栏上的反馈。")
                }
            });
            return false;
        }
    });
    
});