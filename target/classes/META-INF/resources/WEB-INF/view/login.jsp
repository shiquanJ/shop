<%@page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/boxicons.min.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/meanmenu.min.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
        <link rel="icon" type="image/png" href="assets/images/favicon.png">
        <title>NII代购网-登录</title>
    </head>
    <body>
<!-- header -->
	<%@include file="../view/common/header.jsp" %>
<!-- header End -->
        <div class="page-title-area">
            <div class="container">
                <div class="page-title-content">
                    <h2>Register</h2>
                    <ul>
                        <li>
                            <a href="index.html">Home </a>
                        </li>
                        <li>Pages</li>
                        <li class="active">Register</li>
                    </ul>
                </div>
            </div>
        </div>
        <section class="user-area register-area ptb-100">
            <div class="container">
                <div class="user-form-content">
                    <h3>登录</h3>
                    <form class="user-form"  name="loginForm" action="/amazon/login" method="post">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label>邮箱地址或手机号码</label>
                                    <input class="form-control" type="email" name="email">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label>请输入密码</label>
                                    <input class="form-control" type="password" name="password">
                                </div>
                            </div>
                            <div class="col-12">
                                <button class="default-btn register" type="submit">登录</button>
                            </div>
                            
                            <div class="col-12"><span class="or">Or</span></div>
                            
                            <div class="col-12"><a href="#" class="or-login">
                            	<i class="bx bxl-facebook">
                            	</i>微信登录</a>
                            </div>
                            <div class="col-12">
                            	<p class="create">新用户?<a href="/amazon/registration">创建</a></p></div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
<!-- footer -->
	<%@include file="../view/common/footer.jsp" %>
<!-- footer End -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/meanmenu.min.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/wow.min.js"></script>
        <script src="assets/js/form-validator.min.js"></script>
        <script src="assets/js/contact-form-script.js"></script>
        <script src="assets/js/ajaxchimp.min.js"></script>
        <script src="assets/js/range-slider.min.js"></script>
        <script src="assets/js/custom.js"></script>
    </body>
</html>
