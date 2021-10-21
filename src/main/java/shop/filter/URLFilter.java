package shop.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter(filterName="urlFilter",urlPatterns="/*")
public class URLFilter implements Filter{
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		//Filter.super.init(filterConfig);
	}
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		Filter.super.destroy();
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain fileter)
			throws IOException, ServletException {
		
		try {
			HttpServletRequest req = (HttpServletRequest)request;
			HttpServletResponse res = (HttpServletResponse)response;
			
			/*System.out.println("param::::"+req.getQueryString());
			System.out.println("getServletPath::"+req.getServletPath());
			System.out.println("port::"+req.getServerPort());*/
			
			if(req.getServletPath().equals("/amazon/")){
				
				System.out.println("=====amazon======");
			}else{
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		fileter.doFilter(request, response);
		
	}

}
