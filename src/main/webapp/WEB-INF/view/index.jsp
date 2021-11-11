<%@page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html class="" lang="zh">
<head>
	<title>购购SG</title>
	<meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
		<link rel="stylesheet" href="assets/css/cart/common.css">
		<link rel="stylesheet" href="assets/css/cart/ui.css?val=20210316">
		<link rel="stylesheet" href="assets/css/cart/ui_add.css?ver=20210621">
		<link rel="stylesheet" href="assets/css/cart/slick.css">
		<!-- <link rel="stylesheet" href="assets/css/cart/response.css"> -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/boxicons.min.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/meanmenu.min.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
        <link rel="icon" type="image/x-icon" href="assets/img/logo.ico">
        <script type="text/javascript" src="assets/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery-ui.js"></script>
		<script type="text/javascript" src="assets/js/jquery.bxslider.js"></script>
		<script type="text/javascript" src="assets/js/jquery.cookie.js"></script>
		<script type="text/javascript" src="assets/js/cart/main.js?v=1"></script>
</head>
<body>

		<div class="preloader">
            <div class="lds-ripple">
                <div class="pl-flip-1 pl-flip-2"></div>
            </div>
        </div>
<!-- header  -->
	<%@include file="../view/common/header.jsp" %>
<!-- header End -->


<!-- 这是嵌套amazon商品 -->
<!--运维  -->
	<!-- <iframe  id='amazon' src="https://www.sgshop.top/amazon" width="100%" frameborder='0' class='frame-height'>
	</iframe> -->
