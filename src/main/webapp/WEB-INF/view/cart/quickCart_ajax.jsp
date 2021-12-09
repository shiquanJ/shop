<%@page contentType="text/html; charset=UTF-8" %>
<%@include file="../common/common.jsp" %>

	            <div class="modal-header border-bottom">
	                <h6 class="m-0 fw-bold">商品 (<span id ="quick_cart_goods_len">${cfn:length(cartList)}</span>)
	                    </h6>
	                <!-- Close -->
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>

<div class="modal-body">
    <!-- List group -->
    <ul class="list-unstyled m-0 p-0">
    <c:choose>
    	<c:when test="${!empty cartList}">
    		<c:forEach items="${cartList}" var="cvo" begin="0" varStatus="s">
		    	<li class="py-3 border-bottom">
		            <div class="row align-items-center">
		                <div class="col-4">
		                    <!-- Image -->
		                    <a href="javascript:void(0);">
		                        <img class="img-fluid border" src="${cvo.img_url}" alt="...">
		                    </a>
		                </div>
		                <div class="col-8">
		                    <!-- Title -->
		                    <p class="mb-2">
		                        <a class="text-dark fw-500" href="javascript:void(0);">${cvo.goods_name }</a>
		                        <span class="m-0 text-muted w-100 d-block">JP&yen;${cvo.price }</span>
		                    </p>
		                    <!--Footer -->
		                    <div class="d-flex align-items-center">
		                    	<a href="#" onclick="add_qty('${cvo.cart_id }','${cvo.goods_id}','${s.index}','minus')" >

		                    		<img class="cart_minus" src="../assets/img/minus.jpg">
		                    	</a>&nbsp;
		                    	<span class="cart_goods_cnt" >${cvo.goods_cnt}</span>&nbsp;
		                    	<a href="#" onclick="add_qty('${cvo.cart_id }','${cvo.goods_id}','${s.index}','plus')" >
		                    		<img class="cart_plus" src="../assets/img/plus.jpg">

		                    	</a>
		                        <!-- Remove -->
		                        <a class="small text-dark ms-auto" href="#!" onclick="removeCart('${cvo.cart_id }','${cvo.goods_id}')">
		                            <i class="bi bi-x"></i>
		                           	 删除
		                        </a>
		                        <input type="hidden" class="cart_id" value="${cvo.cart_id }"/>
		                        <input type="hidden" class="goods_id" value="${cvo.goods_id }"/>
		                        <input type="hidden" class="price" value="${cvo.price }"/>
		                        <input type="hidden" class="goods_cnt" value="${cvo.goods_cnt }"/>
		                    </div>
		                </div>
		            </div>
		        </li>	
    		</c:forEach>
    	</c:when>
    	<c:otherwise>
    		<div class="row align-items-center">
   			<span>空空如也~&nbsp;快加商品把~</span>
    		</div>
    	</c:otherwise>
    </c:choose>
    </ul>
</div>
<!-- Footer -->
<div class="mt-auto p-3 pt-0">
    <div class="row g-0 pt-2 mt-2 border-top fw-bold text-dark">
        <div class="col-8">
            <span class="text-dark">TOTAL</span>
        </div>
        <div class="col-4 text-end">
            <span class="ml-auto">JP&yen;<span id="total_price">${totPrice}</span></span>
        </div>
    </div>
    <div class="pt-4">
        <a class="btn btn-block btn-dark w-100 mb-3" href="checkout.html">立即购买</a>
        <a class="btn btn-block btn-outline-dark w-100" href="/goCart">购物车</a>
    </div>
</div>
<!-- Buttons -->