package shop.controller.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.service.MainService;
import shop.service.user.LoginService;
import shop.utils.SessionUtil;

@Controller
public class LoginController {
	@Autowired
	private LoginService service;
	
	@Autowired
	private MainService mainService;
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
			
			if(member_pwd != null && member_pwd.equals(r_password)){
				
				map.put("member_id", chkLogin.get("member_id"));
				
				//获取用户信息
				Map<String, Object> userInfo = service.getUserInfo(map);
				
				map.put("session_id", req.getSession().getId());

				//更新用户表session
				service.updLoginSession(map);
				//用户信息存到session
				SessionUtil.setUserInfo(req ,userInfo);
				
				mv.addObject("userInfo",userInfo);
				
				//获取main页面信息
				mainService.getMainList(mv);
				
				mv.setViewName("/main");
			}else{
				// 访问login 页面 
				mv.setViewName("/user/login");
			}
		}
		else{
			// 访问login 页面 
			mv.setViewName("/user/login");
		}
		return mv;
		
	}
	
	//logout
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest req){
		
		ModelAndView mv = new ModelAndView();
		
		SessionUtil.clearSession(req);
		
		//获取main页面信息
		mainService.getMainList(mv);
		
		mv.setViewName("/main");
		
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
				mv.setViewName("/user/registration");
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
				mainService.getMainList(mv);
				
				mv.setViewName("/main");
			}
		}else{
			mv.setViewName("/user/registration");
		}
		
		return mv;
		
	}
}