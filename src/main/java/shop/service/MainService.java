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
	public List<HashMap> getBannerList(){
		
		return dao.getBannerList();
	}
	
	public List<HashMap> getLookBookList(){
		
		return dao.getLookBookList();
	}
	
	public List<HashMap> getPrdList(){
		
		return dao.getPrdList();
	}
	
}
