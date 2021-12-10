<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../common/common.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>${pagenm}</title>
        <meta charset="utf-8">
		<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<!-- Favicon -->
		<link rel="shortcut icon" href="../assets/img/logo.ico">
		<!-- Fonts CSS -->
		<link rel="stylesheet" href="../assets/vendor/fonts/fonts.css?v">
		<!-- Bootstrap-icons CSS -->
		<link rel="stylesheet" href="../assets/vendor/bootstrap/icons/bootstrap-icons.css">
		<!--Magnific-Popup CSS -->
		<link rel="stylesheet" href="../assets/vendor/magnific/magnific-popup.css">
		<!-- Slick CSS -->
		<link rel="stylesheet" href="../assets/vendor/slick/slick.css">
		<!-- Style CSS -->
		<link rel="stylesheet" href="../assets/css/style.css?${js_timer}">
		
		<script src="../assets/js/common/common.js?${js_timer}"></script> 
		
		<!-- jquery -->
		<script src="../assets/vendor/appear/jquery-3.5.1.min.js"></script>
		<!-- appear -->
		<script src="../assets/vendor/appear/jquery.appear.js"></script>
		<!--bootstrap-->
		<script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- owl-carousel -->
		<script src="../assets/vendor/slick/slick.min.js"></script>
		<!-- magnific -->
		<script src="../assets/vendor/magnific/jquery.magnific-popup.min.js"></script>
		<!-- isotope -->
		<script src="../assets/vendor/isotope/isotope.pkgd.min.js"></script>
		<!-- count-down -->
		<script src="../assets/vendor/count-down/jquery.countdown.min.js"></script>
		<!-- Theme Js -->
		<script src="../assets/vendor/custom/custom.js"></script>
		
		<script src="../assets/js/cart/cart.js?${js_timer}"></script>
	</head>
</html>
<body>
<form id="headForm" name="headForm">
<input type="hidden" name="member_id" value="${userInfo.member_id}">
<input type="hidden" name="member_name" value="${userInfo.member_name}">
</form>
<!-- Preload -->
<div id="loading" class="preloader">
    <div class="spinner-border text-primary" role="status">
        <span class="visually-hidden">Loading...</span>
    </div>
</div>
<!-- End Preload -->

<!-- Search START -->
<div class="px-search-full collapse bg-dark p-3 z-index-999 position-fixed w-100 top-0" id="search-open">
    <div class="container position-relative">
        <div class="row vh-100 justify-content-center align-items-center">
            <div class="col-lg-8">
                <h2 class="h1">
                    <span class="d-block text-white">Search</span>
                </h2>
                <form class="position-relative w-100">
                    <div class="mb-3 input-group">
                        <!-- Search input -->
                        <input class="form-control border-0 shadow-none" type="text" name="search" placeholder="What are you looking for?">
                        <!-- Search button -->
                        <button type="button" class="btn btn-primary shadow-none">
                            <i class="bi bi-search"></i>
                        </button>
                    </div>
                </form>
            </div>
            <!-- Search button close START -->
            <a class="search-close" data-bs-toggle="collapse" href="javascript:void(0)" data-bs-target="#search-open" aria-expanded="true">
                <i class="bi bi-x p-0 lh-1"></i>
            </a>
            <!-- Search button close END -->
        </div>
    </div>
</div>
<!-- Search END -->
<!-- 登录 Popup START -->
<div class="modal fade" id="topbarlogin">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <div class="modal-title p-3">
                    <h5 class="m-0 text-white text-center">微信扫码登录</h5>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="w-100 p-3">
                    <!-- Form START -->
                    <form name="headerForm" action="/user/login" method="post">
                        <div class="mb-3">
                             <input type="text" id="r_email" name="r_email" class="form-control" placeholder="手机号/邮箱">
                        </div>
                        <div class="mb-3">
                           <input type="password" class="form-control" id="r_password" name="r_password" placeholder="密码">
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">记住账号</label>
                        </div>
                        <div class="row align-items-center">
                            <div class="col-sm-4">
                                <button type="submit" class="btn btn-dark" id="quick_login">登录</button>
                            </div>
                            <div class="col-sm-8 text-sm-end">
                                <span class="text-muted">
                                    	没有账号？ <a href="sign-up.html">马上注册！</a>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 登录 Popup END -->
