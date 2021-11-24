package shop.utils;

import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Component
public class View extends ModelAndView{
	
    private static String real_url;
    private static String local_url;
    private static String server_type;
	
    @Value("${server_type}")
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
    }
    
    
	public View (){
		this.addObject("js_timer",FunctionUtil.getYYMMDDHHMMSS());
		if("LOCAL".equals(server_type)){
			this.addObject("server_url",local_url);
		}else if("REAL".equals(server_type)){
			this.addObject("server_url",real_url);
		}
	}
	public View (String str){
		this.setViewName(str);
		this.addObject("js_timer",FunctionUtil.getYYMMDDHHMMSS());
		if("LOCAL".equals(server_type)){
			this.addObject("server_url",local_url);
		}else if("REAL".equals(server_type)){
			this.addObject("server_url",real_url);
		}
	}
	
	//ajax호출 할때 return 값 
	@SuppressWarnings("unchecked")
	protected ModelAndView makeJsonResult(ModelAndView mav, String status, String message, Object object){
		StringBuffer sb = new StringBuffer();
		String tempStr = "";
		
		try {
			sb.append("{");
			sb.append("\"status\" : \"").append(status).append("\"");
			sb.append(", \"message\" : \"").append(message).append("\"");
			
			if(object !=null){
				sb.append(", \"object\" : ");
				
				if(object instanceof String){
					String str = FunctionUtil.getStrVal((String)object).trim();
					
					if((str.indexOf("{") == 0 && str.indexOf("}") == str.length()-1)
							|| (str.indexOf("[")==0 && str.indexOf("]") == str.length()-1)	){
						sb.append(str);
					}else{
						sb.append("\"").append(str).append("\"");
					}
				}else if(object instanceof JSONArray){
					JSONArray jArr = (JSONArray)object;
					Object obj = null;
					int len = jArr.length();
					
					try {
						sb.append("[");
						
						for(int i = 0; i< len; i++){
							if(i > 0){
								sb.append(",");
								
								obj =jArr.get(i);
								
								if(obj instanceof JSONObject){
									tempStr = ((JSONObject)obj).toString();
								}
								else if(obj instanceof HashMap){
									tempStr = new JSONObject((HashMap)obj).toString();
								}
								else{
									tempStr = ((JSONObject)obj).toString();
								}
								sb.append(tempStr);
							}
							sb.append("]");
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				}
				else {
					tempStr = ((JSONObject)object).toString();
				}
			}
			sb.append("}");
			
			tempStr = sb.toString();
			tempStr = tempStr.replaceAll("\\r\\n", "<br/>");
			tempStr = tempStr.replaceAll("\\n", "<br/>");
			mav.addObject("JSON", tempStr);
			
			mav.setViewName("jsonView");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
}
