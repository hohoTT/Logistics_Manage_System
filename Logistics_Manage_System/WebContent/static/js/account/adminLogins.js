require(["jquery", "bsAlert", "csrfToken", "validator"], function ($, bsAlert, csrfTokenHeader) {
	
	$('form').validator().on('submit', function (e) {
        if (!e.isDefaultPrevented()) {

            var adminName = $("#adminName").val();
            var adminPassword = $("#adminPassword").val();

            $.ajax({
                beforeSend: csrfTokenHeader,
                url: "jsonAdminLogin",
                data: {adminName: adminName, adminPassword: adminPassword},
                dataType: "json",
                method: "post",
                success: function (data) {
                    if (!data.code) {
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
                            location.href = "adminPage";
                        }
                    }
                    else {
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
    
});