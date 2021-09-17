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
        <title>NII代购网-注册</title>
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
                            <a href="index">Home </a>
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
                    <h3>创建账户</h3>
                    <form class="user-form" name="reForm" action="/amazon/registration" method="post">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label>您的姓名</label>
                                    <input class="form-control" type="text" name="name">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label>邮箱地址</label>
                                    <input class="form-control" type="email" name="r_email">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label>密码</label>
                                    <input class="form-control" type="password" name="r_password">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label>再次输入密码</label>
                                    <input class="form-control" type="password" name="repeat-password">
                                </div>
                            </div>
                            <div class="col-12">
                                <button class="default-btn register" type="submit">创建您的账户 </button>
                            </div>
                            <div class="col-12">
                                <p class="create">
                                                                                                                       已拥有账户？ <a href="/amazon/login">登录</a>
                                </p>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
<!-- footer -->
	<%@include file="../view/common/footer.jsp" %>
<!-- footer End -->
    </body>
</html>
