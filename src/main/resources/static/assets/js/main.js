//初始化
var headerfrm;
$(function(){
	addEvt();
	headerfrm = $('#headForm');
});

//绑定事件
function addEvt(){
	$('#quick_login').unbind('click').click(function(event){
		headerfrm.submit();
	});
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
