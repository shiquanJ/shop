package shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import shop.dao.MainDao;

@Component
public class MainService {
	
	@Autowired
	private MainDao dao;
	
	public void getMainList(ModelAndView mv){
		//获取main页面信息
		mv.addObject("bannerList", this.getBannerList());
		mv.addObject("lookbookList", this.getLookBookList());
		mv.addObject("prdList", this.getPrdList());
	}
	public List<HashMap> getUserList(){
		
		return dao.getUserList();
	}
	
	public List<HashMap> getBannerList(){
		
		return dao.getBannerList();
	}
	
	public List<HashMap> getLookBookList(){
		
		return dao.getLookBookList();
	}
	
	public List<HashMap> getPrdList(){
		
		return dao.getPrdList();
	}
	
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
	
}
