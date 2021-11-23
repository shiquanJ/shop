package shop.controller.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.utils.View;

@Controller
public class MypageController {
	//注入service
	 /*@Autowired
	 private MypageService Service;*/
    private View mv;
	
	@RequestMapping("/mypage")
	public ModelAndView main(HttpServletRequest req, HttpServletResponse res){
		
		mv = new View();
		mv.setViewName("/mypage/mypage_main");
		return mv;
	}
}
