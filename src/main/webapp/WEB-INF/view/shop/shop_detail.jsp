<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../common/header.jsp" %>
   	<!-- END Header -->
    <!-- Main -->
    <form name="form" method="post">
    	<input type="hidden" name="member_id" value="${userInfo.member_id}">
		<input type="hidden" name="member_name" value="${userInfo.member_name}">
    </form>
    <div>
    <c:forEach items="${optProList }" var="ovo">
    	<input type="hidden" name="goods_id" value="${ovo.goods_id }"/>
    	<input type="hidden" name="opt_goods_id" value="${ovo.opt_goods_id }"/>
    	<input type="hidden" name="promotion_price" value="${ovo.promotion_price }"/>
    </c:forEach>
        <!-- Product Details -->
        <section class="product-details py-6">
            <div class="container">
                <div class="row">
                    <!-- Product Gallery -->
                    <div class="col-lg-6 lightbox-gallery product-gallery">
                        <div class="slick-carousel product-slider border rounded" data-slick='{
                                "slidesToShow": 1,
                                "slidesToScroll": 1,
                                "arrows": false,
                                "fade": true,
                                "asNavFor": ".product-thumb"
                            }'>
                            <c:forEach items="${optProList }" var="ovo">
	                            <div>
	                                <a class="gallery-link" href="#"><i class="bi bi-arrows-fullscreen"></i></a>
	                                <img src="${ovo.img_url }" class="img-detail-h500" title="" alt="">
	                            </div>
                            </c:forEach>
                        </div>
                        <div class="product-attribute">
                            <div class="slick-carousel product-thumb mt-3" data-slick='{
	                            "slidesToShow": 3,
	                            "slidesToScroll": 1,
	                            "asNavFor": ".product-slider",
	                            "centerMode": true,
	                            "focusOnSelect": true,
	                            "responsive": [
	                            		{
	                                        "breakpoint":1200,
	                                        "settings":{
	                                            "slidesToShow": 5
	                                        }
	                                    },
	                                    {
	                                        "breakpoint":992,
	                                        "settings":{
	                                            "slidesToShow": 4
	                                        }
	                                    },
	                                    {
	                                        "breakpoint":768,
	                                        "settings":{
	                                            "slidesToShow": 3
	                                        }
	                                    },
	                                    {
	                                        "breakpoint":576,
	                                        "settings":{
	                                            "slidesToShow": 2
	                                        }
	                                    }
	                            ]
	                        }'>
		                    <c:forEach items="${optProList }" var="ovo">
		                    <div>
			                	<div class="img_selected">
			                   		<img src="${ovo.img_url }" class="img-detail-h100" title="" alt="">
			                   		<input type="hidden" name="goods_id" value="${ovo.goods_id }"/>
						            <input type="hidden" name="opt_goods_id" value="${ovo.opt_goods_id }"/>
			                    </div>
			                </div>
		                    </c:forEach>
	                        </div>
                       </div>
                   </div>
                   <!-- End Product Gallery -->
                   <!-- Product Details -->
                   <div class="col-lg-6 ps-lg-5">
                       <div class="product-detail pt-4 pt-lg-0">
                           <div class="products-brand pb-2">
                               <span>品牌</span>
                           </div>
                           <div class="products-title mb-2">
                               <h4 class="h4">${prdInfo.brand_name}</h4>
                           </div>
                           <div class="rating-star text small pb-4">
                            	<c:forEach begin="0" end="${prdInfo.star }">
	                                <i class="bi bi-star-fill active"></i>
                            	</c:forEach>
                                <small>(4 Reviews )</small>
                            </div>
                            <div class="slick-carousel product-slider rounded" data-slick='{
	                                "slidesToShow": 1,
	                                "slidesToScroll": 1,
	                                "arrows": false,
	                                "fade": true,
	                                "asNavFor": ".product-thumb"
	                            }'>
	                            <c:forEach items="${optProList }" var="ovo">
		                            <div class="option-name fs-4 fw-500 mb-2">
		                                <span class="text-secondary">${ovo.opt_goods_name}</span>
		                            </div>
	                            </c:forEach>
	                        </div>
                            <div class="product-description">
                            	<div class="slick-carousel product-thumb" data-slick='{
		                            "slidesToShow": 3,
		                            "slidesToScroll": 1,
		                            "asNavFor": ".product-slider",
		                            "centerMode": true,
		                            "focusOnSelect": true,
		                            "responsive": [
		                            	{
	                                        "breakpoint":1200,
	                                        "settings":{
	                                            "slidesToShow": 5
	                                        }
	                                    },
	                                    {
	                                        "breakpoint":992,
	                                        "settings":{
	                                            "slidesToShow": 4
	                                        }
	                                    },
	                                    {
	                                        "breakpoint":768,
	                                        "settings":{
	                                            "slidesToShow": 3
	                                        }
	                                    },
	                                    {
	                                        "breakpoint":576,
	                                        "settings":{
	                                            "slidesToShow": 2
	                                        }
	                                    }
		                            ]
		                        }'>
				                    <c:forEach items="${optProList }" var="ovo">
				                    	<div>
					                    	<div class="text_border opt_selected">
						                   		<a href="javascript:void(0);">${ovo.opt_sub_name }
						                   			<br>
						                   			<span class="text-800">JP&yen;${ovo.promotion_price }</span>
						                   			<input type="hidden" name="goods_id" value="${ovo.goods_id }"/>
						                   			<input type="hidden" name="opt_goods_id" value="${ovo.opt_goods_id }"/>
						                   		</a>
					                    	</div>
				                    	</div>
				                    </c:forEach>
	                        	</div>
                            </div>
                            
                            <div class="count-down count-down-02 mt-6 mb-3" data-countdown="January 01, 2022 15:00:00"></div>
                            
                            <div class="slick-carousel product-slider rounded" data-slick='{
	                                "slidesToShow": 1,
	                                "slidesToScroll": 1,
	                                "arrows": false,
	                                "fade": true,
	                                "asNavFor": ".product-thumb"
	                            }'>
	                            <c:forEach items="${optProList }" var="ovo">
		                            <div class="product-price fs-3 fw-500 mb-2">
		                                <del class="text-muted fs-6">JP&yen;${ovo.price }</del>
		                                <span class="text-primary promotion_price">JP&yen;${ovo.promotion_price }</span>
		                            </div>
	                            </c:forEach>
	                        </div>
                            <div class="product-detail-actions d-flex flex-wrap pt-3">
                                <div class="cart-qty me-3 mb-3">
                                    <div class="dec qty_btn">-</div>
                                    <input class="cart_qty_input form-control" type="text" name="qtybutton" value="1" readonly>
                                    <div class="inc qty_btn">+</div>
                                </div>
                                <div class="cart-button mb-3 d-flex">
                                    <a href="shopping-cart.html" class="btn btn-dark me-3">
                                        <i class="bi bi-cart"></i>
                                        	立即购买
                                    </a>
                                    <a href="wishlist.html" class="btn btn-outline-dark me-3">
                                        <i class="bi bi-heart"></i>
                                    </a>
                                    <a href="shop-compare.html" class="btn btn-outline-primary">
                                        <i class="bi bi-arrow-left-right"></i>
                                    </a>
                                </div>
                            </div>
                         </div>
                      </div>
                    <!-- End Product Details -->
                </div>
            </div>
        </section>
        <!-- End Product Details -->
        <!-- Product Tabs -->
        <section class="pb-6 py-md-6 pb-lg-10 pt-lg-5">
            <div class="container">
                <div class="product-tabs">
                    <ul class="nav product-nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a href="javascript:void(0);" class="nav-link active" id="pd_description_tab" data-bs-toggle="tab" data-bs-target="#pd_description" role="tab" aria-controls="pd_description" aria-selected="true">商品描述</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a href="javascript:void(0);" class="nav-link" id="pd_information_tab" data-bs-toggle="tab" data-bs-target="#px_information" role="tab" aria-controls="px_information" aria-selected="false">商品信息</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a href="javascript:void(0);" class="nav-link" id="pd_reviews_tab" data-bs-toggle="tab" data-bs-target="#pd_reviews" role="tab" aria-controls="pd_reviews" aria-selected="false">Reviews</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="pd_description" role="tabpanel" aria-labelledby="pd_description_tab">
                            <div class="row">
                                <div class="col-lg-7 pe-lg-10">
                                    <h5>商品描述</h5>
                                    <div id="prd_dec">
			                        </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="px_information" role="tabpanel" aria-labelledby="pd_information_tab">
                            <div class="row">
                                <div class="col-lg-7 pe-lg-10">
                                 <h5>商品信息</h5>
	                                <div id="prd_info">
			                        </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="pd_reviews" role="tabpanel" aria-labelledby="pd_reviews_tab">
                            <div class="row">
                                <div class="col-lg-8 pe-lg-8">
                                    <div class="row align-items-end">
                                        <div class="col-sm-6">
                                            <h5 class="m-0">Reviews</h5>
                                            <div class="rating-star small">
                                                <i class="bi small bi-star-fill active"></i>
                                                <i class="bi small bi-star-fill active"></i>
                                                <i class="bi small bi-star-fill active"></i>
                                                <i class="bi small bi-star-fill active"></i>
                                                <i class="bi small bi-star"></i>
                                                <span>4.85/5 (400 Reviews)</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 text-sm-end">
                                            <a href="javascript:void(0);">View all review</a>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="col ps-3">
                                            <h6>Nancy Bayer</h6>
                                            <div class="rating-star small">
                                                <i class="bi small bi-star-fill active"></i>
                                                <i class="bi small bi-star-fill active"></i>
                                                <i class="bi small bi-star-fill active"></i>
                                                <i class="bi small bi-star-fill active"></i>
                                                <i class="bi small bi-star"></i>
                                                <span>13 April 2012</span>
                                            </div>
                                            <p class="m-0 pt-3">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="border p-4 sticky-lg-top review-form mt-4 mt-lg-0">
                                        <h5 class="mb-3 pb-3 border-bottom">WRITE A REVIEW</h5>
                                        <form>
                                            <div class="row g-2">
                                                <div class="col-sm-6">
                                                    <label class="form-label">Name</label>
                                                    <input type="text" name="name" class="form-control form-control-sm">
                                                </div>
                                                <div class="col-sm-6">
                                                    <label class="form-label">Email</label>
                                                    <input type="text" name="email" class="form-control form-control-sm">
                                                </div>
                                                <div class="col-sm-12">
                                                    <label class="form-label m-0 pe-3 w-100">Rating</label>
                                                    <div class="rating-star">
                                                        <i class="bi small bi-star-fill"></i>
                                                        <i class="bi small bi-star-fill"></i>
                                                        <i class="bi small bi-star-fill"></i>
                                                        <i class="bi small bi-star-fill"></i>
                                                        <i class="bi small bi-star-fill"></i>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <label class="form-label">Review Title</label>
                                                    <input type="text" name="review" class="form-control form-control-sm">
                                                </div>
                                                <div class="col-sm-12">
                                                    <label class="form-label">Body of Review (1500)</label>
                                                    <textarea rows="5" class="form-control"></textarea>
                                                </div>
                                                <div class="col-sm-12 pt-2">
                                                    <button type="button" class="btn btn-primary">Submit Review</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Product Tabs -->
        <!-- 热销商品 -->
        <section class="section bg-gray-100">
            <div class="container">
                <div class="row justify-content-center mb-4 mb-lg-6">
                    <div class="col-lg-6 text-center">
                        <h3 class="h2 mb-2">热销商品</h3>
                        <p class="fs-6 m-0">猜您喜欢</p>
                    </div>
                </div>
                <div class="slick-carousel slick-nav-dark" data-slick='{
                    "slidesToShow": 4,
                    "slidesToScroll": 1,
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
                <c:forEach items="${optProList }" var="ovo">
                	<div class="product-card-1">
                            <div class="product-card-image">
                                <div class="badge-ribbon">
                                    <span class="badge bg-danger">HOT</span>
                                </div>
                                <div class="product-action">
                                    <a href="wishlist.html" class="btn btn-outline-primary" tabindex="0">
                                        <i class="bi bi-heart"></i>
                                    </a>
                                     <a href="shop-compare.html" class="btn btn-outline-primary" tabindex="0">
                                        <i class="bi bi-arrow-left-right"></i>
                                    </a>
                                    <a data-bs-toggle="modal" data-bs-target="#px-quick-view" href="javascript:void(0)" class="btn btn-outline-primary" tabindex="0">
                                        <i class="bi bi-eye-fill"></i>
                                    </a>
                                </div>
                                <div class="product-media">
                                    <a href="product-details.html" tabindex="0">
                                        <img class="img-detail-h200" src="${ovo.img_url }" title="" alt="">
                                    </a>
                                    <div class="product-cart-btn">
                                         <a href="shopping-cart.html" class="btn btn-primary btn-sm w-100" tabindex="0">
                                            <i class="bi bi-cart"></i>
                                            	添加购物车
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="product-card-info">
                                <div class="product-meta small">
                                    <a href="shop-fw-without-filtres.html" tabindex="0">Clothing</a>, <a href="shop-fw-without-filtres.html" tabindex="0">Men</a>
                                </div>
                                <div class="rating-star text">
                                    <i class="bi bi-star-fill active"></i>
                                    <i class="bi bi-star-fill active"></i>
                                    <i class="bi bi-star-fill active"></i>
                                    <i class="bi bi-star-fill active"></i>
                                    <i class="bi bi-star"></i>
                                </div>
                                <h6 class="product-title">
                                    <a href="shop-fw-without-filtres.html" tabindex="0">Fine-knit sweater</a>
                                </h6>
                                <div class="product-price">
		                           <span class="text-primary promotion_price">JP&yen;${ovo.promotion_price }</span>
		                           <del class="text-muted fs-6">JP&yen;${ovo.price }</del>
		                        </div>
                            </div>
                        </div>
                </c:forEach>
                </div>
            </div>
        </section>
        <!-- End You may also like -->
    </div>
    <!-- End Main -->
    <!-- Footer -->
    <%@include file="../common/footer.jsp" %>
    <!-- End Footer -->
    <script src="../assets/js/shop/shop_detail.js?${js_timer}"></script>	