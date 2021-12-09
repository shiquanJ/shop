package shop.controller.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import shop.service.cart.CartService;
import shop.utils.View;

@Controller
@RequestMapping("/cart")
public class CartController {
	
    private View mv;
    
    @Autowired
    private CartService service;
    
    
    // call ajax 
	@RequestMapping("/addCart_Ajax")
	@ResponseBody
	public List<HashMap> addCart_Ajax(HttpServletRequest req, HttpServletResponse res){
		
		String goods_id = req.getParameter("goods_id");
		String member_id = req.getParameter("member_id");
		
		HashMap map = new HashMap();
		map.put("goods_id", goods_id);
		map.put("member_id", member_id);
		//商品信息
		Map<String, Object> prdInfo = service.getPrdInfo(map);
		
		map.putAll(prdInfo);
		
		//加入购物车
		int insCart = service.insCart(map);
		//获取购物车的商品信息
		List<HashMap> cartList = service.getCartList(map);
		
<<<<<<< Updated upstream
		return cartList;
=======
		return String.valueOf(cartList.size());
	}
	// 获取购物车list
	@RequestMapping("/getCartList_ajax")
	public ModelAndView getCartList_Ajax(HttpServletRequest req, HttpServletResponse res){
		ModelAndView mv = new View();
		String member_id = req.getParameter("member_id");
		
		HashMap map = new HashMap();
		map.put("member_id", member_id);
		
		try {
			//获取购物车的商品list
			List<Map<String,Object>> cartList = service.getCartList(map);
			
			mv.addObject("cartList",cartList);
			float totPrice = 0;
			
			for (int i = 0; i < cartList.size(); i++) {
				Map lMap = (Map) cartList.get(i);
				
				BigDecimal price = (BigDecimal)lMap.get("price");
				
				int goods_cnt = (int)lMap.get("goods_cnt");
				
				totPrice += price.floatValue() * goods_cnt;
				
				System.out.println(totPrice);
				//totPrice = (BigDecimal)cartList.get(i).get("price") * (double)cartList.get(i).get("goods_cnt");
			}
			//总价
			mv.addObject("totPrice",totPrice);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("/cart/quickCart_ajax");
		return mv;
	}
	
	// 购物车加减数量方法
	@RequestMapping("/addQty_ajax")
	@ResponseBody
	public String addQty_ajax(HttpServletRequest req, HttpServletResponse res){
		String result = "fail";
		String cart_id = req.getParameter("cart_id");
		String member_id = req.getParameter("member_id");
		String goods_id = req.getParameter("goods_id");
		String flag = req.getParameter("flag");
		
		HashMap map = new HashMap();
		map.put("cart_id", cart_id);
		map.put("member_id", member_id);
		map.put("goods_id", goods_id);
		map.put("flag", flag);
		//加减商品数量
		int updRes = service.updCartQty(map);
		
		if(updRes > 0){
			result = "success";
		}
		return result;
	}
	// 删除购物车
	@RequestMapping("/delCart_ajax")
	@ResponseBody
	public HashMap delCart_ajax(HttpServletRequest req, HttpServletResponse res){
		HashMap resMap = new HashMap();
		
		String cart_id = req.getParameter("cart_id");
		String member_id = req.getParameter("member_id");
		String goods_id = req.getParameter("goods_id");
		
		HashMap map = new HashMap();
		map.put("cart_id", cart_id);
		map.put("member_id", member_id);
		map.put("goods_id", goods_id);
		map.put("isdel", "Y");
		//加减商品数量
		int del = service.updCartDel(map);
		
		List<Map<String,Object>> cartList = service.getCartList(map);
		
		resMap.put("list_cnt", cartList.size());
		if(del > 0){
			resMap.put("status", "success");
		}else{
			resMap.put("status", "fail");
		}
		return resMap;
>>>>>>> Stashed changes
	}
}
