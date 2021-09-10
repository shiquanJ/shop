package shop.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import shop.utils.RedisUtil;

@Component
public class MainService {
	
	@Autowired
	private RedisUtil redisUtil;
	
	public ArrayList getSession(String session){
		
		return (ArrayList)redisUtil.get(session);
	}
	public boolean setSession(String session ,ArrayList userInfo){
		
		return redisUtil.lSet(session, userInfo);
	}
	
	public String getUserInfo(String email){
		
		return (String)redisUtil.get(email);
	}
	
	public boolean setUserInfo(String email, String pwd){
		
		return redisUtil.set(email, pwd);
	}
}
