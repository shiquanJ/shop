package shop.dao.manager;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import shop.utils.JdbcUtil;

@Component
public class OrderDao {

	@Autowired
	private JdbcUtil jdbc;
	
	public String generateOrderId(){
		String sql ="SELECT CONCAT('SG', DATE_FORMAT(now(), '%Y%m%d%H%i%s')) AS ORDER_SEQ FROM DUAL";
		String orderSeq = (String)jdbc.getObject(sql, null, String.class);
		return orderSeq;
	}

	public List getOrderList(Map<String, Object> map) {
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("SELECT 								");
		sb.append("	id, 								");
		sb.append("	username, 							");
		sb.append("	email, 								");
		sb.append("	amount, 							");
		sb.append("	status, 							");
		sb.append("	create_time, 						");
		sb.append("	update_time, 						");
		sb.append("	del_flag 							");
		sb.append("FROM 								");
		sb.append("	sg_shop.sg_order_master 			");
		sb.append("WHERE 1 = 1							");
		//sb.append("	-- AND id='SG20211203115930' ");
		sb.append("ORDER BY ID DESC						");
		sb.append("LIMIT ?, ? 							");
		
		Object[] obj = new Object[2];
		obj[0] = map.get("start");
		obj[1] = map.get("size");
		
		String sql = sb.toString();
		
		List list = jdbc.getList(sql, obj);
		
		return list;
	}

	public int getOrderCount(Map<String, Object> map) {
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("SELECT 								");
		sb.append("	COUNT(1) 							");
		sb.append("FROM 								");
		sb.append("	sg_shop.sg_order_master 			");
		sb.append("WHERE 1 = 1							");
		//sb.append("	-- AND id='SG20211203115930' ");
		
		Object[] obj = new Object[0];
		//obj[0] = map.get("start");
		//obj[1] = map.get("size");
		
		String sql = sb.toString();
		
		Integer count = (Integer) jdbc.getObject(sql, obj, Integer.class );
		
		return count;
	}
	
}
