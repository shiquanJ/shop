//初始化
var headerfrm;
$(function(){
	addEvt();
	headerfrm = $('#headForm');
});


function add_quick_cart(goods_id,member_id){
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
			
			addEvt();
		},
		fail: function(data){
			console.log(data);
		}
	});
}

function addEvt(){
	$('#quick_login').unbind('click').click(function(event){
		headerfrm.submit();
	});

