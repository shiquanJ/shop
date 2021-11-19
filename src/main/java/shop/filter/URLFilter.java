package shop.filter;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
@Component
public class URLFilter implements Filter{

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		servletRequest.setCharacterEncoding("UTF-8");
		filterChain.doFilter(servletRequest, servletResponse);
	}
	
	public HashMap getIp(HttpServletRequest req){
		HashMap map = new HashMap();
		
		String browser = req.getHeader("User-Agent");
		String ip = req.getHeader("x-forwarded-for");
		//防止反向代理
		if(ip !=null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)){
			
			if(ip.indexOf(",") != -1){
				ip = ip.split(",")[0];  //获取第一个IP
			}
		}
		
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
			ip = req.getHeader("Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
			ip = req.getHeader("WL-Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
			ip = req.getHeader("HTTP-CLIENT-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
			ip = req.getHeader("HTTP-X_FORWARDED-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
			ip = req.getHeader("X-Real-IP");
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
			ip = req.getRemoteAddr();
		}
		
		map.put("ip", ip);
		map.put("browser", browser);
		
		return map; 
	}
}
