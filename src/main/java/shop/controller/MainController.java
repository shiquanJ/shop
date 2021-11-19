package shop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payee;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Phone;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.RelatedResources;
import com.paypal.api.payments.Sale;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import shop.bean.PaypalPaymentIntent;
import shop.bean.PaypalPaymentMethod;
import shop.service.MainService;
import shop.service.PayPalService;
import shop.service.user.LoginService;
import shop.utils.URLUtils;

@Controller
@ServletComponentScan("shop.filter")
@SpringBootApplication(scanBasePackages = "/shop")
public class MainController {
	public static final String PAYPAL_SUCCESS_URL = "pay/success";
    public static final String PAYPAL_CANCEL_URL = "pay/cancel";


    @Autowired
    private PayPalService paypalService;
	@Autowired
	private MainService service;
	@Autowired
	private LoginService loginService;
	
	public static void main(String[] args) {
		SpringApplication.run(MainController.class, args);
	}
	
	@RequestMapping(value={"/","/index"})
	public ModelAndView main(HttpServletRequest req, HttpServletResponse res){
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = req.getSession(true);
		
		if(session != null){
			System.out.println("session::"+session.getId());
			HashMap map = new HashMap();
			map.put("session_id", session.getId());
			//check session值
			int cnt = loginService.chkLoginSession(map);
			if(cnt > 0){
				Map<String, Object> userInfo = (Map)session.getAttribute("userInfo");
				mv.addObject("userInfo", userInfo);
			}else{
				session.invalidate();
			}
		}
		
		//获取main页面信息
		service.getMainList(mv);
		
		mv.setViewName("/main");
		
		return mv;
		
	}
}
