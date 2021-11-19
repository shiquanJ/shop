package shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import shop.utils.JdbcUtil;

@Component
public class MainDao {
	@Autowired
	private JdbcUtil jdbc;
	
	//获取 banner 
	public List<HashMap> getBannerList(){
		
		String sql ="select banner_id, banner_nm, catagory_id, img_url from sg_banner where isuse='Y'";
		//传空的参数
		Object[] obj = new Object[]{};
		
		return (List)jdbc.getList(sql,obj);
	}
	//获取lookbook
	public List<HashMap> getLookBookList(){
			
		String sql ="select lookbook_id, lookbook_nm, img_url from sg_lookbook where isuse='Y' ";
		//传空的参数
		Object[] obj = new Object[]{};
		try {
			List<HashMap> list  = (List)jdbc.getList(sql,obj);
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	//获取商品
	public List<HashMap> getPrdList(){
		
		String sql ="SELECT goods_id, goods_name, goods_type"
				+ "\n		, shop_id, category_id, category_id_1"
				+ "\n		, category_id_2, category_id_3, brand_id"
				+ "\n		, promotion_type, promote_id, currency_type"
				+ "\n		, market_price, price, promotion_price"
				+ "\n		, cost_price, stock, shipping_fee"
				+ "\n		, max_buy, clicks, sales"
				+ "\n		, collects, star, img_url"
				+ "\n from sg_goods where isuse= 'Y' "
				+ "\n order by update_dt desc";
		
		//传空的参数
		Object[] obj = new Object[]{};
		try {
			List<HashMap> list  = (List)jdbc.getList(sql, obj);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
