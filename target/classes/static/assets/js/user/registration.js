//初始化
var frm;
$(function(){
	addEvt();
	frm = $('input[name="reForm"]').val();
});
function addEvt(){
	$('#goRegistration').unbind('click').click(function(event){
		frm.submit();
	});
	
}