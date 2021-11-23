/* 숫자함수
 * 숫자값만 리턴 합니다. 콤마제거시에 사용
 */ 
function onlyNumber(str){
	var len = str.length;
	var sReturn = "";
	
	for(var i =0 ; i < len; i++){
		if((str.charAt(i) >= "0") && (str.charAt(i) <= "9") )
			sReturn += str.charAt(i);
	}
	
	return sReturn;
}
/* 금액 셋팅
 * 천 단위로 콤마 삽입
 */ 
function setPrice(str){
	var decimal ="";
	
	var arrStr = [];
	
	if(str == undefined){
		return "";
	}
	
	str =""+str;
	
	if(str.indexOf(".") > -1){
		arrStr =str.split(".");
		str = arrStr[0];
		decimal = arrStr[1];
	}
	
	var isMinus = false;
	
	if(str.length > 1){
		if(str.charAt(0) == "-"){
			isMinus =true;
		}
	}
	
	var tmpStr = onlyNumber("" + str);
	var sResult ="";
	
	if(tmpStr !=""){
		tmpStr = ""+parseInt(tmpStr,10);
		
		var len = tmpStr.length;
		var cnt = 0;
		
		for(var i = lent -1; i>=0; i--){
			if(cnt > 0 && cnt % 3 ==0){
				sResult = "," + sResult;
			}
			sResult = tmpStr.charAt(i)+sResult;
			cnt ++;
		}
	}
	if(isMinus && sResult !=""){
		sResult = "-" + sResult;
	}
	
	if(decimal != ""){
		sResult = sResult + "."+ decimal;
	}
	
	return sResult;
}