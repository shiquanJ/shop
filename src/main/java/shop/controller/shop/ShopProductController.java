package shop.controller.shop;

import java.math.BigDecimal;
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
import shop.service.shop.ShopProductService;
import shop.utils.View;

@Controller
@RequestMapping("/shop")
public class ShopProductController {
	
	private View mv;
    
    @Autowired
    private ShopProductService service;
    
	@RequestMapping("/shop_prd_detail")
	public ModelAndView getCartList_Ajax(HttpServletRequest req, HttpServletResponse res){
		mv = new View();
		String goods_id = req.getParameter("goods_id");
		String cart_size = req.getParameter("cart_size");
		
		HashMap map = new HashMap();
		map.put("goods_id", goods_id);
		
		try {
			//获取购物车的商品map
			Map<String,Object> prdInfo = service.getPrdInfo(map);
			
			List<Map<String,Object>> optProList = service.getOptProList(map);
			
			mv.addObject("prdInfo",prdInfo);
			mv.addObject("optProList",optProList);
			mv.addObject("cart_size", cart_size);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("/shop/shop_prd_detail");
		mv.addObject("pagenm", "商品详细");
		return mv;
	}
	@RequestMapping("/getPrdDecInfo_ajax")
	@ResponseBody
	public Map<String, Object> getPrdDecInfo_ajax(HttpServletRequest req, HttpServletResponse res){
		String goods_id = req.getParameter("goods_id");
		String opt_goods_id = req.getParameter("opt_goods_id");
		
		HashMap map = new HashMap();
		map.put("goods_id", goods_id);
		map.put("opt_goods_id", opt_goods_id);
		
		try {
			//获取购物车的商品list
			Map<String, Object> incOptInfo = service.getPrdDecInfo(map);
			
			return incOptInfo;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
