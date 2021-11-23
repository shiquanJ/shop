package shop.dao.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import shop.utils.JdbcUtil;
@Component
public class CartDao {
	@Autowired
	private JdbcUtil jdbc;
	
	public Map<String,Object> getPrdInfo(HashMap map){
		
		try {
			String sql ="\n select goods_id, goods_name"
					+ "\n			,price ,promotion_price, img_url "
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
	
	//加入购物车
	public int insCart(HashMap map){
		//先查询
		String sql ="select count(*) from sg_cart where goods_id = ? and member_id=? ";
		
		Object[] obj = new Object[2];
		int i = 0;
		obj[i++] = map.get("goods_id");
		obj[i++] = map.get("member_id");
		
		int cnt = (int) jdbc.getObject(sql, obj, Integer.class);
		
		int res = 0;
		if(cnt == 0){
			//insert
			String insert = "insert into sg_cart"
					+ "\n	(member_id, goods_id"
					+ "\n	, goods_name, price, goods_cnt"
					+ "\n	,img_url)		"
					+ "\n	values			"
					+ "\n	( ?, ?			"
					+ "\n	,?, ?, 1		"
					+ "\n	,?)				";
			Object[] insObj = new Object[5];
			int j = 0;
			insObj[j++] = map.get("member_id");
			insObj[j++] = map.get("goods_id");
			insObj[j++] = map.get("goods_name");
			insObj[j++] = map.get("price");
			insObj[j++] = map.get("img_url");
			
			res = jdbc.update(insert, insObj);
			
		}else{
			
			String update ="update sg_cart set goods_cnt = goods_cnt + 1 where goods_id = ? and member_id=?  ";
			Object[] updObj = new Object[2];
			int k = 0;
			updObj[k++] = map.get("goods_id");
			updObj[k++] = map.get("member_id");
			
			res = jdbc.update(update, updObj);
		}
		
		return res;
	}   
	
	//获取商品
	public List<HashMap> getCartList(HashMap map){
		
		String sql ="SELECT cart_id, member_id, goods_id"
				+ "\n		, goods_name, price, goods_cnt"
				+ "\n		, img_url"
				+ "\n from sg_cart "
				+ "\n	where member_id = ?"
				+ "\n order by update_dt desc";
		
		//传空的参数
		Object[] obj = new Object[]{1};
		obj[0] = map.get("member_id");
		try {
			List<HashMap> list  = (List)jdbc.getList(sql, obj);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
