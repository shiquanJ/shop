package shop.utils;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import shop.utils.FunctionUtil;
@Component
public class View extends ModelAndView{
	
    private static String real_url;
    private static String local_url;
    private static String server_type;
	
    /*@Value("${server_type}")
	public void setServer_url(String type){
    	server_type = type;
	}
    @Value("${real_url}")
    public void setReal_url(String url){
    	real_url = url;
    }
    @Value("${local_url}")
    public void setLocal_url(String url){
    	local_url = url;
    }*/
    
    
	public View (){
		
		this.addObject("pagenm","SGSHOP");
		this.addObject("js_timer",FunctionUtil.getYYMMDDHHMMSS());
		/*if("LOCAL".equals(server_type)){
			this.addObject("server_url",local_url);
		}else if("REAL".equals(server_type)){
			this.addObject("server_url",real_url);
		}*/
	}
	public View (String str){
		this.setViewName(str);
		this.addObject("js_timer",FunctionUtil.getYYMMDDHHMMSS());
		/*if("LOCAL".equals(server_type)){
			this.addObject("server_url",local_url);
		}else if("REAL".equals(server_type)){
			this.addObject("server_url",real_url);
		}*/
	}
	
}
