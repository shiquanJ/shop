package shop.controller.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.service.manager.OrderService;
import shop.utils.AJAXResult;
import shop.utils.PageHelper;
import shop.utils.ShopConstants;

@Controller
@RequestMapping("/manager/order")
public class OrderController {

	@Autowired
	private OrderService service;
	
	@RequestMapping(value="list")
	public String list() {
		return "/manager/order/list";
	}
	
	@RequestMapping(value="/data")
	@ResponseBody
	public Object data(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo){
		
		Map<String, Object> map = new HashMap<>();
		map.put("start", (pageNo-1) * ShopConstants.LIST_SIZE);
		map.put("size", ShopConstants.LIST_SIZE);
		
		List list = service.getOrderList(map);
		int totalsize = service.getOrderCount(map);
		
		int totalNo = 0;
		if ( totalsize % ShopConstants.LIST_SIZE == 0 ) {
			totalNo = totalsize / ShopConstants.LIST_SIZE;
		} else {
			totalNo = totalsize / ShopConstants.LIST_SIZE + 1;
		}
		
		PageHelper pageHelper = new PageHelper();
		pageHelper.setDatas(list);
		pageHelper.setTotalNo(totalNo);
		pageHelper.setTotalSize(totalsize);
		pageHelper.setPageNo(pageNo);
		
		AJAXResult result = new AJAXResult();
		result.setSuccess(true);
		result.setData(pageHelper);
		
		return result;
		
	}
    	
}
