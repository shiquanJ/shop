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
import shop.utils.SessionUtil;
import shop.utils.URLUtils;

@Controller
/*@ServletComponentScan("shop.filter")*/
@SpringBootApplication(scanBasePackages = "/shop")
public class MainController {
	public static final String PAYPAL_SUCCESS_URL = "pay/success";
    public static final String PAYPAL_CANCEL_URL = "pay/cancel";


    @Autowired
    private PayPalService paypalService;
	@Autowired
	private MainService service;
	@Autowired
	private SessionUtil sessionUtil;
	
	public static void main(String[] args) {
		SpringApplication.run(MainController.class, args);
	}
	
	@RequestMapping(value={"/","/index"})
	public ModelAndView main(HttpServletRequest req, HttpServletResponse res){
		ModelAndView mv = new ModelAndView();
		
		//获取main页面信息
		service.getMainList(mv);
		
		mv.setViewName("/index");
		
		return mv;
		
	}
	@RequestMapping(value={"/shop/","/shop/index"})
	public ModelAndView index(HttpServletRequest req, HttpServletResponse res){
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession(true);
		String usernm = req.getParameter("usernm");
		
		if(usernm == null){
			mv.setViewName("/index");
		}else{
			session.setAttribute("usernm", usernm);
			mv.setViewName("/index");
		}
			
		return mv;
			
	}
	@RequestMapping("/checkout")
	public ModelAndView checkout(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/checkout");
		return mv;
		
	}
	@RequestMapping("/cart")
	public ModelAndView cart(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/cart");
		return mv;
		
	}
	
