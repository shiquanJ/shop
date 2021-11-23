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

import shop.service.cart.cartService;
import shop.utils.View;

@Controller
@RequestMapping("/cart")
public class CartController {
	
    private View mv;
    
    @Autowired
    private cartService service;
    
	@RequestMapping("/addCart_Ajax")
	@ResponseBody
	public ModelAndView addCart_Ajax(HttpServletRequest req, HttpServletResponse res){
		mv = new View();
		
		String goods_id = req.getParameter("goods_id");
		String member_id = req.getParameter("member_id");
		
		HashMap map = new HashMap();
		map.put("goods_id", goods_id);
		map.put("member_id", member_id);
		Map<String, Object> prdInfo = service.getPrdInfo(map);
		
		map.putAll(prdInfo);
		
		int insCart = service.insCart(map);
		
		List<HashMap> cartList = service.getCartList(map);
		
		mv.addObject("cartList", cartList);
		
		mv.setViewName("json");
		return mv;
	}
}