<!-- quick Cart -->
<div class="modal px-modal-right fade" id="modalMiniCart" tabindex="-1" role="dialog" aria-hidden="true">
    <!-- Shopping Cart -->
    <div class="modal-dialog px-modal-vertical">
        <div class="modal-content">
            <div class="modal-body" id="quick_cart_list">
            </div>
        </div>
    </div>
</div>
<!-- End Mini Cart -->
<!-- Quick View Modal-->
<div class="modal-quick-view modal fade" id="px-quick-view" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <button class="btn-close position-absolute end-0 top-0 me-2 mt-2 z-index-1" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-body p-3">
                <div class="row">
                    <!-- Product Gallery -->
                    <div class="col-lg-6 lightbox-gallery product-gallery">
                        <img src="assets/img/product-1.jpg" class="img-fluid" title="" alt="">
                    </div>
                    <!-- End Product Gallery -->
                    <!-- Product Details -->
                    <div class="col-lg-6">
                        <div class="product-detail pt-4">
                            <div class="products-brand pb-2">
                                <span>Brand name</span>
                            </div>
                            <div class="products-title mb-2">
                                <h1 class="h4">Product Title Here</h1>
                            </div>
                            <div class="rating-star text small pb-4">
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star"></i>
                                <small>(4 Reviews )</small>
                            </div>
                            <div class="product-description">
                                <p>Lorem ipsum dolor sit amet, consectetur adipisic elit eiusm tempor incidid ut labore et dolore magna aliqua. Ut enim ad minim venialo quis nostrud exercitation ullamco</p>
                            </div>
                            <div class="product-attribute">
                                <label class="fs-6 text-dark pb-2 fw-500">Size</label>
                                <div class="nav-thumbs nav mb-3">
                                    <div class="form-check radio-text form-check-inline me-2">
                                        <input class="form-check-input" type="radio" name="size3" id="xs2" checked="">
                                        <label class="radio-text-label" for="xs2">XS</label>
                                    </div>
                                    <div class="form-check radio-text form-check-inline me-2">
                                        <input class="form-check-input" type="radio" name="size3" id="s2">
                                        <label class="radio-text-label" for="s2">S</label>
                                    </div>
                                    <div class="form-check radio-text form-check-inline me-2">
                                        <input class="form-check-input" type="radio" name="size3" id="m2">
                                        <label class="radio-text-label" for="m2">M</label>
                                    </div>
                                    <div class="form-check radio-text form-check-inline me-2">
                                        <input class="form-check-input" type="radio" name="size3" id="l2">
                                        <label class="radio-text-label" for="l2">L</label>
                                    </div>
                                </div>
                                <label class="fs-6 text-dark pb-2 fw-500">Color</label>
                                <div class="nav-thumbs nav mb-3">
                                    <div class="form-check radio-color large form-check-inline me-2">
                                        <input class="form-check-input" type="radio" name="color1" id="color1" checked="">
                                        <label class="radio-color-label" for="color1">
                                            <span style="background-color: #126532;"></span>
                                        </label>
                                    </div>
                                    <div class="form-check radio-color large form-check-inline me-2">
                                        <input class="form-check-input" type="radio" name="color1" id="color2">
                                        <label class="radio-color-label" for="color2">
                                            <span style="background-color: #ff9922;"></span>
                                        </label>
                                    </div>
                                    <div class="form-check radio-color large form-check-inline me-2">
                                        <input class="form-check-input" type="radio" name="color1" id="color3">
                                        <label class="radio-color-label" for="color3">
                                            <span style="background-color: #326598;"></span>
                                        </label>
                                    </div>
                                    <div class="form-check radio-color large form-check-inline me-2">
                                        <input class="form-check-input" type="radio" name="color1" id="color4">
                                        <label class="radio-color-label" for="color4">
                                            <span style="background-color: #126578;"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="product-price fs-3 fw-500 mb-2">
                                <del class="text-muted fs-6">
                                    $38.<small>50</small>
                                </del>
                                <span class="text-primary">
                                    $28.<small>50</small>
                                </span>
                            </div>
                            <div class="product-detail-actions d-flex flex-wrap pt-3">
                                <div class="cart-qty me-3 mb-3">
                                    <div class="dec qty-btn">-</div>
                                    <input class="cart-qty-input form-control" type="text" name="qtybutton" value="1">
                                    <div class="inc qty-btn">+</div>
                                </div>
                                <div class="cart-button mb-3 d-flex">
                                    <a href="shopping-cart.html" class="btn btn-dark me-3">
                                        <i class="bi bi-cart"></i>
                                        Add to cart
                                        
                                    </a>
                                    <a href="wishlist.html" class="btn btn-outline-primary me-3">
                                        <i class="bi bi-heart"></i>
                                    </a>
                                    <a href="shop-compare.html" class="btn btn-outline-primary me-3">
                                        <i class="bi bi-arrow-left-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Product Details -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Quick View Modal-->
