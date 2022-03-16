<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../common/header.jsp" %>
    <!-- Main -->
    <div class="main">
        <!-- 注册页面 -->
        <div class="section">
            <div class="container">
                <div class="justify-content-center row">
                    <div class="col-lg-10 col-xxl-6">
                        <div class="card">
                            <div class="card-header bg-transparent py-3">
                                <h3 class="h4 mb-0">创建账户 </h3>
                            </div>
                            <div class="card-body">
                                <form class="" name="reForm" action="/user/registration" method="post">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <label for="name_1" class="form-label">您的姓名<span class="text-danger">*</span></label>
                                                <input type="text" id="r_name" name="r_name" class="form-control" placeholder="姓名">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <label for="email_1" class="form-label">邮箱<span class="text-danger">*</span></label>
                                                <input type="email" id="r_email" name="r_email" class="form-control" placeholder="邮箱">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <label class="form-label col" for="exampleInputPassword_01">密码<span class="text-danger">*</span></label>
                                                <input type="password" class="form-control" name="r_password" id="exampleInputPassword_01" placeholder="*********">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <label class="form-label col" for="exampleInputPassword1">确认密码<span class="text-danger">*</span></label>
                                                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="*********">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-check mb-4">
                                        <input class="form-check-input" type="checkbox" value="" id="form2Example3" checked />
                                        <label class="form-check-label" for="form2Example3"> 我已阅读并接受以下条款：《SGSHOP服务条款》《SGSHOP隐私政策》《SGSHOP支付用户服务协议》 </label>
                                    </div>
                                    <div class="form-group row align-items-center">
                                        <div class="col">
                                            <button type="submit" class="btn btn-red" id="goRegistration">
                                                	立即注册
                                            </button>
                                        </div>
                                        <div class="col-12 col-sm text-sm-end mt-3 mt-sm-0">
                                            <span class="text-muted"> 已拥有账户？  <a href="/login">请登录</a></span>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end signup -->
    </div>
    <!-- End Main -->
    <!-- Footer -->
    <%@include file="../common/footer.jsp" %>
	<script src="../assets/js/user/registration.js?${js_timer}"></script>