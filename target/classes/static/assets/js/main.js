//初始化
var headerfrm;
$(function(){
	addEvt();
	headerfrm = $('input[name="headerfrm"]').val();
});

function add_quick_cart(str1,str2){
	if(!isLogin()){
		popupMessage('请先登录~');
		return;
	}
	$.ajax({
		url: '/cart/addCart_Ajax',
		type: 'post',
		async: true, //异步
		data: {
			goods_id : str1,
			member_id: str2
			
		},
		dataType: 'json',
		success:function(data){
			console.log(data);
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
	
}