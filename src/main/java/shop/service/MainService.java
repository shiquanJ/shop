package shop.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import shop.utils.RedisUtil;

@Component
public class MainService {
	
	@Autowired
	private RedisUtil redisUtil;
	
	public HashMap getSession(String session){
		
		return (HashMap)redisUtil.hmget(session);
	}
	public boolean setSession(String session ,HashMap userMap){
		
		return redisUtil.hmset(session, userMap);
	}
	
	public String getUserInfo(String email){
		
		return (String)redisUtil.get(email);
	}
	
	public boolean setUserInfo(String email, String pwd){
		
		return redisUtil.set(email, pwd);
	}
}
