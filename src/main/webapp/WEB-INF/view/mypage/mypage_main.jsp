<!DOCTYPE html>
<%@page contentType="text/html; charset=UTF-8" %>
<html lang="utf-8">
<head>
    <!-- Title of The Page -->
    <title>MyPage</title>
    <!-- Meta Informations -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<script src="${server_url}assets/js/mypage/mypage_main.js"></script>    
</head>
<body>
   	<!-- Header -->
   	<%@include file="../common/header.jsp" %>
   	<!-- END Header -->
    <!-- Main -->
    <div>
        <!-- Table -->
        <div class="py-6 my-account">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <div class="nav flex-column nav-pills me-3 border" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                            <a href="javascript:void(0);" class="nav-link active" id="v-pills-personal-tab" data-bs-toggle="pill" data-bs-target="#v-pills-personal" role="tab" aria-controls="v-pills-personal" aria-selected="false"><i class="bi bi-person me-3"></i> 个人信息</a>
                            <a href="javascript:void(0);" class="nav-link" id="v-pills-password-tab" data-bs-toggle="pill" data-bs-target="#v-pills-password" role="tab" aria-controls="v-pills-password" aria-selected="false"><i class="bi bi-lock me-3"></i> 修改密码</a>
                            <a href="javascript:void(0);" class="nav-link" id="v-pills-address-tab" data-bs-toggle="pill" data-bs-target="#v-pills-address" role="tab" aria-controls="v-pills-address" aria-selected="false"><i class="bi bi-house-door me-3"></i> 地址</a>
                            <a href="javascript:void(0);" class="nav-link" id="v-pills-order-tab" data-bs-toggle="pill" data-bs-target="#v-pills-order" role="tab" aria-controls="v-pills-order" aria-selected="true"><i class="bi bi-box-seam me-3"></i> 订单信息</a>
                            <a class="nav-link" href="wishlist.html"><i class="bi bi-suit-heart me-3"></i> 我的收藏</a>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="tab-content " id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="v-pills-personal" role="tabpanel" aria-labelledby="v-pills-personal-tab">
                                <h4 class="pb-3">
                                    	个人信息
                                </h4>
                                <form id="user_info_form" name="user_info_form">
                                    <div class="row">
                                        <div class="col-sm-6 mb-3">
                                            <label class="form-label">姓名<span class="text-danger">*</span></label>
                                            <input type="text" name="user_name" class="form-control" placeholder="姓名">
                                        </div>
