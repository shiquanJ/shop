package shop.controller.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.service.MainService;
import shop.service.mypage.MypageService;

@Controller
public class MypageController {
	@Autowired
	private MypageService mypageService;
	
	//注入service
	 /*@Autowired
	 private MypageService Service;*/
	@RequestMapping("/mypage")
	public ModelAndView main(HttpServletRequest req, HttpServletResponse res){	
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/mypage_main");
		
		//获取main页面信息
		mypageService.getMypageList(mv);
		
		return mv;
	}
}
