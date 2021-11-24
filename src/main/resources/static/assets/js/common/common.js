function isLogin(){
	var id = $("input[name='member_id']").val();
	if(id != null && id != ''){
		return true;
	}else{
		return false;
	}
}
// 弹出POPUP
function popupMessage(str){
	//赋值
	$("#message").html(str);
	$("#popupMsg").modal("toggle");
}
function loginPopupMessage(str){
	//赋值
	$("#message").html(str);
	$("#loginPopupMsg").modal("toggle");
}