<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>购物车</title>
<meta http-equiv="Content-Type" content="application/octet-stream; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="generator" content="editplus">
<meta name="subject" content="">
<meta name="description" content="Paypal 연동 테스트입니다.">
<meta name="author" content="姜世权">
<meta name="copyright" content="">
<meta name="writer" content="">
<meta name="language" content="">
<meta name="build" content="">
<script type="text/javascript" src="assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="assets/js/jquery-ui.js"></script>
<script type="text/javascript" src="assets/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="assets/js/jquery.cookie.js"></script>

<link rel="icon" type="image/x-icon" href="assets/img/logo.ico">
<link rel="stylesheet" href="https://images.innisfree.co.kr/resources/fonts/lite/fonts.css">
<link rel="stylesheet" href="assets/css/cart/common.css">
<link rel="stylesheet" href="assets/css/cart/ui.css?val=20210316">
<link rel="stylesheet" href="assets/css/cart/ui_add.css?ver=20210621">
<link rel="stylesheet" href="assets/css/cart/slick.css">
<link rel="stylesheet" href="assets/css/cart/response.css">

<script type="text/javascript" src="assets/js/cart/cart.js?v=1"></script>

<form name="frm" method="post">
<input type="hidden" name="orderID" id= "orderID"><!-- 订单号码-->
<input type="hidden" name="payerID" id= "payerID"><!-- payer号码-->
<input type="hidden" id="chkFlag" value="N"><!-- 信息flag  -->
<div id="container">
	<h2 class="orderTitle">购物车</h2>
	<div class="orderContents">
		<div class="orderWrap">
			<div id="cartArea" class="cartArea">
				<div class="cartListChk">
					<input  class="inputChk"  type="checkbox" name="selCartSeqAll" id="selCartSeqAll" onchange="selectAll(this);" checked="checked"> <span>全部</span>
					<div class="btnRight">
						<button type="button" class="btnType7s" onclick="cartDel();"><span>删除</span></button>
					</div>
				</div>
					<div class="cartList" id="chkWrap">
						<ul>
							<c:choose>
								<c:when test="${!empty prdlist}">
									<c:forEach var="rvo" items="${prdlist}" varStatus="status">
									<li id="prdRow_${status.index }" style="display:block;">
										<div class="pdtRow">	
										<input type="hidden" name="prdprice" id="prdprice_${status.index }" value="${rvo.prdprice}"><!-- 商品单价 -->
										<input type="hidden" name="prdqty" id="prdqty_${status.index }" value="1"><!-- 商品数量 -->
										<input type="hidden" name="prdname" value="${rvo.prdname}"><!-- 商品名 -->
										<input type="hidden" name="prdcd" value="${rvo.prdcd}"><!-- 商品编码 -->
										<input type="hidden" name="selPrdFlag" ><!-- 商品flag-->
										<div class="cell pdtChk">
											<input class="inputChk onlyType"  type="checkbox" name="selCartSeq" id="selCartSeq_${status.index }" onclick="totChange();" checked="checked">
										</div>
										<div class="cell pdtImg">
											<a href="javascript:void(0);">
												<img src="${rvo.img}" style="cursor:pointer;" alt="{rvo.prdname}">
											</a>
										</div>
										<div class="cell pdtInfo pdtstate">
											<span class="state1">${rvo.optname}</span>
											<div class="pdtName">
												<a href="javascript:void(0);">
													商品名：${rvo.prdname}
												</a>
											</div>
											<div class="pdtName">
												<a href="javascript:void(0);">
													商品编码：${rvo.prdcd}
												</a>
											</div>
											<span class="price">
								            <span class="num">单价：${rvo.prdprice}</span> $</span>
										</div>
										<div class="cell pdtCount">
											<div class="countArea" id="countAreaprdOrd0Info">
												<button type="button" class="btnMinus" onclick="cartChange('minus', ${status.index }, this);">+</button>
												<input type="text" class="pdtQty" id="prdOrdQty_${status.index }" value="1" onblur="cartChange('text', ${status.index }, this);">
												<button type="button" class="btnPlus" onclick="cartChange('plus', ${status.index }, this);">-</button>
											</div>
										</div>
										<div class="cell pdtPrice">
											<div data-state="1" style="display: inline;">
												<span class="price">
								                <span class="num" id="prdOrdPrc_${status.index }">${rvo.prdprice}</span> $</span>
											</div>
										</div>
									</div>
									<div class="addPdtWrap">
				                    </div>
								</li>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<li class="nonList">
									购物车是空的~请添加商品！！！
								</li>
							</c:otherwise>
						</c:choose>
							<!-- <li>
								<div class="pdtRow">
									<input type="hidden" name="prdqty" id="prdqty_0" value="1">商品数量
									<input type="hidden" name="prdname" value="그린티 씨드 세럼 [대용량]160mL">商品名
									<input type="hidden" name="prdcd" value="PD0000001">商品编码
									<input type="hidden" name="selPrdFlag" >商品flag
									<div class="cell pdtChk">
											<input class="inputChk onlyType"  type="checkbox" name="selCartSeq" id="selCartSeq_0" onclick="totChange();" checked="checked">
									</div>
									<div class="cell pdtImg">
										<a href="javascript:void(0);">
											<img src="https://images.innisfree.co.kr/upload/product/29802_p_S_107.jpg?T202106251127" style="cursor:pointer;" alt="그린티 씨드 세럼 [대용량]160mL">
										</a>
									</div>
									<div class="cell pdtInfo pdtstate">
										<span class="state1">대량구매제한 1일 10개</span>
										<div class="pdtName">
											<a href="javascript:void(0);">
												그린티 씨드 세럼 [대용량]160mL
											</a>
										</div>
										<span class="price">
							            <span class="num">单价：50</span> $</span>
									</div>
									<div class="cell pdtCount">
										<div class="countArea" id="countAreaprdOrd0Info">
											<button type="button" class="btnMinus" onclick="cartChange('minus', 0, this);">+</button>
											<input type="text" class="pdtQty" id="prdOrdQty_0" value="1" onblur="cartChange('text', 0, this);">
											<button type="button" class="btnPlus" onclick="cartChange('plus', 0, this);">-</button>
										</div>
									</div>
									<div class="cell pdtPrice">
										<div data-state="1" style="display: inline;">
											<span class="price">
							                <span class="num" id="prdOrdPrc_0">50</span> $</span>
										</div>
									</div>
								</div>
								<div class="addPdtWrap">
			                    	</div>
							</li>
							<li>
								<div class="pdtRow">
									<input type="hidden" name="prdprice" id="prdprice_1" value="55">商品单价
									<input type="hidden" name="prdqty" id="prdqty_1" value="1">商品数量
									<input type="hidden" name="prdname" value="퍼펙트 9 리페어 EX 스킨 케어 세트">商品名
									<input type="hidden" name="prdcd" value="PD0000002">商品编码
									<input type="hidden" name="selPrdFlag" >商品flag
									<div class="cell pdtChk">
											<input class="inputChk onlyType"  type="checkbox" name="selCartSeq" id="selCartSeq_1" onclick="totChange();" checked="checked">
									</div>
									<div class="cell pdtImg">
										<a href="javascript:void(1);">
											<img src="https://images.innisfree.co.kr/upload/product/12177_l_S_107.jpg?T202106251627" style="cursor:pointer;" alt="퍼펙트 9 리페어 EX 스킨 케어 세트">
										</a>
									</div>
									<div class="cell pdtInfo pdtstate">
										<span class="state1">대량구매제한 1일 20개</span>
										<div class="pdtName">
											<a href="javascript:void(0);">
												퍼펙트 9 리페어 EX 스킨 케어 세트
											</a>
										</div>
										<span class="price">
							            <span class="num">单价：55</span> $</span>
									</div>
									<div class="cell pdtCount">
										<div class="countArea" id="countAreaprdOrd0Info">
											<button type="button" class="btnMinus" onclick="cartChange('minus', 1, this);">+</button>
											<input type="text" class="pdtQty" id="prdOrdQty_1" value="1" onblur="cartChange('text', 1, this);">
											<button type="button" class="btnPlus" onclick="cartChange('plus', 1, this);">-</button>
										</div>
									</div>
									<div class="cell pdtPrice">
										<div data-state="1" style="display: inline;">
											<span class="price">
							                <span class="num" id="prdOrdPrc_1">55</span> $</span>
										</div>
									</div>
								</div>
								<div class="addPdtWrap">
			                    	</div>
							</li>
							<li>
								<div class="pdtRow">
									<input type="hidden" name="prdprice" id="prdprice_2" value="77">商品单价
									<input type="hidden" name="prdqty" id="prdqty_2" value="1">商品数量
									<input type="hidden" name="prdname" value="한란 스킨케어 세트">商品名
									<input type="hidden" name="prdcd" value="PD0000003">商品编码
									<input type="hidden" name="selPrdFlag" >商品flag
									<div class="cell pdtChk">
											<input class="inputChk onlyType"  type="checkbox" name="selCartSeq" id="selCartSeq_2" onclick="totChange();" checked="checked">
									</div>
									<div class="cell pdtImg">
										<a href="javascript:void(2);">
											<img src="https://images.innisfree.co.kr/upload/product/17022_l_S_107.jpg?T202106251647" style="cursor:pointer;" alt="한란 스킨케어 세트">
										</a>
									</div>
									<div class="cell pdtInfo pdtstate">
										<span class="state1">대량구매제한 1일 5개</span>
										<div class="pdtName">
											<a href="javascript:void(2);">
												한란 스킨케어 세트
											</a>
										</div>
										<span class="price">
							            <span class="num">单价：77</span> $</span>
									</div>
									<div class="cell pdtCount">
										<div class="countArea" id="countAreaprdOrd0Info">
											<button type="button" class="btnMinus" onclick="cartChange('minus', 2, this);">+</button>
											<input type="text" class="pdtQty" id="prdOrdQty_2" value="1" onblur="cartChange('text', 2, this);">
											<button type="button" class="btnPlus" onclick="cartChange('plus', 2, this);">-</button>
										</div>
									</div>
									<div class="cell pdtPrice">
										<div data-state="1" style="display: inline;">
											<span class="price">
							                <span class="num" id="prdOrdPrc_2">77</span> $</span>
										</div>
									</div>
								</div>
								<div class="addPdtWrap">
			                    	</div>
							</li>
							<li>
								<div class="pdtRow">
									<input type="hidden" name="prdprice" id="prdprice_3" value="42">商品单价
									<input type="hidden" name="prdqty" id="prdqty_3" value="1">商品数量
									<input type="hidden" name="prdname" value="퍼펙트9리페어 크림 EX60ml">商品名
									<input type="hidden" name="prdcd" value="PD0000003">商品编码
									<input type="hidden" name="selPrdFlag" >商品flag
									<div class="cell pdtChk">
											<input class="inputChk onlyType"  type="checkbox" name="selCartSeq" id="selCartSeq_3" onclick="totChange();" checked="checked">
									</div>
									<div class="cell pdtImg">
										<a href="javascript:void(3);">
											<img src="https://images.innisfree.co.kr/upload/product/5501_l_S_107.jpg?T202106251707" style="cursor:pointer;" alt="퍼펙트 9 리페어 크림 EX60mL">
										</a>
									</div>
									<div class="cell pdtInfo pdtstate">
										<span class="state1">대량구매제한 1일 7개</span>
										<div class="pdtName">
											<a href="javascript:void(3);">
												퍼펙트9리페어 크림 EX60ml
											</a>
										</div>
										<span class="price">
							            <span class="num">单价：42</span> $</span>
									</div>
									<div class="cell pdtCount">
										<div class="countArea" id="countAreaprdOrd0Info">
											<button type="button" class="btnMinus" onclick="cartChange('minus', 3, this);">+</button>
											<input type="text" class="pdtQty" id="prdOrdQty_3" value="1" onblur="cartChange('text', 2, this);">
											<button type="button" class="btnPlus" onclick="cartChange('plus', 3, this);">-</button>
										</div>
									</div>
									<div class="cell pdtPrice">
										<div data-state="1" style="display: inline;">
											<span class="price">
							                <span class="num" id="prdOrdPrc_3">42</span> $</span>
										</div>
									</div>
								</div>
								<div class="addPdtWrap">
			                    	</div>
							</li> -->
						</ul>
					</div>
			</div>
		</div>
		<div class="totalPayment" id="totalPayment">
			<div class="inner">
				<div class="box">
				<p class="loginTxt">
					<button type="button" class="btnType2m" id="btn_info" onclick="javascript:document.getElementById('info_popup').style.display ='';">添加个人信息</button>
					<span id="show_address"></span>
					<span id="show_info"></span>
				</p>
				
				<section class="orderPrice">
					<h4 class="subTitle2">账单信息</h4>
					<dl>
						<dt>订单金额</dt>
						<dd><span class="num" id="totalOrdPrc">0</span>$</dd>
					</dl>
					<dl>
						<dt>配送费</dt>
							<dd id="totalDlvCost">免费</dd>
					</dl>
					<dl>
						<dt>数量</dt>
						<dd><span class="num" id="totalOrdQty">0</span>&nbsp;件</dd>
					</dl>
					<dl class="totalPrice">
						<dt>结账金额</dt>
						<dd><span class="num" id=totalPayPrc >0</span>$</dd>
					</dl>
				</section>
				</div>
				<button type="button" class="btnType4xl" id="cartPayBtn" onclick="layoutPay()">付款</button>
			</div>
		</div>
	</div>
	<footer id="footer">
	<div class="menuWrap">
		<div class="menu">
			<nav role="navigation" aria-label="Customer service">
				<a href="#" onclick="termsOpen('이용약관', 'termsService'); return false;">서비스 이용약관</a>
				<a href="#" onclick="termsOpen('개인정보처리방침', 'terms17'); return false;"><strong>개인정보처리방침</strong></a>
				<a href="#" onclick="termsOpen('영상정보처리기기 운영/관리 방침', 'terms20'); return false;">영상정보처리기기 운영/관리 방침</a>
				<a href="/kr/ko/NtcList.do">공지사항</a>
				<a href="javascript:empCert();">임직원서비스</a>
			</nav>
		
			<div class="ftsns">
				<span class="btnYoutube"><a href="https://www.youtube.com/user/ecoinnisfree11" target="_blank" rel="noopener noreferrer" title="새창">유튜브</a></span>
				<span class="btnInstagram"><a href="https://www.instagram.com/innisfreeofficial/" target="_blank" title="새창" onclick="makeScriptGA_Event('PC_FOOTER', 'SNS', 'INSTAGRAM','Y');" rel="noopener noreferrer">인스타그램</a></span>
				<span class="btnFacebook"><a href="https://www.facebook.com/innisfreeHQ?fref=ts" target="_blank" title="새창" onclick="makeScriptGA_Event('PC_FOOTER', 'SNS', 'FACEBOOK','Y');" rel="noopener noreferrer">페이스북</a></span>
				<span class="btnTwitter"><a href="https://twitter.com/ecoinnisfree" target="_blank" title="새창" onclick="makeScriptGA_Event('PC_FOOTER', 'SNS', 'TWITTER','Y');" rel="noopener noreferrer">트위터</a></span>
				<span class="btnApp"><a href="/kr/ko/GreenteaClubApp.do">모바일 앱</a></span>
			</div>
		</div>
	</div>
		
	<div class="ftinfo">
		<div class="info">
			<p class="inner">
				<span>(주)辽宁省大连市黄泥川软件园SO4</span>
				<span class="non">대표 개발자 강세권</span><br>
				<span>집주소: 大连高新园区雯君庭</span>
				<span>문의 있으면 저한테 전화주세요~</span>
				<span>폰번호 : 186-4084-4669</span>
				<span class="non">FAX (없음)</span><br>
				<span>회사 이메일 주소 <a href="mailTo:jsqjiang@cn.ibm.com">jsqjiang@cn.ibm.com</a></span>
				<span>개인 이메일 주소 <a href="mailTo:jiangshiquan2020@163.com">jiangshiquan2020@163.com</a></span>
				<br>
				<span><a href="#" onclick="layerOpen('emailRefusal');return false;">이메일 주소 무단 수집 거부</a></span>
				<span>개인정보 보호책임자 강세권</span>
				<span>개인 서비스</span><br>
			</p>
			<div class="lgEscrow">
				<strong class="tit">SandBox person계정:</strong>
				<em>sb-uitlr6583701@personal.example.com</em>
				<strong class="tit">비번:</strong>
				<em>9dTNV=Vd</em>
			</div>
			<div class="lgEscrow">
				<strong class="tit">SandBox business계정:</strong>
				<em>sb-wr1ym6594779@business.example.com</em>
				<strong class="tit">비번:</strong>
				<em>UxQh(3+4</em>
			</div>
			<div class="lgEscrow">
				<strong class="tit">㈜IBM회사 다님</strong>
				<em>저는 현재 B2C B2B 업무를 담당하고 있습니다.</em>
				<p>
					<button type="button" onclick="window.open('https://c.y.qq.com/base/fcgi-bin/u?__=OysRjc0', 'LGU', 'width=336, height=259');">좋아하는 노래 링크</button>
				</p>
			</div>
			<p class="copyRight">Copyright © 2021 IBM. All Rights Reserved.</p>
		</div>
		<div class="info_2">
			<dl>
				<dt>개발자: 강세권</dt>
				<dd>
					<strong>186-4084-4669</strong>(위쳇 동일)
				</dd>
				<dd>
					운영시간 AM 08:00 ~ PM 17:00 (주말 및 공휴일 휴무)<br>
					점심시간 PM 12:00 ~ PM 13:00
				</dd>
				<dd>
					<a href="#" class="btn">1:1 상담작성 </a>
				</dd>
			</dl>
		</div>
	</div>
</footer>
</div>
<div  class="layerPop" id="info_popup" style="display: none;">
	<section class="layerWrap" >
		<h3 class="layerTitle">个人信息
		</h3>
		<div class="totalPayment" >
			<div class="inner">
				<div class="box">
					<p class="loginTxt">
					<input class="btnType2"  type="button" name="quickButton" value="快速填充" onclick="setInfo();"><br>
					<input  class="btnType1s" type="text" id="firstName" name="firstName" placeholder="firstName :"><br>
					<input  class="btnType1s" type="text" id="lastName" name="lastName" placeholder="lastName :"><br>
					<input  class="btnType1s" type="text" id="phonNumber" name="phonNumber" placeholder="phonNumber :"><br>
					<input  class="btnType1s" type="text" id="email_address" name="email_address" placeholder="email :"><br>
					</p>
				</div>
			</div>
		</div>
		<h3 class="layerTitle">收货地址</h3>	
		<div class="totalPayment" >
			<div class="inner">
				<div class="box">
					<p class="loginTxt">
					<input  class="btnType1s" type="text" id="country_code" name="country_code" placeholder="country code :"><br>
					<input  class="btnType1s" type="text" id="postal_code" name="postal_code" placeholder="zip code :"><br>
					<input  class="btnType1s" type="text" id="state" name="state" placeholder="state : "><br>
					<input  class="btnType1s" type="text" id="city" name="city" placeholder="city : "><br>
					<input  class="btnType1s" type="text" id="adress1" name="adress1" placeholder="adress1 : "><br>
					<input  class="btnType1s" type="text" id="adress2" name="adress2" placeholder="adress2 : "><br>
					</p>
				</div>
			</div>
		</div>
		<div class="btnWrap">
			<span><button type="button" class="btnType3" onclick="goSaveInfo();">保存</button></span>
		</div>
		<button type="button" class="btnLayerClose" onclick="layerClose();">close</button>
	</section>
</div>
<div  class="layerPop" id="pay_popup" style="display: none;">
	<section class="layerWrap" style="width:480px;">
		<p class="layerTitle_2">支付方式一：PayPal&nbsp;sdk</p>	
		<div id="paypal-button-container"></div>

		<script src="https://www.paypal.com/sdk/js?client-id=AYtMzh7lQRgecC0XQzt5ZFIY6p58qZWhqk-nTN7G94DS3q5UYqIT8ALJaLGBt8Zp9dtKUnRaRIWT4eAS"></script>
		<script>
			paypal.Buttons ({
				onShippingChange: function(data, actions) {
			        if (data.shipping_address.country_code !== 'US') {
			            return actions.reject();
			        }
		
			        return actions.resolve();
			    },
			  	createOrder: function(data, actions) {
			  		// 个人信息
			  		var firstName = document.getElementById('firstName').value;
			  		var lastName = document.getElementById('lastName').value;
			  		var phonNumber = document.getElementById('phonNumber').value;
			  		var email = document.getElementById('email_address').value;
			  		var postal_code = document.getElementById('postal_code').value;
			  		var state = document.getElementById('state').value;
			  		var city = document.getElementById('city').value;
			  		var country = document.getElementById('country_code').value;
			  		var adress1 = document.getElementById('adress1').value;
			  		var adress2 = document.getElementById('adress2').value;
			  		//订单
			  		var price = document.getElementsByName('prdprice');
			  		var qty = document.getElementsByName('prdqty');
			  		var prdname = document.getElementsByName('prdname');
			  		var prdcd = document.getElementsByName('prdcd');
			  		var totPrice = 0;
			  		var totQty = 0;
			  		var jsonArr = [];
			  		
			  		var checkboxs = document.getElementsByName('selCartSeq');
			  		for (var i = 0; i < qty.length; i++) {
			  			if(checkboxs[i].checked){
			  				var itemsJson = {};
					  		var unit_amount = {};
			  				totPrice = totPrice + (Number(price[i].value) * Number(qty[i].value) );
			  				
			  				itemsJson.name = prdname[i].value;
			  				itemsJson.quantity = qty[i].value;
			  				itemsJson.sku = prdcd[i].value;
			  				unit_amount.currency_code = 'USD';
			  				unit_amount.value = price[i].value;
			  				itemsJson.unit_amount = unit_amount;
			  				
			  				console.log(i);
					  		jsonArr.push(itemsJson);
			  			}
			  		}
			  		console.log(jsonArr);
			  		
			    	return actions.order.create({
			    		itent: 'CAPTURE',
				      	payer: {
					        name: {
					        	given_name: "PayPal",
					          	surname: firstName+"."+lastName
					        },
					        email_address: email,
					        phone: {
					        	phone_type: "MOBILE",
					          	phone_number: {
					            	national_number: phonNumber
					          	}
					        },
				      	},
					    purchase_units: [
					      	{
					      		amount: {
					            	value: totPrice,
					            	currency_code: 'USD',
					            	breakdown:{
					            		item_total:{
					            			currency_code : 'USD',
					            			value: totPrice
					            		}
					            	}
					         	},
					         	items: jsonArr,
					        	shipping: {
						            address: {
						              address_line_1: adress1,
						              address_line_2: adress2,
						              admin_area_2: city,
						              admin_area_1: state,
						              postal_code: postal_code,
						              country_code: country
						            }
					          	}
					        }
					    ]
			    	});
			  	},
			  	onError: (err) => {
			  		alert(err);
			  		//goFail();
			  	},
			    onApprove: function (data, actions) {
			    	document.getElementById('orderID').value= data.orderID;
			    	document.getElementById('payerID').value= data.payerID;
			    	
			    	goComplete();
				 },
				//取消时回调				 
				onCancel: function (data) {
					console.log('onCancel');
					PayPopupClose();
				}
			}).render("#paypal-button-container");
		</script>
		<p class="layerTitle_2">支付方式二：Rest&nbsp;API</p>
		<div class="btnWrap">
			<span><button type="button" class="btnType3" onclick="goPay();">PayPal</button></span>
		</div>
		<button type="button" class="btnLayerClose" onclick="PayPopupClose();">close</button>
	</section>
</div>
</form>
