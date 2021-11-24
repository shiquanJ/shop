package shop.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import shop.dao.MainDao;
import shop.dao.cart.CartDao;

@Component
public class MainService {
	
	@Autowired
	private MainDao dao;
	@Autowired
	private CartDao cdao;
	
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
	
	public List<HashMap> getCartList(HashMap map){
		
		return cdao.getCartList(map);
	}
	
}
