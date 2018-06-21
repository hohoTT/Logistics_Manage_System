# Logistics_Manage_System #

基于Java 中 SSH 框架的 物流配送管理系统

目前该系统应用于我本人的大四毕业设计，借鉴或参考请先联系作者(mr.hohowangtt@gmail.com或者609029365@qq.com)，有项目或者其他技术上的问题可以随时联系我，我会尽力去为您解答，欢迎Star或Fork，您的star和Fork是对作品的认同与肯定，感谢！

一键快速部署，移植性强！

------------------------------------------------------------------

## 项目各文件介绍 ##
 - **Logistics_Manage_System 项目主文件，也就是该项目你需要导入运行的文件**
 - hibernate_mapping 这个项目文件，是我把这其中的hibernate单独另外拿出来进行对hibernate的讲解分析，这个项目文件与物流的项目没有具体关系，只是对hibernate的一个案例分析，运行的话每一个包下都有main主函数，可以直接进行java类的mian函数运行即可，里面分类了数据库表的一对一、一对多以及多对多的数据关系，可以用来做完hibernate学习的参考使用
 - img 用于有关项目的功能截图存放文件
 - test 这个文件是当时我对项目的一些部分功能测试，可以不做考虑
 - word 有关该项目的部分文档设计

## 项目运行准备工作 ##
 - 导入Logistics_Manage_System该项目文件
 - 数据库文件为conf目录下的db.properties，这是导入项目后需要看的第一个文件，也是你项目运行需要唯一注意的文件
 - 项目启动前，看一下db.properties这个文件是不是和你本地的数据库统一（用户名以及密码），我用的是mysql数据库，之后你要创建一个名为logistics的数据库，之后启动项目就好了，数据库表的工作就交给hibernate，它会为你自动创建数据库表的。至此项目成功启动
 - 因为该项目没有使用Maven工程的构建方式，所以你不需要考虑jar包的 问题，项目中所涉及到的jar包都放在了WEB-INF下的lib目录文件下
 - 完成以上的几点你的项目就已经成功跑起来了~

## 项目目录结构介绍 ##

	|-- build                                                      // 配置文件无需考虑
	|-- conf                                                       // 项目有关的配置文件
	|   |-- applicationContext.xml                                 // 应用上下文配置文件
	|   |-- applicationContext-beans.xml                           // JavaBean配置文件
	|   |-- db.properties                                          // 数据库配置文件
	|   |-- hibernate.cfg.xml                              	       // hibernate配置文件
	|   |-- struts.xml                                             // 与Struts有关的配置
	|-- src                                                        // 源码目录
	|   |-- com
	|       |-- wt
	|           |-- action
	|               |-- AdminAction.java                           // 管理员处理类
	|               |-- CreateImageAction.java                     // 验证码生成处理类
	|               |-- OrderAction.java                           // 订单处理类
	|               |-- UserAction.java                            // 用户处理类
	|               |-- VerifyCodeAction.java                      // 另一种验证码生成处理类
	|           |-- dao
	|               |-- AdminDao.java                              // 管理员处理dao层部分
	|               |-- BaseDao.java                               // 可被其他dao层重复利用进行减少代码冗余的dao层部分
	|               |-- OrderDao.java                              // 订单处理dao层部分
	|               |-- UserDao.java                               // 用户处理dao层部分
	|           |-- entity
	|               |-- Admin.java                                 // 管理员实体类 
	|               |-- Admin.hbm.xml
	|               |-- Book.java                                  // 书籍实体类 
	|               |-- Book.hbm.xml
	|               |-- Order.java                                 // 订单实体类
	|               |-- Order.hbm.xml
	|               |-- User.java                                  // 用户实体类
	|               |-- User.hbm.xml                               
	|               |-- Warehouse.java                             // 仓库实体类
	|               |-- Warehouse.hbm.xml
	|           |-- fileHandle
	|               |-- FileHandle.java                            // 文件处理类
	|           |-- interceptor
	|               |-- AdminLoginInterceptor.java                 // 管理员拦截器处理类 
	|               |-- UserLoginInterceptor.java                  // 用户登录拦截器处理类 
	|               |-- UserLoginLogisticsInterceptor.java         // 用户登录物流配送中心拦截器处理类 
	|               |-- UserLoginShoppingInfoInterceptor.java      // 用户登录商城拦截器处理类
	|           |-- jsonHandle
	|               |-- AdminLoginJsonHandle.java                  // 管理员登录json数据处理类 
	|               |-- ApplyResetPasswordJsonHandle.java          // 邮件发送json数据处理类
	|               |-- LoginJsonHandle.java                       // 用户登录json数据处理类 
	|               |-- RegisterJsonHandle.java                    // 注册用户json数据处理类
	|               |-- ResetPasswordJsonHandle.java               // 修改密码json数据处理类
	|               |-- UserValidate.java                          // 用户验证处理类
	|           |-- service
	|               |-- AdminService.java                          // 管理员service层处理类 
	|               |-- OrderService.java                          // 订单service层处理类 
	|               |-- UserService.java                           // 用户service层处理类 
	|           |-- utilMail
	|               |-- ApplyResetPassword.java                    // 发送邮件修改密码模拟类
	|               |-- MailSenderInfo.java                        // 邮件注册信息
	|               |-- MyAuthenticator.java                       // 获取发送邮件者信息
	|               |-- SimpleMailSender.java                      // 以文本格式发送邮件   
	|               |-- Test.java                                  // 邮件发送测试类，可单独运行进行邮件发送测试
	|           |-- template
	|               |-- emailTemplate.vm			       // 发送邮件的模板
	|   |-- WebContent    // 页面入口文件由于其中涉及的都是前端页面以及js、css部分这里不做过多介绍，根据命名也能很好的推测出
	|   	|-- css						       // 第三方提供的css
	|   	|-- js 						       // 第三方提供的js
	|   	|-- template
	|   	    |-- template.ftl			               // 下载word文档的模板
	|   	|-- static					       // 特定页面使用的手写js以及css
	|           |-- css
	|   	    |-- js
	|       |-- WEB-INF 
	|           | -- lib                 			       // jar 包存放位置
	|           | -- web.xml             			       // 项目及工具的依赖配置文件
	|-- README.md                        			       // 说明


