package shop.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.service.MainService;

@Controller
@SpringBootApplication(scanBasePackages = "shop")
public class MainController {
	
	@Autowired
	private MainService service;
	
	public static void main(String[] args) {
		SpringApplication.run(MainController.class, args);
	}
	
	@RequestMapping(value={"/","/index"})
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
	
	//login
	/**
	 * 
	 * 先check sessionId 有没有用户信息， 
	 * 没有用户，就用Email和pwd select 用户信息
	 * @return
	 */
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession(false);
		HashMap map = new HashMap();
		boolean sessionFlag = false;
		
		String email = req.getParameter("user_email");
		String pwd = req.getParameter("user_password");
		
		if(session != null && email !=null){
			System.out.println(session.getId());
			HashMap userMap = service.getSession(session.getId());
			if(userMap.get("pwd").equals(pwd)){
				sessionFlag = true;
				mv.setViewName("/index");
			
			}else{
				String password = service.getUserInfo(email);
				if(password != null){
					if(pwd.equals(password)){
						mv.setViewName("/index");
					}else{
						mv.setViewName("/login");
					}
				}else{
					mv.addObject("noUser", "noUser");
					mv.setViewName("/login");
				}
			}
		}else{
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
		String email = req.getParameter("r_email");
		String pwd = req.getParameter("r_password");
		
		if(email != null && pwd != null){
			//先获取db里的email
			String password = service.getUserInfo(email);
			if(password != null){
				//说明已经注册了
				
				mv.setViewName("/registration");
			}else{
				//可以注册了
				HashMap userMap = new HashMap();
				userMap.put("email", email);
				userMap.put("pwd", pwd);
				service.setSession(session.getId(),userMap);
				
				service.setUserInfo(email, pwd);
				
				mv.addObject("regSuccess","Y");
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
	@RequestMapping("/amazon")
	public ModelAndView amazon(HttpServletRequest req, HttpServletResponse res){
		res.addHeader("Access-Control-Allow-Origin", "*");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/index");
		return mv;
	}
}
