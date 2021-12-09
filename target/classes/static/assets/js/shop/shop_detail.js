$(function(){
	addEvt();
	var goods_id = $("input[name='goods_id']").eq(0).val();
	var opt_goods_id = $("input[name='opt_goods_id']").eq(0).val();
	getPrdDecInfo(goods_id,opt_goods_id);
});

function addEvt(){
	$(".qty_btn").unbind('click').click(function(event){
        var $button = $(this);
        var oldQty = $button.parent().find(".cart_qty_input").val();
        if ($button.text() === "+") {
            var newQty = parseFloat(oldQty) + 1;
        } else {
            // Don't allow decrementing below zero
            if (oldQty > 0) {
                var newQty = parseFloat(oldQty) - 1;
            } else {
            	popupMessage("请确认数量");
                newQty = 1;
            }
        }
        $button.parent().find(".cart_qty_input").val(newQty);
        
        var temp_price = $(".product-price .slick-active .promotion_price").text();
        var tot_price = Number(temp_price) * Number(newQty);
        $button.parent().find(".promotion_price").val(tot_price)
    });
	
	$(".opt_selected").unbind('click').click(function(event){
		getPrdDecInfo($(this).find('input[name="goods_id"]').val(),$(this).find('input[name="opt_goods_id"]').val() );
	});
	$(".img_selected").unbind('click').click(function(event){
		getPrdDecInfo($(this).find('input[name="goods_id"]').val(),$(this).find('input[name="opt_goods_id"]').val() );
	});
}

//获取option的商品描述
function getPrdDecInfo(goods_id, opt_goods_id){
	
	$.ajax({
		url: "/shop/getPrdDecInfo_ajax",
		type: "post",
		async: true, //异步
		data: {
			goods_id: goods_id
			,opt_goods_id: opt_goods_id
		},
		dataType: "json",
		success:function(data){
			$("#prd_dec").html(data.opt_dec);
			$("#prd_info").html(data.opt_info);
		},
		fail: function(data){
			console.log(data);
		}
	});
}