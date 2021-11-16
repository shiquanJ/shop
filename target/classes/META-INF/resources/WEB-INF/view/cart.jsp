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
	<div class="main">
        <!-- Breadcrumb -->
        <div class="py-3 bg-gray-100">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-6 my-2">
                        <h1 class="m-0 h4 text-center text-lg-start">Shopping Cart</h1>
                    </div>
                    <div class="col-6 my-2">
                        <ol class="breadcrumb dark-link m-0 small justify-content-center justify-content-lg-end">
                            <li class="breadcrumb-item"><a class="text-nowrap" href="index.html"><i class="bi bi-home"></i>Home</a></li>
                            <li class="breadcrumb-item text-nowrap active" aria-current="page">Shopping Cart</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumb -->
        <!-- Cart Table -->
        <div class="py-6">
            <div class="container">
                <!-- Cart Table -->
                <div class="table-content table-responsive cart-table-content">
                    <table class="table table-bordered align-middle">
                        <thead>
                            <tr class="text-uppercase">
                                <th class="text-dark text-center fw-500 text-nowrap">Image</th>
                                <th class="text-dark text-center fw-500 text-nowrap">Product Name</th>
                                <th class="text-dark text-center fw-500 text-nowrap">Until Price</th>
                                <th class="text-dark text-center fw-500 text-nowrap">Qty</th>
                                <th class="text-dark text-center fw-500 text-nowrap">Subtotal</th>
                                <th class="text-dark fw-500 text-end text-nowrap">action</th>
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
                                    <div class="cart-qty d-inline-flex">
                                        <div class="dec qty-btn">-</div>
                                        <input class="cart-qty-input form-control" type="text" name="qtybutton" value="1">
                                        <div class="inc qty-btn">+</div>
                                    </div>
                                </td>
                                <td class="text-center product-subtotal">$110.00</td>
                                <td class="product-remove text-end text-nowrap">
                                    <a href="javascript:void(0);" class="btn btn-sm btn-outline-secondary text-nowrap px-3"><i class="bi bi-pencil-square lh-1"></i> <span class="d-none d-md-inline-block">Edit</span></a>
                                    <a href="javascript:void(0);" class="btn btn-sm btn-outline-danger text-nowrap px-3"><i class="bi bi-x lh-1"></i> <span class="d-none d-md-inline-block">Remove</span></a>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center product-thumbnail">
                                    <a class="text-reset" href="product-details.html"><img src="assets/img/product-1.jpg" class="img-fluid" width="100" alt=""></a>
                                </td>
                                <td class="text-center product-name"><a class="text-reset" href="product-details.html">Product Name</a></td>
                                <td class="text-center product-price-cart"><span class="amount">$260.00</span></td>
                                <td class="text-center product-quantity">
                                    <div class="cart-qty d-inline-flex">
                                        <div class="dec qty-btn">-</div>
                                        <input class="cart-qty-input form-control" type="text" name="qtybutton" value="1">
                                        <div class="inc qty-btn">+</div>
                                    </div>
                                </td>
                                <td class="text-center product-subtotal">$110.00</td>
                                <td class="product-remove text-end text-nowrap">
                                    <a href="javascript:void(0);" class="btn btn-sm btn-outline-secondary text-nowrap px-3"><i class="bi bi-pencil-square lh-1"></i> <span class="d-none d-md-inline-block">Edit</span></a>
                                    <a href="javascript:void(0);" class="btn btn-sm btn-outline-danger text-nowrap px-3"><i class="bi bi-x lh-1"></i> <span class="d-none d-md-inline-block">Remove</span></a>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center product-thumbnail">
                                    <a class="text-reset" href="product-details.html"><img src="assets/img/product-1.jpg" class="img-fluid" width="100" alt=""></a>
                                </td>
                                <td class="text-center product-name"><a class="text-reset" href="product-details.html">Product Name</a></td>
                                <td class="text-center product-price-cart"><span class="amount">$260.00</span></td>
                                <td class="text-center product-quantity">
                                    <div class="cart-qty d-inline-flex">
                                        <div class="dec qty-btn">-</div>
                                        <input class="cart-qty-input form-control" type="text" name="qtybutton" value="1">
                                        <div class="inc qty-btn">+</div>
                                    </div>
                                </td>
                                <td class="text-center product-subtotal">$110.00</td>
                                <td class="product-remove text-end text-nowrap">
                                    <a href="javascript:void(0);" class="btn btn-sm btn-outline-secondary text-nowrap px-3"><i class="bi bi-pencil-square lh-1"></i> <span class="d-none d-md-inline-block">Edit</span></a>
                                    <a href="javascript:void(0);" class="btn btn-sm btn-outline-danger text-nowrap px-3"><i class="bi bi-x lh-1"></i> <span class="d-none d-md-inline-block">Remove</span></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- Cart Table -->
                <div class="d-flex">
                    <div>
                        <a class="btn btn-outline-dark" href="shop-fw-without-filtres.html">
                            <i class="ci-arrow-left mt-sm-0 me-1"></i>
                            <span class="d-none d-sm-inline">Continue Shopping</span>
                            <span class="d-inline d-sm-none">Back</span>
                        </a>
                    </div>
                    <div class="ms-auto">
                        <a class="btn btn-outline-primary" href="account-address.html">
                            <span class="d-none d-sm-inline">Update shopping cart</span>
                            <span class="d-inline d-sm-none">Next</span>
                            <i class="ci-arrow-right mt-sm-0 ms-1"></i>
                        </a>
                    </div>
                </div>
                <div class="row flex-row-reverse pt-4">
                    <div class="col-md-6 col-lg-4">
                        <div class="card">
                            <div class="card-header bg-transparent py-3">
                                <h6 class="m-0 mb-1">Order Total</h6>
                            </div>
                            <div class="card-body ">
                                <ul class="list-unstyled">
                                    <li class="d-flex justify-content-between align-items-center mb-2">
                                        <h6 class="me-2 text-body">Subtotal</h6><span class="text-end">$265.00</span>
                                    </li>
                                    <li class="d-flex justify-content-between align-items-center mb-2">
                                        <h6 class="me-2 text-body">Taxes</h6><span class="text-end">$265.00</span>
                                    </li>
                                    <li class="d-flex justify-content-between align-items-center border-top pt-3 mt-3">
                                        <h6 class="me-2">Grand Total</h6><span class="text-end text-dark">$265.00</span>
                                    </li>
                                </ul>
                                <div class="d-grid gap-2 mx-auto">
                                    <a class="btn btn-primary" href="checkout.html">PROCEED TO CHECKOUT</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-8">
                        <div class="card">
                            <div class="card-header bg-transparent py-3">
                                <h6 class="m-0">Use Coupon Code</h6>
                            </div>
                            <div class="card-body ">
                                <form>
                                    <div class="form-group mb-3">
                                        <label class="form-label">Have a Coupon Code?</label>
                                        <input type="email" class="form-control" placeholder="">
                                    </div>
                                    <button type="button" class="btn btn-primary">Apply</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cart Table -->
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
