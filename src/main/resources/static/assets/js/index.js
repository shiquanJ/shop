$(function (){
});

var iframeDoc = null;
var myFrame = document.getElementById('amazon');
if(myFrame){
	myFrame.onload=function(){
		setIframeHeight(document.getElementById('amazon'));
	}
}
function setIframeHeight(iframe) {
	if (iframe) {
		var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
		if (iframeWin.document.body) {
			var doc = iframeWin.document;
			$("#amazon").removeClass("frame-height");
			if(doc.getElementById('navbar-main') == null){
				doc.getElementById('nav-main').style.display = 'none';
				doc.getElementById('nav-ftr').style.display = 'none';
			}else{
				doc.getElementById('navbar-main').style.display = 'none';
				doc.getElementById('rhf').style.display = 'none';
				doc.getElementById('navFooter').style.display = 'none';
			}
			iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
			$(".preloader").addClass("preloader-deactivate");
			iframeDoc = iframeWin.document;
			addEvt();
		}
	}
};

function addEvt(){
	$('.register').on('click' , function(){
		var frm = document.getElementByName('reForm');
		frm.submit();
	});
	/*iframeDoc.getElementById('add-to-cart-button').onclick=function(){
		
	}*/
	
}