<!-- Size chart popup-->
<div class="modal-size-chart modal fade" id="px_size_chart_modal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Size Chart</h4>
                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table class="table mb-0">
                    <thead>
                        <tr class="text-dark">
                            <th class="border-0 bg-light">US Sizes</th>
                            <th class="border-0 bg-light">Euro Sizes</th>
                            <th class="border-0 bg-light">UK Sizes</th>
                            <th class="border-0 bg-light">Inches</th>
                            <th class="border-0 bg-light">CM</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="">6</td>
                            <td>39</td>
                            <td>5.5</td>
                            <td>9.25"</td>
                            <td>23.5</td>
                        </tr>
                        <tr>
                            <td class="">6.5</td>
                            <td>39</td>
                            <td>6</td>
                            <td>9.5"</td>
                            <td>24.1</td>
                        </tr>
                        <tr>
                            <td class="">7</td>
                            <td>40</td>
                            <td>6.5</td>
                            <td>9.625"</td>
                            <td>24.4</td>
                        </tr>
                        <tr>
                            <td class="">7.5</td>
                            <td>40-41</td>
                            <td>7</td>
                            <td>9.75"</td>
                            <td>24.8</td>
                        </tr>
                        <tr>
                            <td class="">8</td>
                            <td>41</td>
                            <td>7.5</td>
                            <td>9.9375"</td>
                            <td>25.4</td>
                        </tr>
                        <tr>
                            <td class="">8.5</td>
                            <td>41-42</td>
                            <td>8</td>
                            <td>10.125"</td>
                            <td>25.7</td>
                        </tr>
                        <tr>
                            <td class="">9</td>
                            <td>42</td>
                            <td>8.5</td>
                            <td>10.25"</td>
                            <td>26</td>
                        </tr>
                        <tr>
                            <td class="">9.5</td>
                            <td>42-43</td>
                            <td>9</td>
                            <td>10.4375"</td>
                            <td>26.7</td>
                        </tr>
                        <tr>
                            <td class="">10</td>
                            <td>43</td>
                            <td>9.5</td>
                            <td>10.5625"</td>
                            <td>27</td>
                        </tr>
                        <tr>
                            <td class="">10.5</td>
                            <td>43-44</td>
                            <td>10</td>
                            <td>10.75"</td>
                            <td>27.3</td>
                        </tr>
                        <tr>
                            <td class="">11</td>
                            <td>44</td>
                            <td>10.5</td>
                            <td>10.9375"</td>
                            <td>27.9</td>
                        </tr>
                        <tr>
                            <td class="">11.5</td>
                            <td>44-45</td>
                            <td>11</td>
                            <td>11.125"</td>
                            <td>28.3</td>
                        </tr>
                        <tr>
                            <td class="">12</td>
                            <td>45</td>
                            <td>11.5</td>
                            <td>11.25"</td>
                            <td>28.6</td>
                        </tr>
                        <tr>
                            <td class="">13</td>
                            <td>46</td>
                            <td>12.5</td>
                            <td>11.5625"</td>
                            <td>29.4</td>
                        </tr>
                        <tr>
                            <td class="">14</td>
                            <td>47</td>
                            <td>13.5</td>
                            <td>11.875"</td>
                            <td>30.2</td>
                        </tr>
                        <tr>
                            <td class="">15</td>
                            <td>48</td>
                            <td>14.5</td>
                            <td>12.1875"</td>
                            <td>31</td>
                        </tr>
                        <tr>
                            <td class="">16</td>
                            <td>49</td>
                            <td>15.5</td>
                            <td>12.5"</td>
                            <td>31.8</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- End Size chart popup-->
