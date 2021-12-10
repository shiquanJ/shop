//初始化
var headerfrm;
$(function(){
	addEvt();
	Cart.init();
});
var Cart ={
		init : function(){
			headerfrm = $('#headForm');
			$('.quick_cart').unbind('click').click(function(event){
				if(!isLogin()){
					confirmPopupMessage('请先登录~','goLogin()');
					return;
				}
				
				var member_id = $("input[name='member_id']").val();
				
				$.ajax({
					url: "/cart/getCartList_ajax",
					type: "post",
					async: true, //异步
					data: {
						member_id: member_id
					},
					dataType: "html",
					success:function(data){
						$("#quick_cart_list").html(data);
						//展开div
						$("#modalMiniCart").modal("toggle");
					},
					fail: function(data){
						console.log(data);
					}
				});
			});
		}
}

//绑定事件
function addEvt(){
	
}
function add_quick_cart(goods_id){
	
	var member_id = $("input[name='member_id']").val();
	
	if(!isLogin()){
		confirmPopupMessage('请先登录~','goLogin()');
		return;
	}
	$.ajax({
		url: "/cart/addCart_ajax",
		type: "post",
		async: true, //异步
		data: {
			goods_id : goods_id,
			member_id: member_id
			
		},
		dataType: "json",
		success:function(data){
			popupMessage("添加成功");
			//右上角购物车小图标count显示
			$(".quick_cart_cnt").attr("data-cart-items",data);
			
		},
		fail: function(data){
			console.log(data);
		}
	});
}
//添加数量
function add_qty(cart_id,goods_id, index, flag){
	var member_id = $("input[name='member_id']").val();
	//选择器
	var sel = $("#quick_cart_list");
	var str = '';
	if(flag == 'plus'){
		str = '+';
	}else{
		if(sel.find(".cart_goods_cnt").eq(index).text() < 2){
			confirmPopupMessage("确定删除此商品吗？","removeCart('"+cart_id+"','"+goods_id+"')");
		}else{
			str = '-';
		}
	}
	$.ajax({
		url: "/cart/addQty_ajax",
		type: "post",
		async: true, //异步
		data: {
			cart_id : cart_id,
			goods_id : goods_id,
			member_id: member_id,
			flag: str
		},
		dataType: "html",
		success:function(data){
			if(data == 'success'){
				//数量+1
				if(flag == 'plus'){
					var res_cnt = Number(sel.find(".cart_goods_cnt").eq(index).text())+1;
				}else{
					var res_cnt = Number(sel.find(".cart_goods_cnt").eq(index).text())-1;
				}
				$("#quick_cart_list").find(".cart_goods_cnt").eq(index).text(res_cnt);
				
				getTotPrice();
				
			}
		},
		fail: function(data){
			console.log(data);
		}
	});
}
//获取总价格
function getTotPrice(){
//选择器
	var sel = $("#quick_cart_list").find('.cart_goods_cnt');
	
	var len = sel.length;
	
	var totPrice = 0;
	for(var i =0; i< len; i++){
		//单价
		var price = Number($("#quick_cart_list").find(".price").eq(i).val());
		//数量
		var cnt = Number($("#quick_cart_list").find(".cart_goods_cnt").eq(i).text());
		
		totPrice =totPrice + price * cnt;
	}
	
	$('#total_price').text(totPrice);
}
//删除此商品
function removeCart(cart_id,goods_id){
	var member_id = $("input[name='member_id']").val();
	$.ajax({
		url: "/cart/delCart_ajax",
		type: "post",
		async: true, //异步
		data: {
			cart_id : cart_id,
			goods_id : goods_id,
			member_id: member_id,
		},
		dataType: "json",
		success:function(data){
			if(data.status == 'success'){
				popupMessage("删除成功");
				//触发
				$('.quick_cart').trigger('click');
						
				//main画面右上角数量，
				$('.quick_cart_cnt').attr('data-cart-items',data.list_cnt);
			}
		},
		fail: function(data){
			console.log(data);
		}
	});
}
	