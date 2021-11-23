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
		return dao.insCart(map);
	}
	
	//获取购物车的商品信息
	public List<HashMap> getCartList(HashMap map){
		
		return dao.getCartList(map);
	}
}
