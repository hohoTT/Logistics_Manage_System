var require = {
    // RequireJS 通过一个相对的路径 baseUrl来加载所有代码。baseUrl通常被设置成data-main属性指定脚本的同级目录。
    baseUrl: "/Logistics_Manage_System/static/js/",
    paths: {
        jquery: "lib/jQuery/jquery",
        bootstrap: "lib/bootstrap/bootstrap",
        validator: "lib/validator/validator",
        bsAlert: "util/bsAlert",
    },
    shim: {
            avalon: {
                exports: "avalon"
            }
    }
};