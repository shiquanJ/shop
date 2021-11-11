window.onload =function(){
	totChange();

	var $win=$(window);
	var top=$(window).scrollTop();
	var speed=200;
	var easing='swing';
	var $layer=$('#totalPayment');

	var layerTopOffset=0;
	$layer.css('position','absolute');
	$(window).scroll(function(){
		var sc = $(document).scrollTop(); 
		if(sc >200){
			$layer.css('position','fixed');
			$layer.css('padding-top','18px');
			$layer.css('right','151px');
			
		}else{
			$layer.css('position','absolute');
			$layer.css('right','0');
		}
	});
	/*if(top>0)
		$win.scrollTop(layerTopOffset+top);
	else
		$win.scrollTop(0);
		$(window).scroll(function(){
			var h = 0;
			var hh = document.getElementById("orderHeader").style.height;

			if (hh=='0px')
			{
				$(window).scroll(function(){
					var sc = $(document).scrollTop(); 
				});
				//h=119;
					if($win.scrollTop()==0)
					{

						h=0;
					}
					if($win.scrollTop()>80)
					{

						h=0;
					}
				yPosition=$win.scrollTop()+h;	
			}else{
				$(window).scroll(function(){
					var sc = $(document).scrollTop(); 				
				});
			//yPosition=$win.scrollTop();	
				yPosition=$(document).scrollTop();

			}
			if(yPosition<0){
				yPosition=0;
			}
		$layer.animate({"top":yPosition},{duration:speed,easing:easing,queue:false});});*/
}
function cartChange(type, idx , obj){
	console.log(idx);
	console.log(obj);
	var qty = Number(document.getElementById('prdOrdQty_'+idx).value);
	var price = Number(document.getElementById('prdprice_'+idx).value);
	
	if(type =='plus'){
		qty = qty + 1;
	}
	else if(type =='minus'){
		if(qty == '1'){
			return;
		}
		qty = qty - 1;
	}
	else if(type === 'text'){
		if(0 === qty){
			alert("不能输入0 ！");
			qty = 1;
		}
	}
	
	document.getElementById('prdqty_'+idx).value = qty;
	
	document.getElementById('prdOrdQty_'+idx).value = qty; // 
	document.getElementById('prdOrdPrc_'+idx).innerHTML = price * qty;
	
	totChange(); // 总订单
	
}

//总订单
function totChange(){
	var price = document.getElementsByName('prdprice');
	var qty = document.getElementsByName('prdqty');
	
	var totPrice = 0;
	var totQty = 0;
	var checkboxs = document.getElementsByName('selCartSeq');
	for (var i = 0; i < qty.length; i++) {
		if(checkboxs[i].checked){
			document.getElementsByName('selPrdFlag')[i].value="Y";
			totPrice = totPrice + (Number(price[i].value) * Number(qty[i].value) );
			totQty = totQty + Number(qty[i].value);
		}else{
			document.getElementsByName('selPrdFlag')[i].value="N";
		}
	}
	
	document.getElementById('totalOrdPrc').innerHTML = totPrice;	
	document.getElementById('totalPayPrc').innerHTML = totPrice;
	document.getElementById('totalOrdQty').innerHTML = totQty;
	
}

// checkbox 全部选中
function selectAll(obj){
	
	var checkboxs = document.getElementsByName('selCartSeq');
	if (obj.checked) {
		for (var i = 0; i < checkboxs.length; i++) {
			document.getElementsByName('selCartSeq')[i].checked = true;
			document.getElementsByName('selPrdFlag')[i].value="Y";
		}
	} else {
		for (var i = 0; i < checkboxs.length; i++) {
			document.getElementsByName('selCartSeq')[i].checked = false;
			document.getElementsByName('selPrdFlag')[i].value="N";
		}
	}
	totChange();
}
//填写信息窗口 close
function layerClose(){
	document.getElementById('info_popup').style.display ='none';
}
//支付窗口 close
function PayPopupClose(){
	document.getElementById('pay_popup').style.display ='none';
}
//保存信息并显示在画面
function goSaveInfo(){
	var flag = true;
	var firstName = document.getElementById('firstName').value;
	var lastName = document.getElementById('lastName').value;
	var phonNumber = document.getElementById('phonNumber').value;
	var email_address = document.getElementById('email_address').value;
	var postal_code = document.getElementById('postal_code').value;
	var state = document.getElementById('state').value;
	var city = document.getElementById('city').value;
	var adress1 = document.getElementById('adress1').value;
	var adress2 = document.getElementById('adress2').value;
	var country_code = document.getElementById('country_code').value;
	
	if(firstName == '' || lastName == '' ||phonNumber == '' ||email_address == '' ||postal_code == '' || state == '' || city == '' 
		|| (adress1 == '' || adress2 == '') || country_code ==''){
		flag = false;
	}
	if(country_code !='US'){
		alert('必须填写有效的美国地址！');
		return;
	}
	
	if(!flag){
		alert('请完整填写信息！');
		return;
	}else{
		document.getElementById('chkFlag').value = "Y";
		document.getElementById('show_address').innerHTML = "<br><br>"+adress1+"&nbsp"+adress2+"<br>"+city+"&nbsp"+state+"&nbsp"+ postal_code+"<br>"+country_code+"<br>";
		document.getElementById('show_info').innerHTML = firstName+"&nbsp"+lastName+"<br>"+phonNumber+"<br>"+email_address;
		document.getElementById('info_popup').style.display ='none';
	}
}
//gopay 先判断信息有木有填写了
function layoutPay(){
	var chkFlag = document.getElementById('chkFlag').value;
	if(chkFlag == 'Y'){
		// check商品有没有选上
		var checkboxs = document.getElementsByName('selCartSeq');
		var prdFlag = false;
		for (var i = 0; i < checkboxs.length; i++) {
			if(checkboxs[i].checked){
				prdFlag = true;
			}
		}
		if(prdFlag){
			document.getElementById('pay_popup').style.display ='';
		}else{
			alert('请选择购买的商品');
		}
	}else{
		alert('请完整填写信息！');
		document.getElementById('info_popup').style.display ='';
	}
}

// PayPal呼叫后台
function goPay(){
	var frm = document.frm;
	frm.action ='/pay';
	frm.submit();
}
//js onApprove方法调用后，去后台跳转complete画面
function goComplete(){
	document.getElementById('pay_popup').style.display ='none';
	var frm = document.frm;
	frm.action ='/complete';
	frm.submit();
}
//支付失败
function goFail(){
	document.getElementById('pay_popup').style.display ='none';
	var frm = document.frm;
	frm.action ='/fail';
	frm.submit();
}
//一键填信息-- 开发用
function setInfo(){
	document.getElementById('firstName').value = 'shiquan';
	document.getElementById('lastName').value = 'jiang';
	document.getElementById('phonNumber').value = '18640844669';
	document.getElementById('email_address').value = 'sb-uitlr6583701@personal.example.com';
	document.getElementById('postal_code').value = '99501';
	document.getElementById('country_code').value = 'US';
	document.getElementById('state').value = 'AK';
	document.getElementById('city').value = 'Anchorage';
	document.getElementById('adress1').value = '2211 N First Street';
	document.getElementById('adress2').value = 'Building 18';
}
//删除商品
function cartDel(){
	var checkboxs = document.getElementsByName('selCartSeq');
	for (var i = 0; i < checkboxs.length; i++) {
		if(checkboxs[i].checked){
			document.getElementsByName('selCartSeq')[i].checked = false;
			document.getElementsByName('selPrdFlag')[i].value="N";
			document.getElementById('prdRow_'+i).style.display ='none';
		}
	}
	totChange();
}