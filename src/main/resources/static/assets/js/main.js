//初始化
var headerfrm;
$(function(){
	addEvt();
	headerfrm = $('#headForm');
});

<<<<<<< Updated upstream
function add_quick_cart(goods_id,member_id){
	if(!isLogin()){
		loginPopupMessage('请先登录~');
		return;
	}
	$.ajax({
		url: "/cart/addCart_Ajax",
		type: "post",
		async: true, //异步
		data: {
			goods_id : goods_id,
			member_id: member_id
			
		},
		dataType: "json",
		success:function(data){
			popupMessage("添加成功");
			var len = data.length;
			//右上角购物车小图标count显示
			$(".quick_cart_cnt").attr("data-cart-items",len);
		},
		fail: function(data){
			console.log(data);
		}
	});
}
=======
//绑定事件
>>>>>>> Stashed changes
function addEvt(){
	$('#quick_login').unbind('click').click(function(event){
		headerfrm.submit();
	});
<<<<<<< Updated upstream
	$('.quick_cart').unbind('click').click(function(event){
		if(!isLogin()){
			loginPopupMessage('请先登录~');
			return;
		}
		
		var member_id = $("input[name='member_id']").val();
		
		$.ajax({
			url: "/cart/getCartList_Ajax",
			type: "post",
			async: true, //异步
			data: {
				member_id: member_id
			},
			dataType: "json",
			success:function(data){
				
			},
			fail: function(data){
				console.log(data);
			}
		});
	});
}
=======
	$('#addrMap').unbind('click').click(function(event){
		headerfrm.attr("action","/addrMap");
		headerfrm.submit();
	});
}
function goLogin(){
	$("#topbarlogin").modal("toggle");
}

function shop_prd_view(goods_id){
	var frm = $('#form');
	$("input[name='goods_id']").val(goods_id);
	frm.attr("action","/shop/shop_prd_detail");
	frm.submit();
}
>>>>>>> Stashed changes
