package shop.service.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import shop.dao.cart.CartDao;

@Component
public class cartService {
	@Autowired
	private CartDao dao;
	
	//商品信息
	public Map<String,Object> getPrdInfo(HashMap map){
		return dao.getPrdInfo(map);
	}
	
	//加入购物车
	public int insCart(HashMap map){
		int res = 0;
		Map<String, Object> cartMap = dao.getCartId(map);
		//有id
		if(cartMap != null ){
			map.put("cart_id", cartMap.get("cart_id"));
			if("".equals(cartMap.get("goods_id"))){
				dao.insCart(map);
			}else{
				if("N".equals(cartMap.get("isdel"))){
					//update数量就行
					map.put("flag", "+");
					res = this.updCartQty(map);
					System.out.println("updCartQty::成功："+res);
				}else{
					//isdel 值update 数量变为1
					map.put("isdel", "N");
					res = this.updCartDel(map);
					System.out.println("updCartDel：：：成功："+res);
				}
			}
		}else{
			map.put("cart_id", "");
			dao.insCart(map);
		}
		return res;
	}
	
	//获取购物车的商品信息
	public List<Map<String,Object>> getCartList(HashMap map){
		
		return dao.getCartList(map);
	}
	//加入购物车
	public int updCartQty(HashMap map){
		return dao.updCartQty(map);
	}
	
	//删除购物车
	public int updCartDel(HashMap map){
		return dao.updCartDel(map);
	}
}
