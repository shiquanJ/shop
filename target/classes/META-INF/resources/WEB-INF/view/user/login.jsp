<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../common/header.jsp" %>
   	<!-- END Header -->
    <!-- Main -->
    <div class="main">
        <!-- login page -->
        <div class="section">
            <div class="container">
                <div class="justify-content-center row">
                    <div class="col-lg-5 col-xxl-4">
                        <div class="card">
                        	<div class="row g-2 card-body">
                        		<div class="col card-header border-end">
                        			<h3 class="h5 text-center">扫码登录</h3>
                        		</div>
                        		<div class="col card-header">
                        			<h3 class="h5 text-center">账户登录</h3>
                        		</div>
                        	</div>
                            <div class="card-body">
                                <form class="" name="reForm" action="/login" method="post">
                                    <div class="form-group mb-3">
                                        <input type="text" id="r_email" name="r_email" class="form-control" placeholder="手机号/邮箱">
                                    </div>
                                    <div class="form-group mb-3">
                                        <input type="password" class="form-control" id="r_password" name="r_password" placeholder="密码">
                                    </div>
                                    <!-- Checkbox -->
                                    <div class="form-group mb-3 row">
                                    	<div class="col text-start">
	                                        <span class="col ms-auto small"><a href="#">短信验证登录</a></span>
                                    	</div>
                                    	<div class="col text-end">
	                                        <span class="col ms-auto small"><a href="#">找回密码</a></span>
                                    	</div>
                                    </div>
                                    <div class="form-group text-center">
                                        <button type="submit" class="btn btn-primary w-100">
                                           	 登录
                                        </button>
                                    </div>
                                </form>
                                <div class="text-center pt-4 pb-5" style="">
                                    <span class="px-3 bg-white d-inline-block align-top lh-sm">OR</span>
                                    <div class="border-bottom mt-n3"></div>
                                </div>
                                <div class="row">
                                    <div class="col text-center">
                                    	<img class="wechatLogo" alt="" src="assets/img/wechat.jpg">
                                    </div>
                                </div>
                                <div class="pt-4 text-center">
                                    <span class="text-muted"><a href="#" id="goLogin">立即注册</a></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end login -->
    </div>
    <!-- End Main -->
    <!-- Footer -->
    <%@include file="../common/footer.jsp" %>
    <!-- End Footer -->
    <script src="${server_url}assets/js/user/login.js"></script>
