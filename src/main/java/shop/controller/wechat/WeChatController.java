package shop.controller.wechat;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;
import shop.utils.HttpClientUtil;

@Controller
public class WeChatController {
	@RequestMapping("/getPhoneNumber")
	@ResponseBody
	public Map<String, String> getPhoneNumber(HttpServletRequest req, HttpServletResponse res){
		
		String code = req.getParameter("code");
		
		Map<String,String> resMap = null;
		
		try {
			
			String token = getToken();
			String uri = "https://api.weixin.qq.com/wxa/business/getuserphonenumber?access_token=ACCESS_TOKEN";
			
			Map<String,String> param = null;
			param.put("code", code);
			param.put("access_token ", token);
			
			String result = HttpClientUtil.doPost(uri,param);
			
			System.out.println("result:::"+result);
			
			JSONObject fromObject = JSONObject.fromObject(result);
			
			String phoneNumber = fromObject.get("phoneNumber").toString();
			String purePhoneNumber = fromObject.get("purePhoneNumber").toString();
			String countryCode = fromObject.get("countryCode").toString();
			
			resMap.put("phoneNumber", phoneNumber);
			resMap.put("purePhoneNumber", purePhoneNumber);
			resMap.put("countryCode", countryCode);
			return resMap;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	// 获取 token
	public String getToken(){
		
		String uri = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx0dce03266ee2f937&secret=aa4e9777d3d5f1c4b270283416d770e0";
		String result = HttpClientUtil.doGet(uri);
			
		System.out.println("result:::"+result);
		
		JSONObject fromObject = JSONObject.fromObject(result);
			
		String token = fromObject.get("access_token").toString();
		return token;
	}
}
