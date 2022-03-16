//初始化
var frm;
var re_uri = encodeURIComponent("http://localhost/user/wxlogin");
var obj = new WxLogin({
	 self_redirect:true,
	 id:"wxlogin", 
	 appid: "wx757431a4bdc0dc91", 
	 scope: "snsapi_login", 
	 redirect_uri: re_uri,
	 response_type: "code",
	  state: "",
	 style: "black",
	 href: ""
	 });
$(function(){
	addEvt();
	frm = $('input[name="reForm"]').val();
});
function addEvt(){
	$('#goLogin').unbind('click').click(function(event){
		frm.submit();
	});
	$('.btn-phone').unbind('click').click(function(event){
		openPhonelogin();
	});
	$('.btn-wechat').unbind('click').click(function(event){
		openWxlogin();
	});
	
}

function openPhonelogin(){
	
	$('#wxlogin').addClass('d-none');
	$('.btn-phone').addClass('d-none');
			
	$('#phlogin').removeClass('d-none');
	$('.card-header').removeClass('d-none');
	$('.btn-wechat').removeClass('d-none');
}
function openWxlogin(){
	
	$('#wxlogin').removeClass('d-none');
	$('.btn-phone').removeClass('d-none');
	
	$('#phlogin').addClass('d-none');
	$('.card-header').addClass('d-none');
	$('.btn-wechat').addClass('d-none');
}