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
	
	
	//获取cart_id
	public Map<String, Object> getCartId(HashMap map){
		String sql ="select cart_id, isdel, goods_id from sg_cart where member_id=? and goods_id = ?";
		Object[] obj = new Object[2];
		obj[0] = map.get("member_id");
		obj[1] = map.get("goods_id");
		
		List<Map<String, Object>> list = jdbc.getList(sql, obj);
		
		if(list.size() > 0){
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> cartMap = list.get(i);
				return cartMap;
			}
		}else{
			//有cartid 没商品
			String sql2 ="select cart_id, '' AS goods_id from sg_cart where member_id=?";
			Object[] obj2 = new Object[1];
			obj2[0] = map.get("member_id");
			
			List<Map<String, Object>> list2 = jdbc.getList(sql2, obj2);
			
			if(list2.size() > 0){
				for (int i = 0; i < list2.size(); i++) {
					Map<String, Object> cartMap = list2.get(i);
					return cartMap;
				}
			}
		}
		return null;
	}
	//加入购物车
	public int insCart(HashMap map){
		
		int res =0;
		
		StringBuffer insert = new StringBuffer();
		insert.append("\n	insert into sg_cart");
		insert.append("\n	(member_id, goods_id");
		insert.append("\n	, goods_name, price, goods_cnt");
		insert.append("\n	,img_url");
		if(!"".equals(map.get("cart_id"))){
			insert.append("\n	,cart_id");
		}
		insert.append("\n	)		");
		insert.append("\n	values			");
		insert.append("\n	 (?, ?			");
		insert.append("\n	,?, ?, 1		");
		insert.append("\n	,?");
		if(!"".equals(map.get("cart_id"))){
			insert.append("\n	,?				");
		}
		insert.append("\n	)				");
		Object[] insObj = new Object[map.get("cart_id").equals("")?5:6];
		int j = 0;
		insObj[j++] = map.get("member_id");
		insObj[j++] = map.get("goods_id");
		insObj[j++] = map.get("goods_name");
		insObj[j++] = map.get("price");
		insObj[j++] = map.get("img_url");
		if(!"".equals(map.get("cart_id"))){
			insObj[j++] = map.get("cart_id");
		}
		System.out.println(insert.toString());
		res = jdbc.update(insert.toString(), insObj);	
		
		return res;
	}   
	
	//获取商品
	public List<Map<String,Object>> getCartList(HashMap map){
		
		String sql ="select cart_id, member_id, goods_id"
				+ "\n		, goods_name, price, goods_cnt"
				+ "\n		, img_url"
				+ "\n from sg_cart "
				+ "\n	where member_id = ? and isdel='N'"
				+ "\n order by update_dt desc";
		
		//传空的参数
		Object[] obj = new Object[]{1};
		obj[0] = map.get("member_id");
		try {
			List<Map<String,Object>> list  = (List)jdbc.getList(sql, obj);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int updCartQty(HashMap map){
		
		int res = 0;
		try {
			
			String sql= "update sg_cart set goods_cnt = goods_cnt" + map.get("flag")+"1 where cart_id= ? and goods_id = ? and member_id=?  " ;
			System.out.println(sql);
			Object[] updObj = new Object[3];
			updObj[0] = map.get("cart_id");
			updObj[1] = map.get("goods_id");
			updObj[2] = map.get("member_id");
			
			res = jdbc.update(sql, updObj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	//删除购物车
	public int updCartDel(HashMap map){
		
		int res = 0;
		try {
			
			String sql= "update sg_cart set isdel= ? , goods_cnt ='1' where cart_id= ? and goods_id = ? and member_id=?  " ;
			System.out.println(sql);
			Object[] updObj = new Object[4];
			updObj[0] = map.get("isdel");
			updObj[1] = map.get("cart_id");
			updObj[2] = map.get("goods_id");
			updObj[3] = map.get("member_id");
			
			res = jdbc.update(sql, updObj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
}
