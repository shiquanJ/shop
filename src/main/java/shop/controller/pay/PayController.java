package shop.controller.pay;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.utils.View;

@Controller
@RequestMapping("/pay")
public class PayController {

	private View mv;
	@RequestMapping("/payment")
	public ModelAndView payment(HttpServletRequest req, HttpServletResponse res){
		
		mv = new View();
		
		String member_id = req.getParameter("member_id");
		String goods_id = req.getParameter("goods_id");
		String opt_goods_id = req.getParameter("opt_goods_id");
		String goods_qty = req.getParameter("goods_qty");
		
		
		
		
		mv.setViewName("/pay/pament");
		
		return mv;
		
	}
}