<!-- shipping-->
<div class="modal-shipping-view modal fade" id="px_shipping_modal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Shipping Information</h4>
                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                <ul class="mb-3">
                    <li>Comodous in tempor ullamcorper miaculis</li>
                    <li>Pellentesque vitae neque mollis urna mattis laoreet.</li>
                    <li>Divamus sit amet purus justo.</li>
                    <li>Proin molestie egestas orci ac suscipit risus posuere loremous</li>
                </ul>
                <h4 class="pt-4">Privacy Policy</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                <ul class="mb-5">
                    <li>Comodous in tempor ullamcorper miaculis</li>
                    <li>Pellentesque vitae neque mollis urna mattis laoreet.</li>
                    <li>Divamus sit amet purus justo.</li>
                    <li>Proin molestie egestas orci ac suscipit risus posuere loremous</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End shipping-->
<!-- Ask About Product-->
<div class="modal-askform-view modal fade" id="px_ask_modal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Ask about product</h4>
                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Your Name</label>
                                <input type="text" class="form-control" placeholder="Name">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Email address</label>
                                <input type="email" class="form-control" placeholder="E-mail">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label" for="exampleInputEmail1">Subject</label>
                                <input type="text" class="form-control" placeholder="Subject">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label" for="exampleInputEmail1">Your Message</label>
                                <textarea class="form-control" rows="5" placeholder="Your Message"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <button type="submit" class="btn btn-primary">Send Message</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- End Ask About Product-->