<!--本地  -->
	<!-- <iframe  id='amazon' src="http://localhost/amazon" width="100%" frameborder='0' class='frame-height'>
	</iframe> -->
	<!--产品 模块  -->
	<form name="frm" method="post">
	<div id="container">
	<section class="mainNewPdt2">
		<h2 class="subTitle">NEW产品</h2>
			<div class="contWrap">
				<div class="slide pdtListType">
					<ul class="swiper-wrapper slick-initialized slick-slider">
						<li class="swiper-slide">
						<input type="hidden" name="prdlist" >
							<span class="pdtOver">
								<a  onclick="javascript:setCart('PD0000001',0)"  class="pdtImg" tabindex="-1">
									<span class="stikerWrap">
									</span>
									<span class="labelWrap">
									</span>
									<img src="https://images.innisfree.co.kr/upload/product/29802_p_S_320.jpg?T202106271347" alt="Product1 SPF 50+ PA++++">
									<img src="https://images.innisfree.co.kr/upload/product/29802_p1_S_320.jpg?T202106271347" class="over">
								</a>
								<span class="pdtUtil">
									<button type="button" class="iconCart" onclick="javascript:setCart('PD0000001',0);" tabindex="-1">장바구니</button>
								</span>
							</span>
							<a  onclick="javascript:setCart('PD0000001',0)" class="pdtCont" tabindex="-1">
								<span class="txt" style="color:"></span>
								<span class="name">商品名：Product1 SPF 50+ PA++++</span>
								<span class="name">商品编码：PD0000001</span>
									<span class="price">
										<span class="num">50</span>￥
									</span>
								<span class="pdtStatus">
									<span class="iconNew">NEW</span>
								</span>
							</a>
						</li>
						<li class="swiper-slide">
						<input type="hidden" name="prdlist" >
							<span class="pdtOver">
								<a  onclick="javascript:setCart('PD0000002',1)"class="pdtImg" tabindex="-1">
									<span class="stikerWrap">
										<strong class="stikerType1">30%</strong>
									</span>
									<span class="labelWrap">
										<span><img src="https://images.innisfree.co.kr/upload/product/E01_113_0.png?T202106252307" ></span>
										<span><img src="https://images.innisfree.co.kr/upload/product/E01_107_0.png?T202106252307" ></span>
										<span><img src="https://images.innisfree.co.kr/upload/product/E01_109_0.png?T202106252307" ></span>
									</span>
									<img src="https://images.innisfree.co.kr/upload/product/29302_l_S_250.jpg?T202106271517" alt="Product2 SPF 50+" >
									<img src="https://images.innisfree.co.kr/upload/product/29302_l1_S_250.jpg?T202106271517" class="over" >
								</a>
								<span class="pdtUtil">
									<button type="button" class="iconCart" onclick="javascript:setCart('PD0000002',1);" tabindex="-1">장바구니</button>
								</span>
							</span>
							<a  onclick="javascript:setCart('PD0000002',1)" class="pdtCont" tabindex="-1">
								<span class="txt" style="color:"></span>
								<span class="name">商品名：Product2 SPF 50+</span>
								<span class="name">商品编码：PD0000002</span>
									<span class="price">
										<del class="regular">69.9</del>
										<span class="num">50</span>$
									</span>
								<span class="pdtStatus">
									<span class="iconNew">NEW</span>
									<span class="iconGift">GIFT</span>
									<span class="iconSale">SALE</span>
								</span>
							</a>
						</li>
						<li class="swiper-slide">
						<input type="hidden" name="prdlist" >
							<span class="pdtOver">
								<a  onclick="javascript:setCart('PD0000003',2)" class="pdtImg" tabindex="-1">
									<span class="stikerWrap">
									</span>
									<span class="labelWrap">
													<span><img src="https://images.innisfree.co.kr/upload/product/E01_118_0.png?T202106252307" ></span>
									</span>
									<img src="https://images.innisfree.co.kr/upload/product/24588_l_S_250.jpg?T202106271527" alt="Product3 Sample 50+" >
									<img src="https://images.innisfree.co.kr/upload/product/24588_l_S_250.jpg?T202106271527" class="over" >
								</a>
								<span class="pdtUtil">
									<button type="button" class="iconCart" onclick="javascript:setCart('PD0000003',2);" tabindex="-1">장바구니</button>
								</span>
							</span>
							<a  onclick="javascript:setCart('PD0000003',2)" class="pdtCont" tabindex="-1">
								<span class="txt" style="color:#0083d8"></span>
								<span class="name">商品名：Product3 Sample 50+</span>
								<span class="name">商品编码：PD0000003</span>
									<span class="price">
										<span class="num">30</span>$
									</span>
								<span class="pdtStatus">
									<span class="iconNew">NEW</span>
								</span>
							</a>
						</li>
						<li class="swiper-slide">
						<input type="hidden" name="prdlist" >
							<span class="pdtOver">
								<a  onclick="javascript:setCart('PD0000004',3)" class="pdtImg" tabindex="-1">
									<span class="stikerWrap">
									</span>
									<span class="labelWrap">
									</span>
									<img src="https://images.innisfree.co.kr/upload/product/5424_l_S_250.jpg?T202106271527" alt="Product4 Sample spa++" >
									<img src="https://images.innisfree.co.kr/upload/product/5424_l1_S_250.jpg?T202106271527" class="over" >
								</a>
								<span class="pdtUtil">
									<button type="button" class="iconCart" onclick="javascript:setCart('PD0000004',3);" tabindex="-1">장바구니</button>
								</span>
							</span>
							<a  onclick="javascript:setCart('PD0000004',3)" class="pdtCont" tabindex="-1">
								<span class="txt" style="color:"></span>
								<span class="name">商品名：Product4 Sample spa++</span>
								<span class="name">商品编码：PD0000004</span>
									<span class="price">
										<span class="num">40</span>$
									</span>
								<span class="pdtStatus">
									<span class="iconNew">NEW</span>
								</span>
							</a>
						</li>
						<li class="swiper-slide">
						<input type="hidden" name="prdlist" >
							<span class="pdtOver">
								<a  onclick="javascript:setCart('PD0000005',4)" class="pdtImg" tabindex="-1">
									<span class="stikerWrap">
									</span>
									<span class="labelWrap">
									</span>
									<img src="https://images.innisfree.co.kr/upload/product/20446_l_S_250.jpg" alt="Product5 Sample spa++" >
									<img src="https://images.innisfree.co.kr/upload/product/20446_l1_S_250.jpg" class="over" >
								</a>
								<span class="pdtUtil">
									<button type="button" class="iconCart" onclick="javascript:setCart('PD0000005',3);" tabindex="-1">장바구니</button>
								</span>
							</span>
							<a  onclick="javascript:setCart('PD0000005',4)" class="pdtCont" tabindex="-1">
								<span class="txt" style="color:"></span>
								<span class="name">商品名：Product5</span>
								<span class="name">商品编码：PD0000005</span>
									<span class="price">
										<span class="num">35</span>$
									</span>
								<span class="pdtStatus">
									<span class="iconNew">NEW</span>
								</span>
							</a>
						</li>
						<li class="swiper-slide" >
						<input type="hidden" name="prdlist" >
							<span class="pdtOver">
								<a  onclick="javascript:setCart('PD0000006',5)" class="pdtImg" tabindex="-1">
									<span class="stikerWrap">
									</span>
									<span class="labelWrap">
									</span>
									<img src="https://images.innisfree.co.kr/upload/product/28677_l_S_250.jpg" alt="Product6 Sample spa++" >
									<img src="https://images.innisfree.co.kr/upload/product/28677_l_S_250.jpg" class="over" >
								</a>
								<span class="pdtUtil">
									<button type="button" class="iconCart" onclick="javascript:setCart('PD0000006',3);" tabindex="-1">장바구니</button>
								</span>
							</span>
							<a  onclick="javascript:setCart('PD0000006',5)" class="pdtCont" tabindex="-1">
								<span class="txt" style="color:"></span>
								<span class="name">商品名：Product6</span>
								<span class="name">商品编码：PD0000006</span>
									<span class="price">
										<span class="num">20</span>$
									</span>
								<span class="pdtStatus">
									<span class="iconNew">NEW</span>
								</span>
							</a>
						</li>
						<li class="swiper-slide" >
						<input type="hidden" name="prdlist" >
							<span class="pdtOver">
								<a  onclick="javascript:setCart('PD0000007',6)" class="pdtImg" tabindex="-1">
									<span class="stikerWrap">
									</span>
									<span class="labelWrap">
									</span>
									<img src="https://images.innisfree.co.kr/upload/product/18239_l_S_250.jpg" alt="Product7 Sample spa++" >
									<img src="https://images.innisfree.co.kr/upload/product/18239_l_S_250.jpg" class="over" >
								</a>
								<span class="pdtUtil">
									<button type="button" class="iconCart" onclick="javascript:setCart('PD0000007',3);" tabindex="-1">장바구니</button>
								</span>
							</span>
							<a  onclick="javascript:setCart('PD0000007',6)" class="pdtCont" tabindex="-1">
								<span class="txt" style="color:"></span>
								<span class="name">商品名：Product7</span>
								<span class="name">商品编码：PD0000007</span>
									<span class="price">
										<span class="num">21</span>$
									</span>
								<span class="pdtStatus">
									<span class="iconNew">NEW</span>
								</span>
							</a>
						</li>
						<li class="swiper-slide">
						<input type="hidden" name="prdlist" >
							<span class="pdtOver">
								<a  onclick="javascript:setCart('PD0000008',7)" class="pdtImg" tabindex="-1">
									<span class="stikerWrap">
									</span>
									<span class="labelWrap">
									</span>
									<img src="https://images.innisfree.co.kr/upload/product/28738_l_S_250.jpg" alt="Product8 Sample spa++" >
									<img src="https://images.innisfree.co.kr/upload/product/28738_l_S_250.jpg" class="over" >
								</a>
								<span class="pdtUtil">
									<button type="button" class="iconCart" onclick="javascript:setCart('PD0000008',3);" tabindex="-1">장바구니</button>
								</span>
							</span>
							<a  onclick="javascript:setCart('PD0000008',7)" class="pdtCont" tabindex="-1">
								<span class="txt" style="color:"></span>
								<span class="name">商品名：Product8</span>
								<span class="name">商品编码：PD0000008</span>
									<span class="price">
										<span class="num">15</span>$
									</span>
								<span class="pdtStatus">
									<span class="iconNew">NEW</span>
								</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
	</section>
	</div>
	</form>
<!-- footer -->
	<%@include file="../view/common/footer.jsp" %>
<!-- footer End -->
	<!--添加购物车  -->
	<div id="pdtInCart" class="layerPop" style="display: none;">
		<section class="layerWrap" style="width:480px;">
			<h3 class="layerTitle">添加购物车</h3>
			<div class="layerContents">
				<div class="alertCont">
					<p class="txt4">
						已添到购物车
					</p>
				</div>
				<div class="btnWrap">
					<span><button type="button" class="btnType3" onclick="layerClose();">继续购买</button></span>
					<span><a href="javascript:fnCartPage();" class="btnType6">看购物车</a></span>
				</div>
			</div>
			<button type="button" class="btnLayerClose" onclick="layerClose();">레이어 팝업 닫기</button>
		</section>
	</div>
	
</body>
</html>





       

