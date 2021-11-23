//初始化
var headerfrm;
$(function(){
	addEvt();
	headerfrm = $('input[name="headerfrm"]').val();
});
function addEvt(){
	$('#quick_login').unbind('click').click(function(event){
		headerfrm.submit();
	});
	
}