<!--                                         <div class="col-sm-6 mb-3">
                                            <label class="form-label">Last Name<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" placeholder="Last name">
                                        </div> -->
                                    </div>
                                 <div class="row">
                                        <div class="col-sm-6 mb-3">
                                            <label class="form-label">手机<span class="text-danger">*</span></label>
                                            <input type="text" name="user_mobile" class="form-control" placeholder="手机号码">
                                        </div>
   <!--                                      <div class="col-sm-6 mb-3">
                                            <label class="form-label">Landline Number</label>
                                            <input type="text" class="form-control" placeholder="Landline">
                                        </div> -->
                                    </div>                                    
                                    <div class="mb-3">
                                        <label class="form-label">邮箱<span class="text-danger">*</span></label>
                                        <input type="email" name="user_email" class="form-control" id="exampleInputEmail3" placeholder="邮箱地址">
                                    </div>
   
                                    <div class="">
                                        <label class="form-label">性别<span class="text-danger">*</span></label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="user_six" id="six_man" value="M">
                                        <label class="form-check-label" for="six_man">男</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="user_six" id="six_women" value="W">
                                        <label class="form-check-label" for="six_women">女</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="user_six" id="six_other" value="O">
                                        <label class="form-check-label" for=""six_other"">娚</label>
                                    </div>
                                    <div class="form-group mt-4"><button type="submit" id="user_info_subm" class="btn btn-primary">保存</button></div>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="v-pills-password" role="tabpanel" aria-labelledby="v-pills-password-tab">
                                <h4 class="mb-3">
                                   	修改密码
                                </h4>
                                <form name="user_pass_change_form">
                                    <div class="mb-3">
                                        <label class="form-label">旧密码<span class="text-danger">*</span></label>
                                        <input type="email" class="form-control" id="exampleInputEmail4" placeholder="旧密码">
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6 mb-3">
                                            <label class="form-label">密码<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" placeholder="密码">
                                        </div>
                                        <div class="col-sm-6 mb-3">
                                            <label class="form-label">确认密码<span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" placeholder="确认 密码">
                                        </div>
                                    </div>
                                    <div class="form-group mt-4"><button type="submit" class="btn btn-primary">修改 密码</button></div>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="v-pills-address" role="tabpanel" aria-labelledby="v-pills-address-tab">
                            <form name="user_addr_change">
                                <div class="row g-3 align-items-center">
                                    <div class="col-sm-6">
                                        <h4 class="m-0">
                                       	     地址
                                        </h4>
                                    </div>
                                    <div class="col-sm-6 text-sm-end">
                                        <a href="javascript:void(0);" class="underline"><i class="bi bi-plus-circle"></i> 增加新地址</a>
                                    </div>
                                </div>
                                <div class="row align-items-center">
                                    <div class="col-lg-6 my-3">
                                        <div class="card bg-transparent">
                                            <div class="card-header bg-transparent px-3">
                                                <div class="row align-items-center">
                                                    <div class="col-8">
                                                        <h5 class="card-title m-0">收货地址1</h5>
                                                    </div>
                                                    <div class="col">
                                                        <div class="dropdown text-end">
                                                            <a class="btn btn-sm px-2" href="javascript:void(0);" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                                                                <i class="bi bi-pencil-square"></i>
                                                            </a>
                                                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuLink">
                                                                <li><a class="dropdown-item" href="javascript:void(0);">Action</a></li>
                                                                <li><a class="dropdown-item" href="javascript:void(0);">Another action</a></li>
                                                                <li><a class="dropdown-item" href="javascript:void(0);">Something else here</a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body px-3">
                                                <p class="m-0">JENNIFER WINGET<br>
                                                    3909 Witmer Rd, Niagara Falls,<br>
                                                    NY 14305, United States<br>
                                                    United States<br>
                                                    +12 123456789<br>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 my-3">
                                        <div class="card bg-transparent">
                                            <div class="card-header bg-transparent px-3">
                                                <div class="row align-items-center">
                                                    <div class="col-8">
                                                        <h5 class="card-title m-0">收货地址2</h5>
                                                    </div>
                                                    <div class="col">
                                                        <div class="dropdown text-end">
                                                            <a class="btn btn-sm px-2" href="javascript:void(0);" role="button" id="dropdownMenuLink_01" data-bs-toggle="dropdown" aria-expanded="false">
                                                                <i class="bi bi-pencil-square"></i>
                                                            </a>
                                                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuLink_01">
                                                                <li><a class="dropdown-item" href="javascript:void(0);">Action</a></li>
                                                                <li><a class="dropdown-item" href="javascript:void(0);">Another action</a></li>
                                                                <li><a class="dropdown-item" href="javascript:void(0);">Something else here</a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body px-3">
                                                <p class="m-0">JENNIFER WINGET<br>
                                                    3909 Witmer Rd, Niagara Falls,<br>
                                                    NY 14305, United States<br>
                                                    United States<br>
                                                    +12 123456789<br>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="v-pills-order" role="tabpanel" aria-labelledby="v-pills-order-tab">
                              <form name="user_order">
                                <h4 class="m-0 pb-3">
                                  	  订单信息
                                </h4>
                                <!-- Cart Table -->
                                <div class="table-content table-responsive cart-table-content">
                                    <table class="table table-bordered align-middle">
                                        <thead>
                                            <tr class="text-uppercase text-nowrap">
                                                <th style="width: 100px" class="text-dark text-center fw-500">商品</th>
                                                <th class="text-dark text-center fw-500">名称</th>
                                                <th class="text-dark text-center fw-500">价格</th>
                                                <th class="text-dark text-center fw-500">个数</th>
                                                <th class="text-dark text-center fw-500">总价</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="text-center product-thumbnail">
                                                    <a class="text-reset" href="product-details.html"><img src="assets/img/product-1.jpg" class="img-fluid" width="100" alt=""></a>
                                                </td>
                                                <td class="text-center product-name"><a class="text-reset" href="product-details.html">Product Name</a></td>
                                                <td class="text-center product-price-cart"><span class="amount">$260.00</span></td>
                                                <td class="text-center product-quantity">
                                                    10
                                                </td>
                                                <td class="text-center product-subtotal">$110.00</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Table -->
    </div>
    <!-- End Main -->
    <!-- Footer -->
    <%@include file="../common/footer.jsp" %>
    <!-- End Footer -->
</body>
<!-- end body -->
</html>
