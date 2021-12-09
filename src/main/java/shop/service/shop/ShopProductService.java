package shop.service.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import shop.dao.shop.ShopProductDao;


@Component
public class ShopProductService {
	@Autowired
	private ShopProductDao dao;
	//商品信息
	public Map<String,Object> getPrdInfo(HashMap map){
		return dao.getPrdInfo(map);
	}
	//获取商品详细信息
	public List<Map<String,Object>> getOptProList(HashMap map){
			
		return dao.getOptProList(map);
	}
	//opt信息
	public Map<String,Object> getPrdDecInfo(HashMap map){
		return dao.getPrdDecInfo(map);
	}
}
