package shop.service.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import shop.dao.user.UserDao;

@Component
public class LoginService {
	@Autowired
	private UserDao dao;
	//获取DB密码
	public String getDBPwd(HashMap map){
		
		return dao.getDBPwd(map);
	}
	
	//用户注册
	public int insSG_MEMBER(HashMap map){
		
		return dao.insSG_MEMBER(map);
	}
	//login的时候 check有没有用户
	public Map<String,Object> chkLogin(HashMap map){
		
		return dao.chkLogin(map);
	}
	// 获取用户信息
	public Map<String,Object> getUserInfo(HashMap map){
		
		return dao.getUserInfo(map);
	}
	
	//更新用户session
	public int updLoginSession(HashMap map){
		return dao.updLoginSession(map);
	}
	
	//check session值
	public int chkLoginSession(HashMap map){
		return dao.chkLoginSession(map);
	}
}
