package shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import shop.utils.RedisUtil;

@Component
public class MainService {
	
	@Autowired
	private RedisUtil redisUtil;
	
	public String getUserInfo(){
		
		return (String)redisUtil.get("userInfo");
	}
}
