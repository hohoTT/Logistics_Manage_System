var require = {
    // RequireJS 通过一个相对的路径 baseUrl来加载所有代码。baseUrl通常被设置成data-main属性指定脚本的同级目录。
    baseUrl: "/Logistics_Manage_System/static/js/",
    paths: {
        jquery: "lib/jQuery/jquery",
        bsAlert: "util/bsAlert",
        user_delete_bsAlert: "util/user_delete_bsAlert",
        reset_password_bsAlert : "util/reset_password_bsAlert",
        csrfToken: "util/csrfToken",
        bootstrap: "lib/bootstrap/bootstrap",
        validator: "lib/validator/validator",
        carousel : "carousel",
    },
    
    // 控制js的加载顺序，避免加载时发生的异常，指定模块之间的依赖关系
    shim: {
    	"bootstrap": ["jquery"],
    	"carousel" : ["jquery"],
    }
};