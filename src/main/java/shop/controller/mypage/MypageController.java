package shop.controller.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageController {
	//注入service
	 /*@Autowired
	 private MypageService Service;*/
	@RequestMapping("/mypage")
	public ModelAndView main(HttpServletRequest req, HttpServletResponse res){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/mypage_main");
		return mv;
	}
}
