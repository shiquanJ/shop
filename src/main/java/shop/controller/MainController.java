package shop.controller;

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
	private MainService mainservice;
	
	public static void main(String[] args) {
		SpringApplication.run(MainController.class, args);
	}
	
	@RequestMapping(value={"/","/index"})
	public ModelAndView index(HttpServletRequest req, HttpServletResponse res){
		res.setHeader("Access-Control-Allow-Origin", "http://localhost:8081");
		ModelAndView mv = new ModelAndView();
		HttpSession session = req.getSession(true);
		String usernm = req.getParameter("usernm");
		
		String userInfo = mainservice.getUserInfo();
		System.out.println(userInfo);
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
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/login");
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
	@RequestMapping("/registration")
	public ModelAndView registration(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/registration");
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
