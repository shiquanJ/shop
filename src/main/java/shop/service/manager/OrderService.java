package shop.service.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

import shop.dao.manager.OrderDao;

@Component
public class OrderService {

	@Autowired
	private OrderDao dao;
	
	public String generateOrderId() {
		String generateOrderId = dao.generateOrderId();
		return generateOrderId;
	}

	public List getOrderList(Map<String, Object> map) {
		List list = dao.getOrderList(map);
		return list;
	}

	public int getOrderCount(Map<String, Object> map) {
		int count = dao.getOrderCount(map);		
		return count;
	}
	
}
