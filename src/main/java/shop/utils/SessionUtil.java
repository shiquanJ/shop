package shop.utils;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
@Component
public class SessionUtil {
	
	public HashMap getSessionInfo(HttpServletRequest request){
		
		HttpSession session = request.getSession(false);
		
		HashMap map = new HashMap();
		if(session != null){
			map.put("session_pwd", (String)session.getAttribute("session_pwd"));
		}
		return map;
	}
	
	public static void setUserInfo(HttpServletRequest request, Map<String, Object> map){
		
		HttpSession session = request.getSession(true);
		session.setAttribute("userInfo", map);
		
	}
	public static void clearSession(HttpServletRequest request){
		
		HttpSession session = request.getSession(true);
		session.invalidate();
	}
	
	
}