## 邮件发送部分介绍 ##

首先通过之前的项目目录结构介绍，可以很清楚的看到与邮件相关的操作实现都在com.wt.utilMail包下，并且含有一个邮件发送的测试文件。
事先声明，本项目中邮件发送使用的为我的网易邮箱，未经我的同意不可向第三方发送任何内容，除了对项目测试时的邮件发送，如需使用，最好换为自己的邮箱。
这里的邮箱需要你获取邮箱设置中的授权码，并不是你的邮箱密码，细节部分可以到我的博文 http://www.hohott.wang/2016/05/10/Java-Mail/ 下阅读查看使用规则。

邮箱收到的找回密码的样式展示
![邮箱收到的找回密码的样式展示](https://raw.githubusercontent.com/hohoTT/Logistics_Manage_System/master/img/emailMessage.png)

## 效果图展示 ##

首页展示
![首页展示](https://raw.githubusercontent.com/hohoTT/Logistics_Manage_System/master/img/impressionImg7.png)

用户登录页面
![用户登录页面](https://raw.githubusercontent.com/hohoTT/Logistics_Manage_System/master/img/impressionImg2.png)

用户注册页面
![用户注册页面](https://raw.githubusercontent.com/hohoTT/Logistics_Manage_System/master/img/impressionImg3.png)

验证校验失败页面
![验证校验失败页面](https://raw.githubusercontent.com/hohoTT/Logistics_Manage_System/master/img/impressionImg5.png)

找回密码页面
![找回密码页面](https://raw.githubusercontent.com/hohoTT/Logistics_Manage_System/master/img/impressionImg6.png)

书城页面
![书城页面](https://raw.githubusercontent.com/hohoTT/Logistics_Manage_System/master/img/impressionImg8.png)

购物页面
![购物页面](https://raw.githubusercontent.com/hohoTT/Logistics_Manage_System/master/img/impressionImg9.png)

我的购物车页面
![我的购物车页面](https://raw.githubusercontent.com/hohoTT/Logistics_Manage_System/master/img/impressionImg14.png)

娱乐游戏页面
![娱乐游戏页面](https://raw.githubusercontent.com/hohoTT/Logistics_Manage_System/master/img/impressionImg10.png)

反馈页面
![反馈页面](https://raw.githubusercontent.com/hohoTT/Logistics_Manage_System/master/img/impressionImg16.png)

管理员登录页面
![管理员登录页面](https://raw.githubusercontent.com/hohoTT/Logistics_Manage_System/master/img/impressionImg4.png)

管理员管理用户信息页面
![管理员管理用户信息页面](https://raw.githubusercontent.com/hohoTT/Logistics_Manage_System/master/img/impressionImg12.png)

管理员管理用户文件信息页面
![管理员管理用户文件信息页面](https://raw.githubusercontent.com/hohoTT/Logistics_Manage_System/master/img/impressionImg13.png)

订单配送中心页面
![订单配送中心页面](https://raw.githubusercontent.com/hohoTT/Logistics_Manage_System/master/img/impressionImg15.png)
