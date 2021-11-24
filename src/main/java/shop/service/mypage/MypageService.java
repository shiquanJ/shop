package shop.service.mypage;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import shop.dao.mypage.MypageDao;

@Component
public class MypageService {
	
	@Autowired
	private MypageDao dao;
	
	public void getMypageList(ModelAndView mv){
		//获取main页面信息
		mv.addObject("getUserinfoList", this.getUserinfoList());
	}
	@SuppressWarnings("rawtypes")
	public List<HashMap> getUserinfoList(){
		
		return dao.getUserinfoList();
	}
	
	
}
