<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>SGSHOP</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Favicon -->
        <link rel="shortcut icon" href="assets/img/logo.ico">
        <!-- Fonts CSS -->
        <link rel="stylesheet" href="assets/vendor/fonts/fonts.css">
        <!-- Bootstrap-icons CSS -->
        <link rel="stylesheet" href="assets/vendor/bootstrap/icons/bootstrap-icons.css">
        <!--Magnific-Popup CSS -->
        <link rel="stylesheet" href="assets/vendor/magnific/magnific-popup.css">
        <!-- Slick CSS -->
        <link rel="stylesheet" href="assets/vendor/slick/slick.css">
        <!-- Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css?v1">
        
	</head>
<body>
<%@include file="./common/header.jsp" %>
<!-- Header End -->
<!-- Main -->
<div class="main">
    <!-- Home Slider -->
    <div class="slick-carousel slick-nav-rounded" data-slick='{
            "slidesToShow": 1,
            "slidesToScroll": 1,
            "arrows": true,
            "fade": true,
        }'>
        <c:forEach items="${lookbookList}" var="lvo">
	        <div class="bg-no-repeat bg-cover bg-center" style="background-image: url(${lvo.img_url});">
	            <div class="container">
	                <div class="row min-vh-85 align-items-center justify-content-center py-12">
	                    <div class="col-lg-8 text-center">
	                        <h6 class="fw-lighten text-uppercase text-white mb-3 letter-spacing-6">You're Looking Good</h6>
	                        <h1 class="display-1 fw-lighten text-white letter-spacing-6 text-uppercase">New LookBook</h1>
	                        <div class="pt-3">
	                            <a class="btn btn-outline-white" href="shop-fw-without-filtres.html">Discover More</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
        </c:forEach>
    </div>
    <!-- End Home Slider -->
    <!-- banner -->
    <section class="section">
        <div class="container">
			<div class="row g-4  bg-white">
			<c:forEach items="${bannerList}" var="bvo" varStatus="ts">
		       	<div class="col-lg-4">
		       		<div class="position-relative my-3">
		       			<div class="position-absolute w-100 h-100 d-flex align-items-center justify-content-center my-3">	
		       				<div class="w-100 text-start">
				                    <!-- <h6 class="text-uppercase fw-lighten text-white mb-3">NEW IN</h6> -->
				                <h3 class="fw-lighten h3 text-black">${bvo.banner_nm}</h3>
				                   <%--  <div class="pt-3">
				                        <a class="btn btn-white btn-sm" href="shop.html">${bvo.banner_nm}</a>
				                    </div> --%>
				            </div>
				        </div>
				    </div>
		       		<img class="w-100 h-75 rounded my-5" src="${bvo.img_url}" >
		       		<div class="btn btn-sm" style="cursor: pointer;" onclick="goList('${bvo.catagory_id}')">
		       			查看更多
		       		</div>
				</div>   
	       </c:forEach>
		</div>
		</div>
    </section>
    <!-- End banner -->
    <!-- 商品列表 -->
    <section class="section">
        <div class="container">
            <div class="row justify-content-center section-heading">
                <div class="col-lg-6 text-center">
                    <!-- <p class="fs-6 m-0">new</p> -->
                    <h3 class="h2 mt-2">新品上市</h3>
                </div>
            </div>
            <div class="row g-3 g-lg-4">
            <c:forEach items="${prdList}" var="pvo">
            	<div class="col-sm-6 col-lg-3">
            		<div class="product-card-1">
            			<div class="product-card-image">
            				<div class="badge-ribbon">
                                <!-- <span class="badge bg-danger">Sale</span> -->
                            </div>
                            <div class="product-action">
                                <a href="wishlist.html" class="btn btn-outline-primary">
                                    <i class="bi bi-heart"></i>
                                </a>
                                <a href="shop-compare.html" class="btn btn-outline-primary">
                                    <i class="bi bi-arrow-left-right"></i>
                                </a>
                                <a data-bs-toggle="modal" data-bs-target="#px-quick-view" href="javascript:void(0)" class="btn btn-outline-primary">
                                    <i class="bi bi-eye-fill"></i>
                                </a>
                            </div>
                            <div class="product-media">
                                <a href="product-details.html">
                                    <img class="img-fluid" src="${pvo.img_url }" title="" alt="">
                                </a>
                                <div class="product-cart-btn">
                                    <a href="shopping-cart.html" class="btn btn-primary btn-sm w-100">
                                        <i class="bi bi-cart"></i>
                                        Add to cart 
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="product-card-info">
                            <div class="product-meta small">
                                <a href="#">库存</a>&nbsp;
                                <a href="#">${pvo.stock}</a>
                            </div>
                            <h6 class="product-title">
                                <a href="shop-fw-without-filtres.html">${pvo.goods_name}</a>
                            </h6>
                            <div class="product-price">
                                <span class="text-primary">
                                	${pvo.currency_type}&yen;${pvo.promotion_price}
                                   <!--  $28.<small>50</small> -->
                                </span>
                                <del class="fs-sm text-muted">
                                	${pvo.currency_type}&yen;${pvo.price}
                                    <!-- $38.<small>50</small> -->
                                </del>
                            </div>
                            <!-- 星星-->
                            <div class="rating-star text">
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star"></i>
                            </div>
                            <!--商品大小？  -->
                           <!--  <div class="nav-thumbs">
                                <div class="form-check radio-text form-check-inline">
                                    <input class="form-check-input" type="radio" name="size3" id="btnradio1" checked>
                                    <label class="radio-text-label" for="btnradio1">XS</label>
                                </div>
                                <div class="form-check radio-text form-check-inline">
                                    <input class="form-check-input" type="radio" name="size3" id="btnradio2">
                                    <label class="radio-text-label" for="btnradio2">S</label>
                                </div>
                                <div class="form-check radio-text form-check-inline">
                                    <input class="form-check-input" type="radio" name="size3" id="btnradio3">
                                    <label class="radio-text-label" for="btnradio3">M</label>
                                </div>
                                <div class="form-check radio-text form-check-inline">
                                    <input class="form-check-input" type="radio" name="size3" id="btnradio4">
                                    <label class="radio-text-label" for="btnradio4">L</label>
                                </div>
                            </div> -->
                        </div>
                    </div>
                </div>
            </c:forEach>
                <!-- End Product Box -->
            </div>
        </div>
    </section>
    <!-- End Product section -->
    <!-- call to action -->
    <section class="py-12 bg-cover bg-center bg-no-repeat" style="background-image: url(assets/img/bg-banner-1.jpg);">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7 text-center">
                    <h6 class="text-white mb-4">Hurry up!Limited time offer</h6>
                    <h3 class="display-2 fw-lighten text-white">
                        Nw Exclusive <br/>2021 Collection
                    </h3>
                    <div class="pt-4">
                        <a class="btn btn-outline-white" href="shop-fw-without-filtres.html">Discover More</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End call to action -->
    <!-- Product section -->
    <section class="section">
        <div class="container">
            <div class="row justify-content-center section-heading">
                <div class="col-lg-6 text-center">
                    <h3 class="h2 mb-2">Shop The Collection</h3>
                    <p class="fs-6 m-0">Read Today’s News.</p>
                </div>
            </div>
            <div class="slick-carousel slick-nav-dark" data-slick='{
                    "slidesToShow": 4,
                    "slidesToScroll": 1,
                    "centerMode": false,
                    "focusOnSelect": true,
                    "infinite": false,
                    "responsive": [
                        {
                            "breakpoint":1200,
                            "settings":{
                                "slidesToShow": 4
                            }
                        },
                        {
                            "breakpoint":992,
                            "settings":{
                                "slidesToShow": 3
                            }
                        },
                        {
                            "breakpoint":768,
                            "settings":{
                                "slidesToShow": 2
                            }
                        },
                        {
                            "breakpoint":576,
                            "settings":{
                                "slidesToShow": 1
                            }
                        }
                    ]
                    }'>
                <div class="p-2">
                    <div class="product-card-1">
                        <div class="product-card-image">
                            <div class="badge-ribbon">
                                <span class="badge bg-danger">Sale</span>
                            </div>
                            <div class="product-action">
                                <a href="wishlist.html" class="btn btn-outline-primary">
                                    <i class="bi bi-heart"></i>
                                </a>
                                <a href="shop-compare.html" class="btn btn-outline-primary">
                                    <i class="bi bi-arrow-left-right"></i>
                                </a>
                                <a data-bs-toggle="modal" data-bs-target="#px-quick-view" href="javascript:void(0)" class="btn btn-outline-primary">
                                    <i class="bi bi-eye-fill"></i>
                                </a>
                            </div>
                            <div class="product-media">
                                <a href="product-details.html">
                                    <img class="img-fluid" src="assets/img/product-1.jpg" title="" alt="">
                                </a>
                                <div class="product-cart-btn">
                                    <a href="shopping-cart.html" class="btn btn-primary btn-sm w-100">
                                        <i class="bi bi-cart"></i>
                                        Add to cart 
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="product-card-info">
                            <div class="product-meta small">
                                <a href="shop-fw-without-filtres.html">Clothing</a>
                                ,<a href="shop-fw-without-filtres.html">Men</a>
                            </div>
                            <div class="rating-star text">
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star"></i>
                            </div>
                            <h6 class="product-title">
                                <a href="shop-fw-without-filtres.html">Fine-knit sweater</a>
                            </h6>
                            <div class="product-price">
                                <span class="text-primary">
                                    $28.<small>50</small>
                                </span>
                                <del class="fs-sm text-muted">
                                    $38.<small>50</small>
                                </del>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="p-2">
                    <div class="product-card-1">
                        <div class="product-card-image">
                            <div class="badge-ribbon">
                                <span class="badge bg-danger">Sale</span>
                            </div>
                            <div class="product-action">
                                <a href="wishlist.html" class="btn btn-outline-primary">
                                    <i class="bi bi-heart"></i>
                                </a>
                                <a href="shop-compare.html" class="btn btn-outline-primary">
                                    <i class="bi bi-arrow-left-right"></i>
                                </a>
                                <a data-bs-toggle="modal" data-bs-target="#px-quick-view" href="javascript:void(0)" class="btn btn-outline-primary">
                                    <i class="bi bi-eye-fill"></i>
                                </a>
                            </div>
                            <div class="product-media">
                                <a href="product-details.html">
                                    <img class="img-fluid" src="assets/img/product-2.jpg" title="" alt="">
                                </a>
                                <div class="product-cart-btn">
                                    <a href="shopping-cart.html" class="btn btn-primary btn-sm w-100">
                                        <i class="bi bi-cart"></i>
                                        Add to cart 
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="product-card-info">
                            <div class="product-meta small">
                                <a href="shop-fw-without-filtres.html">Clothing</a>
                                ,<a href="shop-fw-without-filtres.html">Men</a>
                            </div>
                            <div class="rating-star text">
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star"></i>
                            </div>
                            <h6 class="product-title">
                                <a href="shop-fw-without-filtres.html">Fine-knit sweater</a>
                            </h6>
                            <div class="product-price">
                                <span class="text-primary">
                                    $28.<small>50</small>
                                </span>
                                <del class="fs-sm text-muted">
                                    $38.<small>50</small>
                                </del>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="p-2">
                    <div class="product-card-1">
                        <div class="product-card-image">
                            <div class="badge-ribbon">
                                <span class="badge bg-danger">Sale</span>
                            </div>
                            <div class="product-action">
                                <a href="wishlist.html" class="btn btn-outline-primary">
                                    <i class="bi bi-heart"></i>
                                </a>
                                <a href="shop-compare.html" class="btn btn-outline-primary">
                                    <i class="bi bi-arrow-left-right"></i>
                                </a>
                                <a data-bs-toggle="modal" data-bs-target="#px-quick-view" href="javascript:void(0)" class="btn btn-outline-primary">
                                    <i class="bi bi-eye-fill"></i>
                                </a>
                            </div>
                            <div class="product-media">
                                <a href="product-details.html">
                                    <img class="img-fluid" src="assets/img/product-3.jpg" title="" alt="">
                                </a>
                                <div class="product-cart-btn">
                                    <a href="shopping-cart.html" class="btn btn-primary btn-sm w-100">
                                        <i class="bi bi-cart"></i>
                                        Add to cart 
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="product-card-info">
                            <div class="product-meta small">
                                <a href="shop-fw-without-filtres.html">Clothing</a>
                                ,<a href="shop-fw-without-filtres.html">Men</a>
                            </div>
                            <div class="rating-star text">
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star"></i>
                            </div>
                            <h6 class="product-title">
                                <a href="shop-fw-without-filtres.html">Fine-knit sweater</a>
                            </h6>
                            <div class="product-price">
                                <span class="text-primary">
                                    $28.<small>50</small>
                                </span>
                                <del class="fs-sm text-muted">
                                    $38.<small>50</small>
                                </del>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="p-2">
                    <div class="product-card-1">
                        <div class="product-card-image">
                            <div class="badge-ribbon">
                                <span class="badge bg-danger">Sale</span>
                            </div>
                            <div class="product-action">
                                <a href="wishlist.html" class="btn btn-outline-primary">
                                    <i class="bi bi-heart"></i>
                                </a>
                                <a href="shop-compare.html" class="btn btn-outline-primary">
                                    <i class="bi bi-arrow-left-right"></i>
                                </a>
                                <a data-bs-toggle="modal" data-bs-target="#px-quick-view" href="javascript:void(0)" class="btn btn-outline-primary">
                                    <i class="bi bi-eye-fill"></i>
                                </a>
                            </div>
                            <div class="product-media">
                                <a href="product-details.html">
                                    <img class="img-fluid" src="assets/img/product-4.jpg" title="" alt="">
                                </a>
                                <div class="product-cart-btn">
                                    <a href="shopping-cart.html" class="btn btn-primary btn-sm w-100">
                                        <i class="bi bi-cart"></i>
                                        Add to cart 
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="product-card-info">
                            <div class="product-meta small">
                                <a href="shop-fw-without-filtres.html">Clothing</a>
                                ,<a href="shop-fw-without-filtres.html">Men</a>
                            </div>
                            <div class="rating-star text">
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star"></i>
                            </div>
                            <h6 class="product-title">
                                <a href="shop-fw-without-filtres.html">Fine-knit sweater</a>
                            </h6>
                            <div class="product-price">
                                <span class="text-primary">
                                    $28.<small>50</small>
                                </span>
                                <del class="fs-sm text-muted">
                                    $38.<small>50</small>
                                </del>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="p-2">
                    <div class="product-card-1">
                        <div class="product-card-image">
                            <div class="badge-ribbon">
                                <span class="badge bg-danger">Sale</span>
                            </div>
                            <div class="product-action">
                                <a href="wishlist.html" class="btn btn-outline-primary">
                                    <i class="bi bi-heart"></i>
                                </a>
                                <a href="shop-compare.html" class="btn btn-outline-primary">
                                    <i class="bi bi-arrow-left-right"></i>
                                </a>
                                <a data-bs-toggle="modal" data-bs-target="#px-quick-view" href="javascript:void(0)" class="btn btn-outline-primary">
                                    <i class="bi bi-eye-fill"></i>
                                </a>
                            </div>
                            <div class="product-media">
                                <a href="product-details.html">
                                    <img class="img-fluid" src="assets/img/product-5.jpg" title="" alt="">
                                </a>
                                <div class="product-cart-btn">
                                    <a href="shopping-cart.html" class="btn btn-primary btn-sm w-100">
                                        <i class="bi bi-cart"></i>
                                        Add to cart 
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="product-card-info">
                            <div class="product-meta small">
                                <a href="shop-fw-without-filtres.html">Clothing</a>
                                ,<a href="shop-fw-without-filtres.html">Men</a>
                            </div>
                            <div class="rating-star text">
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star"></i>
                            </div>
                            <h6 class="product-title">
                                <a href="shop-fw-without-filtres.html">Fine-knit sweater</a>
                            </h6>
                            <div class="product-price">
                                <span class="text-primary">
                                    $28.<small>50</small>
                                </span>
                                <del class="fs-sm text-muted">
                                    $38.<small>50</small>
                                </del>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="p-2">
                    <div class="product-card-1">
                        <div class="product-card-image">
                            <div class="badge-ribbon">
                                <span class="badge bg-danger">Sale</span>
                            </div>
                            <div class="product-action">
                                <a href="wishlist.html" class="btn btn-outline-primary">
                                    <i class="bi bi-heart"></i>
                                </a>
                                <a href="shop-compare.html" class="btn btn-outline-primary">
                                    <i class="bi bi-arrow-left-right"></i>
                                </a>
                                <a data-bs-toggle="modal" data-bs-target="#px-quick-view" href="javascript:void(0)" class="btn btn-outline-primary">
                                    <i class="bi bi-eye-fill"></i>
                                </a>
                            </div>
                            <div class="product-media">
                                <a href="product-details.html">
                                    <img class="img-fluid" src="assets/img/product-6.jpg" title="" alt="">
                                </a>
                                <div class="product-cart-btn">
                                    <a href="shopping-cart.html" class="btn btn-primary btn-sm w-100">
                                        <i class="bi bi-cart"></i>
                                        Add to cart 
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="product-card-info">
                            <div class="product-meta small">
                                <a href="shop-fw-without-filtres.html">Clothing</a>
                                ,<a href="shop-fw-without-filtres.html">Men</a>
                            </div>
                            <div class="rating-star text">
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star-fill active"></i>
                                <i class="bi bi-star"></i>
                            </div>
                            <h6 class="product-title">
                                <a href="shop-fw-without-filtres.html">Fine-knit sweater</a>
                            </h6>
                            <div class="product-price">
                                <span class="text-primary">
                                    $28.<small>50</small>
                                </span>
                                <del class="fs-sm text-muted">
                                    $38.<small>50</small>
                                </del>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Product section -->
    <!-- Count Down -->
    <section class="bg-cover bg-no-repeat" style="background-image: url(assets/img/bg-banner-2.jpg);">
        <div class="container">
            <div class="row justify-content-end py-12">
                <div class="col-md-8 col-lg-6 col-xxl-5 py-lg-8">
                    <div class="p-4 p-xl-6 bg-white">
                        <h3 class="h1">
                            Get -50% from <br/>Summer Collection
                        </h3>
                        <h6>Hurry up!Limited time offer</h6>
                        <div class="count-down count-down-01 py-4" data-countdown="January 01, 2022 15:00:00"></div>
                        <div>
                            <a href="shop-list-fw-without-filtres.html" class="btn btn-primary" href="javascript:void(0);">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Count Down -->
    <!-- blog -->
    <section class="section">
        <div class="container">
            <div class="row justify-content-center mb-4">
                <div class="col-lg-6 text-center">
                    <h3 class="h2 mb-2">New Blog Posts</h3>
                    <p class="fs-6 m-0">Read Today’s News.</p>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 my-3">
                    <div class="hover-scale text-center">
                        <div class="hover-scale-in position-relative">
                            <a href="shop-fw-without-filtres.html">
                                <img class="img-fluid" src="assets/img/blog-home-1.jpg" title="" alt="">
                            </a>
                            <div class="position-absolute top-0 start-0 mt-3 ms-3 bg-white d-flex flex-column align-items-center px-3 py-2">
                                <span class="h4 m-0">25</span>
                                <small>MAR</small>
                            </div>
                        </div>
                        <div class="pt-3 px-3">
                            <h5>
                                <a class="text-reset" href="shop-fw-without-filtres.html">Make your Marketing website</a>
                            </h5>
                            <p>Lorem ipsum dolor sit amet,consectetur adipisicing elit,sed do eiusmod tempor incididunt</p>
                            <a class="btn btn-sm btn-outline-dark" href="javascript:(0);">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 my-3">
                    <div class="hover-scale text-center">
                        <div class="hover-scale-in position-relative">
                            <a href="shop-fw-without-filtres.html">
                                <img class="img-fluid" src="assets/img/blog-home-2.jpg" title="" alt="">
                            </a>
                            <div class="position-absolute top-0 start-0 mt-3 ms-3 bg-white d-flex flex-column align-items-center px-3 py-2">
                                <span class="h4 m-0">25</span>
                                <small>MAR</small>
                            </div>
                        </div>
                        <div class="pt-3 px-3">
                            <h5>
                                <a class="text-reset" href="shop-fw-without-filtres.html">Make your Marketing website</a>
                            </h5>
                            <p>Lorem ipsum dolor sit amet,consectetur adipisicing elit,sed do eiusmod tempor incididunt</p>
                            <a class="btn btn-sm btn-outline-dark" href="javascript:void(0)">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 my-3">
                    <div class="hover-scale text-center">
                        <div class="hover-scale-in position-relative">
                            <a href="shop-fw-without-filtres.html">
                                <img class="img-fluid" src="assets/img/blog-home-3.jpg" title="" alt="">
                            </a>
                            <div class="position-absolute top-0 start-0 mt-3 ms-3 bg-white d-flex flex-column align-items-center px-3 py-2">
                                <span class="h4 m-0">25</span>
                                <small>MAR</small>
                            </div>
                        </div>
                        <div class="pt-3 px-3">
                            <h5>
                                <a class="text-reset" href="shop-fw-without-filtres.html">Make your Marketing website</a>
                            </h5>
                            <p>Lorem ipsum dolor sit amet,consectetur adipisicing elit,sed do eiusmod tempor incididunt</p>
                            <a class="btn btn-sm btn-outline-dark" href="javascript:void(0)">Read more</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End blog -->
    <!-- Privacy Policy -->
    <section class="py-5 bg-gray-100 border-top">
        <div class="container">
            <div class="row g-3">
                <div class="col-sm-6 col-lg-3">
                    <div class="d-flex">
                        <div class="fs-1 lh-1 text-primary">
                            <i class="bi bi-truck"></i>
                        </div>
                        <div class="col ps-3">
                            <h6 class="mb-1">Free shipping</h6>
                            <p class="m-0">Lorem ipsum dolor sit amet</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="d-flex">
                        <div class="fs-1 lh-1 text-primary">
                            <i class="bi bi-headphones"></i>
                        </div>
                        <div class="col ps-3">
                            <h6 class="mb-1">Contact us 24/7</h6>
                            <p class="m-0">Lorem ipsum dolor sit amet</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="d-flex">
                        <div class="fs-1 lh-1 text-primary">
                            <i class="bi bi-box-arrow-in-left"></i>
                        </div>
                        <div class="col ps-3">
                            <h6 class="mb-1">30 Days Return</h6>
                            <p class="m-0">Lorem ipsum dolor sit amet</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="d-flex">
                        <div class="fs-1 lh-1 text-primary">
                            <i class="bi bi-shield-lock"></i>
                        </div>
                        <div class="col ps-3">
                            <h6 class="mb-1">100% Secure Payment</h6>
                            <p class="m-0">Lorem ipsum dolor sit amet</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Privacy Policy -->
</div>
<!-- End Main -->

<!-- Footer -->
	<%@include file="./common/footer.jsp" %>
<!-- END Footer -->
<script src="assets/js/sys/index.js"></script>
</body>
<!-- end body -->
</html>
