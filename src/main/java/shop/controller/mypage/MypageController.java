package shop.controller.mypage;

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

import shop.service.mypage.MypageService;
import shop.service.user.LoginService;

@Controller
public class MypageController {
	@Autowired
	private MypageService mypageService;
	@Autowired
	private LoginService loginService;	
	//注入service
	 /*@Autowired
	 private MypageService Service;*/
	@RequestMapping("/mypage")
	public ModelAndView main(HttpServletRequest req, HttpServletResponse res){	
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/mypage/mypage_main");
		
		//获取Mypage页面信息
		HashMap<String, String> map = new HashMap();
		map.put("user_id", "lilhylhy@cn.ibm.com");
		
		Map<String, Object> chkLogin = loginService.chkLogin(map);
		
		if(chkLogin == null) {
			List<HashMap> myinfoList = mypageService.getUserinfoList(map);
			mv.addObject("user_info", myinfoList);
			
		}else {
			// 访问login 页面 
			mv.setViewName("/user/login");		
		}
		
		return mv;
	}

	@RequestMapping("/save_userInfo_ajax")
	@ResponseBody
	public Map save_userInfo_ajax(HttpServletRequest req, HttpServletResponse res){	
		/*
		 * ModelAndView mv = new ModelAndView(); mv.setViewName("/jsonView");
		 */
		HashMap resultMap = new HashMap();
		//获取Mypage页面信息
		HashMap<String, Object> map = new HashMap();
		map.put("user_name", req.getParameter("user_name"));
		map.put("user_phone", req.getParameter("user_phone"));
		map.put("user_email", req.getParameter("user_email"));
		map.put("use_sex", req.getParameter("use_sex"));
		
		Map<String, Object> chkLogin = loginService.chkLogin(map);
		
		if(chkLogin == null) {
			map.put("user_id", chkLogin.get("member_id"));
			
			int cnt = mypageService.updUserinfo(map);
			
			if(cnt > 1) {
				resultMap.put("status","succ");
			}
		}else {
			resultMap.put("fail","succ");

		}
		
		return resultMap;
	}

}
