require(["jquery", "bsAlert", "csrfToken", "validator"], function ($, bsAlert, csrfTokenHeader) {
    var applied_captcha = false;
    $('form').validator().on('submit', function (e) {
        if (!e.isDefaultPrevented()) {
            var new_password = $("#new_password").val();
            var reset_captcha = $("#reset_captcha").val();
            var captcha = $("#captcha").val();

            $.ajax({
                beforeSend: csrfTokenHeader,
                url: "jsonResetPassword",
                data: {new_password: new_password, captcha: captcha, reset_captcha: reset_captcha},
                dataType: "json",
                method: "post",
                success: function (data) {
                    if (!data.code) {
                        refresh_captcha();
                        bsAlert(data.data);
                        
                        location.href = "userResetLogin";
                    }
                    else {
                        refresh_captcha();
                        bsAlert(data.data);
                    }
                },
                error: function(){
                    bsAlert("额 好像出错了，请刷新页面重试。如还有问题，请填写页面导航栏上的反馈。")
                }

            });
            return false;
        }
    });
    
    function refresh_captcha(){
        $("#captcha-img")[0].src = "captcha?" + Math.random();
        $("#captcha")[0].value = "";
    }
	
    $("#captcha-img").click(function(){
        refresh_captcha();
    });
    
    function sleep(n){
      var start=new Date().getTime();
      while(true) if(new Date().getTime()-start>n) break;
      location.href = "/Logistics_Manage_System";
    }
    
});