	/**
	 * 
	 * 先check sessionId 有没有用户信息， 
	 * 没有用户，就用Email和pwd select 用户信息
	 * @return
	 */
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		
		String r_email = req.getParameter("r_email");
		String r_password = req.getParameter("r_password");
		if(r_email !=null && r_password != null){
			HashMap map = new HashMap();
			map.put("r_email", r_email);
			Map<String, Object> chkLogin = service.chkLogin(map);
			
			String member_pwd = (String) chkLogin.get("member_pwd");
			//有session的时候
			if(member_pwd != null && member_pwd.equals(r_password)){
				
				map.put("member_id", chkLogin.get("member_id"));
				Map<String, Object> userInfo = service.getUserInfo(map);
				
				map.put("session_id", req.getSession().getId());
				map.put("member_ip", "");
				
				mv.addObject("userInfo",userInfo);
				
				//获取main页面信息
				service.getMainList(mv);
				
				mv.setViewName("/index");
			}else{
				// 访问login 页面 
				mv.setViewName("/login");
			}
		}
		else{
			// 访问login 页面 
			mv.setViewName("/login");
		}
		return mv;
		
	}
	
	//注册
	@RequestMapping("/registration")
	public ModelAndView registration(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession(true);
		String gridRadios = req.getParameter("gridRadios");
		String r_name = req.getParameter("r_name");
		String r_email = req.getParameter("r_email");
		String r_password = req.getParameter("r_password");
		
		if(r_name != null &&r_email != null && r_password != null){
			//先获取db里的email
			HashMap map = new HashMap();
			map.put("r_name", r_name);
			map.put("r_email", r_email);
			String password = service.getDBPwd(map);
			if(password.equals(r_password)){
				//说明已经注册了
				mv.setViewName("/registration");
			}else{
				//可以注册了
				HashMap insertMap = new HashMap();
				insertMap.put("r_name", r_name);
				insertMap.put("r_email", r_email);
				insertMap.put("r_password", r_password);
				int i = service.insSG_MEMBER(insertMap);
				if(i == 0){
					mv.addObject("message", "注册失败");
				}
				//获取main页面信息
				service.getMainList(mv);
				
				mv.setViewName("/index");
			}
		}else{
			mv.setViewName("/registration");
		}
		
		return mv;
		
	}
	@RequestMapping("/compare")
	public ModelAndView compare(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/compare");
		return mv;
		
	}
	@RequestMapping("/wishlist")
	public ModelAndView wishlist(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/wishlist");
		return mv;
		
	}
	@RequestMapping("/shop-left-sidebar")
	public ModelAndView shop_left_sidebar(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/shop-left-sidebar");
		return mv;
		
	}
	@RequestMapping("/shop-right-sidebar")
	public ModelAndView shop_right_sidebar(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/shop-right-sidebar");
		return mv;
		
	}
	@RequestMapping("/blog")
	public ModelAndView blog(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/blog");
		return mv;
		
	}
	@RequestMapping("/portfolio-grid-2")
	public ModelAndView portfolio_grid_2(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/portfolio-grid-2");
		return mv;
		
	}
	@RequestMapping("/portfolio-grid-3")
	public ModelAndView portfolio_grid_3(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/portfolio-grid-3");
		return mv;
		
	}
	@RequestMapping("/portfolio-grid-4")
	public ModelAndView portfolio_grid_4(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/portfolio-grid-4");
		return mv;
		
	}
	@RequestMapping("/mesonary-grid-2")
	public ModelAndView mesonary_grid_2(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mesonary-grid-2");
		return mv;
	}
	@RequestMapping("/mesonary-grid-3")
	public ModelAndView mesonary_grid_3(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mesonary-grid-3");
		return mv;
	}
	@RequestMapping("/mesonary-grid-4")
	public ModelAndView mesonary_grid_4(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mesonary-grid-4");
		return mv;
	}
	@RequestMapping("/about-us")
	public ModelAndView about_us(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/about-us");
		return mv;
		
	}
	@RequestMapping("/single-product")
	public ModelAndView single_product(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/single-product");
		return mv;
		
	}
	@RequestMapping("/single-blog")
	public ModelAndView single_blog(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/single-blog");
		return mv;
		
	}
	@RequestMapping("/forgot")
	public ModelAndView forgot(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/forgot");
		return mv;
		
	}
	@RequestMapping("/title")
	public ModelAndView title(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/title");
		return mv;
		
	}
	@RequestMapping("/category-style")
	public ModelAndView category_style(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/category-style");
		return mv;
		
	}
	@RequestMapping("/services")
	public ModelAndView services(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/services");
		return mv;
		
	}
	@RequestMapping("/product-tab")
	public ModelAndView product_tab(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/product-tab");
		return mv;
		
	}
	@RequestMapping("/multi-slider-product")
	public ModelAndView multi_slider_product(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/multi-slider-product");
		return mv;
		
	}
	@RequestMapping("/blog-left-sidebar")
	public ModelAndView blog_left_sidebar(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/blog-left-sidebar");
		return mv;
		
	}
	@RequestMapping("/blog-right-sidebar")
	public ModelAndView blog_right_sidebar(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/blog-right-sidebar");
		return mv;
		
	}
	@RequestMapping("/goError")
	public ModelAndView amazon(HttpServletRequest req, HttpServletResponse res){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/error");
		return mv;
	}
	//购物车
    @RequestMapping("/goCart")
    public ModelAndView goCart(HttpServletRequest request){
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("/cart");
    	
    	String[] prdlist = request.getParameterValues("prdlist");
    	List list = new ArrayList();
    	HashMap map = new HashMap();
    	
    	// 商品settings
    	for (int i = 0; i < prdlist.length; i++) {
    		map = new HashMap();
			if(("PD0000001").equals(prdlist[i])){
				map.put("optname", "Hot Deal");
				map.put("prdname", "Product1 SPF 50+ PA++++");
				map.put("prdcd", "PD0000001");
				map.put("prdprice", "50");
				map.put("img", "https://images.innisfree.co.kr/upload/product/29802_p_S_107.jpg");
				map.put("idx", i);
				list.add(map);
			}
			else if(("PD0000002").equals(prdlist[i])){
				map.put("optname", "新产品");
				map.put("prdname", "Product2 SPF 50+");
				map.put("prdcd", "PD0000002");
				map.put("prdprice", "50");
				map.put("img", "https://images.innisfree.co.kr/upload/product/29302_l_S_107.jpg");
				map.put("idx", i);
				list.add(map);
			}
			else if(("PD0000003").equals(prdlist[i])){
				map.put("optname", "库存紧张");
				map.put("prdname", "Product3 Sample 50+");
				map.put("prdcd", "PD0000003");
				map.put("prdprice", "30");
				map.put("img", "https://images.innisfree.co.kr/upload/product/24588_l_S_107.jpg");
				map.put("idx", i);
				list.add(map);
			}
			else if(("PD0000004").equals(prdlist[i])){
				map.put("optname", "库存紧张");
				map.put("prdname", "Product4 Sample spa++");
				map.put("prdcd", "PD0000004");
				map.put("prdprice", "40");
				map.put("img", "https://images.innisfree.co.kr/upload/product/5424_l_S_107.jpg");
				map.put("idx", i);
				list.add(map);
			}
			else if(("PD0000005").equals(prdlist[i])){
				map.put("optname", "Hot Deal");
				map.put("prdname", "Product5");
				map.put("prdcd", "PD0000005");
				map.put("prdprice", "35");
				map.put("img", "https://images.innisfree.co.kr/upload/product/20446_l_S_107.jpg");
				map.put("idx", i);
				list.add(map);
			}
			else if(("PD0000006").equals(prdlist[i])){
				map.put("optname", "Hot Deal");
				map.put("prdname", "Product6 Sample spa++");
				map.put("prdcd", "PD0000006");
				map.put("prdprice", "20");
				map.put("img", "https://images.innisfree.co.kr/upload/product/28677_l_S_107.jpg");
				map.put("idx", i);
				list.add(map);
			}
			else if(("PD0000007").equals(prdlist[i])){
				map.put("optname", "Hot Deal");
				map.put("prdname", "Product7 Sample spa++");
				map.put("prdcd", "PD0000007");
				map.put("prdprice", "21");
				map.put("img", "https://images.innisfree.co.kr/upload/product/18239_l_S_107.jpg");
				map.put("idx", i);
				list.add(map);
			}
			else if(("PD0000008").equals(prdlist[i])){
				map.put("optname", "Hot Deal");
				map.put("prdname", "Product8 Sample spa++");
				map.put("prdcd", "PD0000008");
				map.put("prdprice", "15");
				map.put("img", "https://images.innisfree.co.kr/upload/product/28738_l_S_107.jpg");
				map.put("idx", i);
				list.add(map);
			}
		}
    	mv.addObject("prdlist",list);
    	return mv ; 
    }
    @RequestMapping("/pay")
    public String pay(HttpServletRequest request){
    	
    	//从前台获取个人信息
    	String firstName = request.getParameter("firstName");
    	String lastName =  request.getParameter("lastName");
    	String phonNumber =  request.getParameter("phonNumber");
    	String email_address =  request.getParameter("email_address");
    	String postal_code =  request.getParameter("postal_code");
    	String country_code =  request.getParameter("country_code");
    	String state =  request.getParameter("state");
    	String city =  request.getParameter("city");
    	String adress1 =  request.getParameter("adress1");
    	String adress2 =  request.getParameter("adress2");
    	
    	//获取订单信息
    	String [] prdprice =  request.getParameterValues("prdprice");
    	String [] prdqty =  request.getParameterValues("prdqty");
    	String [] prdname =  request.getParameterValues("prdname");
    	String [] prdcd =  request.getParameterValues("prdcd");
    	String [] selPrdFlag =  request.getParameterValues("selPrdFlag");
    	
    	String cancelUrl = URLUtils.getBaseURl(request) + "/" + PAYPAL_CANCEL_URL;
        String successUrl = URLUtils.getBaseURl(request) + "/" + PAYPAL_SUCCESS_URL;

        // 收货信息
        ShippingAddress shippingAddress = new ShippingAddress();
        shippingAddress.setState(state);
        shippingAddress.setCity(city);
        shippingAddress.setCountryCode(country_code);
        shippingAddress.setLine1(adress1);
        shippingAddress.setLine2(adress2);
        shippingAddress.setPhone(phonNumber);
        shippingAddress.setPostalCode(postal_code);
        shippingAddress.setRecipientName(firstName+"."+lastName);
        //商品信息
        ItemList itemList = new ItemList();
		List<Item> items = new ArrayList<Item>();
        Item item = new Item();
        Double total = 0.00;
        for (int i = 0; i < prdqty.length; i++) {
        	item = new Item();
        	//商品是否点击checkbox
        	if("Y".equals(selPrdFlag[i])){
        		total = total + (Double.valueOf(prdprice[i]) * Double.valueOf(prdqty[i]));
        		item.setName(prdname[i]).setQuantity(prdqty[i]).setCurrency("USD").setPrice(prdprice[i]).setSku(prdcd[i]);
        		items.add(item);
        	}
        	
		}
		itemList.setItems(items);
		
		 //订单信息
        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(total.toString());

        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        itemList.setShippingAddress(shippingAddress);
        transaction.setItemList(itemList);
        
        List<Transaction> transactions = new ArrayList<>();
        transactions.add(transaction);
        
        Payee payee = new Payee();
        payee.setEmail("sb-wr1ym6594779@business.example.com");
        
        Phone phone = new Phone();
        phone.setCountryCode("US");
        phone.setNationalNumber(phonNumber);
        
        Payer payer = new Payer();
        payer.setPaymentMethod(PaypalPaymentMethod.paypal.toString());
        
        //付款人信息
        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setEmail(email_address);
        payerInfo.setFirstName(firstName);
        payerInfo.setLastName(lastName);
        payer.setPayerInfo(payerInfo);
        
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl(cancelUrl);
        redirectUrls.setReturnUrl(successUrl);
        try {
        	//创建 payment 对象
            Payment payment = paypalService.createPayment(
            		transactions,
            		payer,
            		payee,
                    PaypalPaymentMethod.paypal, 
                    PaypalPaymentIntent.sale,
                    cancelUrl,
                    successUrl
                    );
            for(Links links : payment.getLinks()){
                if(links.getRel().equals("approval_url")){
                	System.out.println("return URL::"+links.getHref());
                	return "redirect:" + links.getHref();
                }
            }
        } catch (PayPalRESTException e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }
    //支付取消->返回cart页面
    @RequestMapping(method = RequestMethod.GET, value = PAYPAL_CANCEL_URL)
    public ModelAndView cancelPay(){
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("/index");
    	return mv;
    }

    //成功的时候返回到这里
    @RequestMapping(method = RequestMethod.GET, value = PAYPAL_SUCCESS_URL)
    public ModelAndView successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId){
    	ModelAndView mv = new ModelAndView();
    	try {
            Payment payment = paypalService.executePayment(paymentId, payerId);
            List<Transaction> transactions = payment.getTransactions();
            String ordercd = "";
            for (int i = 0; i < transactions.size(); i++) {
            	Transaction transaction = transactions.get(i);
            	List<RelatedResources> relatedResources = transaction.getRelatedResources();
            	for (int j = 0; j < relatedResources.size(); j++) {
            		RelatedResources relatedResources2 = relatedResources.get(j);
            		Sale sale = relatedResources2.getSale();
            		ordercd = sale.getId();
				}
			}
            if(payment.getState().equals("approved")){
            	mv.addObject("OrderID",ordercd);
            	mv.addObject("PaymentId",paymentId);
            	mv.addObject("PayerID",payerId);
            	mv.setViewName("pay/success_java");
            }
        } catch (Exception e) {
        	e.printStackTrace();
        }
        return mv;
    }
    //这是js sdk 过来的
    @RequestMapping("/complete")
    public ModelAndView searchOrder(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/pay/success_js");
		String orderID = request.getParameter("orderID");
		String payerID = request.getParameter("payerID");
		mv.addObject("OrderID",orderID);
		mv.addObject("PayerID",payerID);
		System.out.println("complete");
		return mv;
	}
    //支付失败页面
    @RequestMapping("/fail")
    public ModelAndView fail(HttpServletRequest request){
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("/pay/fail");
    	return mv;
    }
}
