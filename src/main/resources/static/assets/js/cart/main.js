function fnCartPage(){
	var frm = document.frm;
	frm.action = '/goCart';
	frm.submit();
}

function setCart(obj, index){
	var prdlist = document.getElementsByName('prdlist');
	var cnt = 0;
	if(obj == prdlist[index].value){
		document.getElementById('pdtInCart').style.display ="";
	}else{
		document.getElementsByName('prdlist')[index].value = obj;
		//count ++
		for(var i = 0 ; i < prdlist.length; i++){
			if(prdlist[i].value != '' && prdlist[i].value != undefined){
				cnt++;
			}
		}
		document.getElementById('cartCnt').innerHTML = cnt;
		document.getElementById('pdtInCart').style.display ="";
	}
}
//close popup
function layerClose(){
	document.getElementById('pdtInCart').style.display ="none";
}

//订单查询
function head_top_search(){
	var frm = document.frm;
	if(frm.ordercd.value == ''){
		alert('请输入号码');
		return;
	};
	frm.action ='/searchOrder';
	frm.submit();
}