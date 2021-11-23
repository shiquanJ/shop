//初始化
var frm;
$(function(){
	addEvt();
	frm = $('input[name="reForm"]').val();
});
function addEvt(){
	$('#goLogin').unbind('click').click(function(event){
		frm.submit();
	});
	
}