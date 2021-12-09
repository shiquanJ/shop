package shop.dao.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import shop.utils.JdbcUtil;

@Component
public class ShopProductDao {
	@Autowired
	private JdbcUtil jdbc;
	public Map<String,Object> getPrdInfo(HashMap map){
			
		try {
			String sql ="\n select goods_id, goods_name,brand_name"
					+ "\n			,price ,promotion_price, img_url"
					+ "\n			,star "
					+ "\n from sg_goods "
					+ "\n where goods_id = ?";
				
			Object[] obj = new Object[1];
			obj[0] = map.get("goods_id");
			return jdbc.queryForMap(sql, obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//获取商品
	public List<Map<String,Object>> getOptProList(HashMap map){
			
		String sql ="select goods_id ,opt_goods_id "
				+ "\n		,opt_goods_name,opt_sub_name"
				+ "\n		,opt_info ,opt_dec, img_url"
				+ "\n		,price, promotion_price"
				+ "\n from sg_opt_goods "
				+ "\n	where goods_id = ? "
				+ "\n order by opt_goods_id";
			
		//传空的参数
		Object[] obj = new Object[]{1};
		obj[0] = map.get("goods_id");
		try {
			List<Map<String,Object>> list  = (List)jdbc.getList(sql, obj);
				return list;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
	
	public Map<String,Object> getPrdDecInfo(HashMap map){
		
		try {
			String sql ="\n select opt_dec,opt_info"
					+ "\n from sg_opt_goods "
					+ "\n where goods_id = ?"
					+ "\n		and opt_goods_id = ?";
				
			Object[] obj = new Object[2];
			obj[0] = map.get("goods_id");
			obj[1] = map.get("opt_goods_id");
			return jdbc.queryForMap(sql, obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