<!--Header  -->
<div class="header-height-bar"></div>
<header class="header-main bg-white header-light fixed-top header-height">
    <!-- Top Header -->
    <div class="header-top header-border-bottom small bg-black">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <!-- Left -->
                <div class="d-flex align-items-center justify-content-center d-none d-lg-block">
                    <ul class="nav white-link">
                        <li class="nav-item me-3 text-white-85">
                            <span>
                                <i class="bi bi-clock me-2"></i>
                                <a href="#" id="addrMap">地图测试</a>
                            </span>
                        </li>
                        <li class="nav-item">
                            <a href="javascript:void(0);" class="navbar-link">
                                <i class="bi bi-headset me-2"></i>
                               	 随机播放音乐
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- Right -->
                <div class="d-flex align-items-center justify-content-center w-100 w-lg-auto">
                    <!-- Language -->
                    <!-- <div class="dropdown ms-0 ms-lg-3">
                        <a class="dropdown-toggle text-white" href="javascript:void(0);" role="button" id="dropdown_language" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="me-2" width="20" src="assets/img/flags/china.jpg" alt="">中文
                        </a>
                        <div class="dropdown-menu mt-2 shadow" aria-labelledby="dropdown_language" style="margin: 0px;">
                            <div class="dropdown-item">
                                <select class="form-select form-select-sm">
                                    <option value="usd">$ USD</option>
                                    <option value="eur">€ EUR</option>
                                    <option value="ukp">£ UKP</option>
                                    <option value="jpy">¥ JPY</option>
                                </select>
                            </div>
                            <a class="dropdown-item" href="javascript:void(0);">
                                <img class="me-2" width="20" src="assets/img/flags/sp.svg" alt="">Español
                            </a>
                            <a class="dropdown-item" href="javascript:void(0);">
                                <img class="me-2" width="20" src="assets/img/flags/fr.svg" alt="">Français
                            </a>
                            <a class="dropdown-item" href="javascript:void(0);">
                                <img class="me-2" width="20" src="assets/img/flags/gr.svg" alt="">Deutsch
                            </a>
                        </div>
                    </div> -->
                    <!-- Top link -->
                    <ul class="nav ms-auto ms-lg-3">
                        <!-- <li class="nav-item">
                            <a href="contact-us.html" class="nav-link text-white">Contact</a>
                        </li> -->
                        <li class="nav-item">
                        <c:choose>
                        	<c:when test="${userInfo.member_id eq null }">
	                            <a href="javascript:void(0);" class="nav-link text-white" data-bs-toggle="modal" data-bs-target="#topbarlogin">
	                                <i class="bi bi-person-circle me-2"></i>
	                              	 请登录
	                            </a>
                        	</c:when>
                        	<c:otherwise>
                        		<%-- <img alt="" src="${userInfo.img_url}">
	                        	<a href="#" class="nav-link text-white">
	                              	 ${userInfo.member_name}
	                            </a> --%>
                        	</c:otherwise>
                        </c:choose>
                        </li>
                    </ul>
                    <!-- Top social -->
                    <div class="nav header-social justify-content-end d-none d-lg-block white-link">
                        <a class="h-social-link" href="javascript:void(0);">
                            <i class="bi bi-facebook"></i>
                        </a>
                        <a class="h-social-link" href="javascript:void(0);">
                            <i class="bi bi-twitter"></i>
                        </a>
                        <a class="h-social-link" href="javascript:void(0);">
                            <i class="bi bi-linkedin"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Top Header -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <!-- Logo -->
            <a class="navbar-brand" href="/main">
                <img class="img-fluid w-60px" src="../assets/img/logo.jpg" title="" alt="">
            </a>
            <!-- Logo -->
            <!-- Menu -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mx-auto">
                    <li class="dropdown nav-item">
                        <a href="#" class="nav-link">畅销商品</a>
                        <label class="px-dropdown-toggle mob-menu"></label>
                        <ul class="dropdown-menu list-unstyled left">
                            <li>
                                <a class="dropdown-item" href="index.html">Home 1</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="index-2.html">Home 2</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="index-3.html">Home 3</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="index-4.html">Home 4</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown nav-item">
                        <a href="javascript:void(0);" class="nav-link">限时优惠</a>
                        <label class="px-dropdown-toggle mob-menu"></label>
                        <ul class="dropdown-menu left list-unstyled">
                            <li>
                                <a class="dropdown-item" href="about.html">About</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="faq.html">FAQ's</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="contact-us.html">Contact Us</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown dropdown-full nav-item">
                        <a href="javascript:void(0);" class="nav-link">HOT DEAL</a>
                        <label class="px-dropdown-toggle mob-menu"></label>
                        <div class="dropdown-menu dropdown-menu-lg py-lg-2">
                            <div class="container px-0">
                                <div class="row g-0">
                                    <div class="col-md-6 my-3">
                                        <h6 class="px-3">Shop Style</h6>
                                        <ul class="list-unstyled">
                                            <li>
                                                <a href="shop.html" class="dropdown-item">Shop Default</a>
                                            </li>
                                            <li>
                                                <a href="shop-filter.html" class="dropdown-item">Shop Filter</a>
                                            </li>
                                            <li>
                                                <a href="shop-fw-left.html" class="dropdown-item">Shop Full Width</a>
                                            </li>
                                            <li>
                                                <a href="shop-fw-right.html" class="dropdown-item">Shop Full Width Right</a>
                                            </li>
                                            <li>
                                                <a href="shop-fw-without-filtres.html" class="dropdown-item">Shop Full Width No Filter</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-md-6 my-3">
                                        <h6 class="px-3">Product Pages</h6>
                                        <ul class="list-unstyled">
                                            <li>
                                                <a href="product-details.html" class="dropdown-item">Product Details 1</a>
                                            </li>
                                            <li>
                                                <a href="product-details-2.html" class="dropdown-item">Product Details 2</a>
                                            </li>
                                            <li>
                                                <a href="product-details-3.html" class="dropdown-item">Product Details 3</a>
                                            </li>
                                            <li>
                                                <a href="product-details-4.html" class="dropdown-item">Product Details 4</a>
                                            </li>
                                            <li>
                                                <a href="product-details-5.html" class="dropdown-item">Product Details 5</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="dropdown dropdown-full nav-item">
                        <a href="javascript:void(0);" class="nav-link">商品分类</a>
                        <label class="px-dropdown-toggle mob-menu"></label>
                        <div class="dropdown-menu dropdown-mega-menu py-3">
                            <div class="container">
                                <div class="row g-3">
                                    <div class="col-sm-6 col-md-4 col-lg-2">
                                        <div class="hover-scale position-relative mb-3">
                                            <div class="hover-scale-in">
                                                <a href="javascript:void(0);">
                                                    <img src="assets/img/shop-banner-11.jpg" title="" alt="">
                                                </a>
                                            </div>
                                            <div class="pt-2 text-center position-absolute bottom-0 start-0 mb-3">
                                                <h5 class="m-0 h6 bg-white px-3 py-2">
                                                    <a class="text-reset link-effect" href="javascript:void(0);">Categories</a>
                                                </h5>
                                            </div>
                                        </div>
                                        <ul class="list-unstyled link-style-1">
                                            <li>
                                                <a href="shop.html">Scarf</a>
                                            </li>
                                            <li>
                                                <a href="shop.html">Shirt</a>
                                            </li>
                                            <li>
                                                <a href="shop.html">Shoes</a>
                                            </li>
                                            <li>
                                                <a href="shop.html">Shorts</a>
                                            </li>
                                            <li>
                                                <a href="shop.html">Summer</a>
                                            </li>
                                            <li>
                                                <a href="shop.html">Sunglasses</a>
                                            </li>
                                            <li>
                                                <a href="shop.html">Vintage</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-12">
                                        <div class="d-flex rounded w-100 align-items-center justify-content-center mx-2 py-4 position-relative bg-cover bg-center bg-no-repeat" style="background-image: url(assets/img/blog-home-2.jpg);">
                                            <div class="text-center">
                                                <h5 class="text-white">Flat 20% Off</h5>
                                                <h2 class="text-white h2 m-0">
                                                    <a class="stretched-link text-reset" href="index.html">Big Sale Offer</a>
                                                </h2>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <!-- <li class="dropdown dropdown-full nav-item">
                        <a href="javascript:void(0);" class="nav-link">Account</a>
                        <label class="px-dropdown-toggle mob-menu"></label>
                        <div class="dropdown-menu dropdown-menu-lg py-lg-2">
                            <div class="container px-0">
                                <div class="row g-0">
                                    <div class="col-md-6 my-3">
                                        <h6 class="px-3">Account</h6>
                                        <ul class="list-unstyled">
                                            <li>
                                                <a href="login.html" class="dropdown-item">Login </a>
                                            </li>
                                            <li>
                                                <a href="sign-up.html" class="dropdown-item">Sign up</a>
                                            </li>
                                            <li>
                                                <a href="reset-password.html" class="dropdown-item">Forgot Password</a>
                                            </li>
                                            <li>
                                                <a href="wishlist.html" class="dropdown-item">Wishlist</a>
                                            </li>
                                            <li>
                                                <a href="shopping-cart.html" class="dropdown-item">Shopping Cart </a>
                                            </li>
                                            <li>
                                                <a href="my-account.html" class="dropdown-item">My Account</a>
                                            </li>
                                            <li>
                                                <a href="checkout.html" class="dropdown-item">Checkout</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="col-md-6 my-3">
                                        <h6 class="px-3">My Account Option 2 </h6>
                                        <ul class="list-unstyled">
                                            <li>
                                                <a href="account-address.html" class="dropdown-item">Account Address</a>
                                            </li>
                                            <li>
                                                <a href="account-order.html" class="dropdown-item">Account Order</a>
                                            </li>
                                            <li>
                                                <a href="account-payment.html" class="dropdown-item">Account Payment</a>
                                            </li>
                                            <li>
                                                <a href="account-profile.html" class="dropdown-item">Account Profile</a>
                                            </li>
                                            <li>
                                                <a href="account-tickets.html" class="dropdown-item">Account Tickets</a>
                                            </li>
                                            <li>
                                                <a href="account-wishlist.html" class="dropdown-item">Account Wishlist</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="dropdown nav-item">
                        <a href="javascript:void(0);" class="nav-link">Blog</a>
                        <label class="px-dropdown-toggle mob-menu"></label>
                        <div class="dropdown-menu left shadow-lg">
                            <a class="dropdown-item" href="blog.html">Blog</a>
                            <a class="dropdown-item" href="blog-single.html">Blog Single</a>
                        </div>
                    </li> -->
                </ul>
            </div>
            <!-- End Menu -->
            <div class="nav flex-nowrap align-items-center header-right">
                <!-- Acount -->
                <div class="nav-item dropdown">
                	<c:choose>
                    <c:when test="${userInfo.member_id ne null}">
	                	<div class="navbar-nav mx-auto">
		                    <div class="dropdown nav-item">
		                    	<a href="javascript:void(0);">
			                        <img class="img-fluid w-40px" alt="" src="../${userInfo.img_url}">
			                    </a>
		                    	<div class="dropdown-menu left shadow-lg" aria-labelledby="dropdown_myaccount">
			                        <a class="dropdown-item" href="/mypage">个人信息</a>
			                        <a class="dropdown-item" href="/userAddress">收货地址</a>
			                        <a class="dropdown-item" href="/user/logout">退出</a>
			                    </div>
		                    </div>
	                    </div>
                    </c:when>
                    <c:otherwise>
                    	<a class="nav-link" href="javascript:void(0);" role="button" id="dropdown_myaccount" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                        <i class="bi bi-person-circle"></i>
	                    </a>
	                    <div class="dropdown-menu dropdown-menu-end mt-2 shadow" aria-labelledby="dropdown_myaccount">
	                        <a class="dropdown-item" href="/user/login">登录</a>
	                        <a class="dropdown-item" href="/user/registration">注册</a>
	                        <a class="dropdown-item" href="/goCart">我的购物车</a>
	                        <a class="dropdown-item" href="/myOrderList">我的订单</a>
	                    </div>
                    </c:otherwise>
                    </c:choose>
                </div>
                <!-- Wishlist -->
                <div class="nav-item d-none d-xl-block">
                    <a class="nav-link" href="wishlist.html">
                        <i class="bi bi-heart"></i>
                    </a>
                </div>
                <!-- Cart -->
                <div class="nav-item quick_cart">
                    <a class="nav-link" href="javascript:void(0)">
                        <span class="quick_cart_cnt" data-cart-items="${cart_size}">
                            <i class="bi bi-cart"></i>
                        </span>
                    </a>
                </div>
                <!-- Mobile Toggle -->
                <button class="navbar-toggler ms-2" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!-- End Mobile Toggle -->
            </div>
        </div>
    </nav>
</header>
<!-- loginpopup -->
<div class="modal fade" id="confirmPopup">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body">
                <div class="w-100 p-3">
                	<div class="row">
	                 	<span class="alert" id="confirmMessage" ></span>
               	    </div>
                </div>
                <div class="modal-footer ">
                  	<div class="">
                    	<button type="submit" class="btn btn-dark" data-bs-dismiss="modal" aria-label="Close">Cancel</button>
                   	</div>
                  	<div class="">
                    	<button type="submit" class="btn btn-outline-secondary reFunction" data-bs-dismiss="modal" aria-label="Close">OK</button>
                   	</div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 共同popup -->
<div class="modal fade" id="popup">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body">
                <div class="w-100 p-3">
                	<div class="row">
	                 	<span class="alert" id="message" ></span>
               	    </div>
                </div>
                <div class="modal-footer ">
                  	<div class="">
                    	<button type="submit" class="btn btn-outline-secondary" data-bs-dismiss="modal" aria-label="Close">OK</button>
                   	</div>
                </div>
            </div>
        </div>
    </div>
</div>