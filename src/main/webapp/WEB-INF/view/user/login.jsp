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
                        		<div class="col card-header d-none" >
                        			<p class="text-center m-auto fs-20">手机登录</p>
                        		</div>
                        	</div>
                            <div class="card-body d-none" id="phlogin">
                                <form class="" name="reForm" action="/user/login" method="post">
                                    <div class="form-group mb-3">
                                        <input type="text" id="r_email" name="r_email" class="form-control" placeholder="手机号/邮箱">
                                    </div>
                                    <div class="form-group mb-3">
                                        <input type="password" class="form-control" id="r_password" name="r_password" placeholder="密码">
                                    </div>
                                </form>
                                <div class="form-group text-center">
                                    <button type="submit" class="btn btn-red w-100">
                                       	 登录
                                    </button>
                                </div>
	                            <div class="text-center pt-4 pb-5">
	                                <span class="px-3 bg-white d-inline-block align-top lh-sm">OR</span>
	                                <div class="border-bottom mt-n3"></div>
	                            </div>
	                            <div class="form-group text-center">
	                            	<button type="submit" class="btn btn-red-re w-100" id="goLogin">
	                                  	立即注册
	                                </button>
	                            </div>
                            </div>
                            <div class="m-auto" id="wxlogin"></div>
                            <div class="card-footer">
                            	<div class="col text-start btn-phone" style="">
	                            	<span class="col ms-auto small"><a href="#">短信验证登录</a></span>
                                </div>
                            	<div class="col text-start btn-wechat d-none">
	                            	<span class="col ms-auto small"><a href="#">微信登录</a></span>
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
	<script src="../assets/js/user/login.js?${js_timer}"></script>	