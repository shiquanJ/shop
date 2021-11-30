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
	$("#popup").modal("toggle");
}
function confirmPopupMessage(str, reFunction){
	//赋值
	$("#confirmMessage").html(str);
	$("#confirmPopup").modal("toggle");
	
	$("#confirmPopup").find(".reFunction").attr('onclick',reFunction);
}