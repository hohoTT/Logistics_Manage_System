require(["jquery", "bsAlert",  "validator"], function ($, bsAlert) {
    $("#stu_id").hide();
    $('form').validator().on('submit', function (e) {
        if (!e.isDefaultPrevented()) {
            var username = $("#username").val();
            var realName = $("#real_name").val();
            var password = $("#password").val();
            var email = $("#email").val();
            $.ajax({
                beforeSend: csrfTokenHeader,
                url: "/api/register/",
                data: {username: username, school: school, student_id: student_id, real_name: realName, password: password, email: email, captcha: captcha},
                dataType: "json",
                method: "post",
                success: function (data) {
                    if (!data.code) {
                        window.location.href = "/login/";
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
    
});