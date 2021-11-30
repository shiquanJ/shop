//初始化
var frm;
$(function(){
	addEvt();
});

function addEvt(){
	$('#user_info_form').unbind('click').click(function(event){
/*		frm = $('input[name="user_info_form"]');
		frm.submit();*/
		
		var name=$('input[name=""user_name""]').val();
		var phone=$('input[name="user_phone"]').val();;
		var email=$('input[name="user_email"]').val();;
		var sex$('input[name="user_six"]').val();;
		$.ajax({ 
			url: "test.html"
			,type: "post"
			,dataType:"json"
			,data:{
				"user_name": name,
				"user_phone": phone,
				"user_email":email,
				"use_sex":sex
			},
			success: function(data,textStatus){
				if(data.status="succ"){
					alert("修改成功");
				}
	      }});
		
	});
	
}