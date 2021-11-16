package shop.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import shop.dao.MainDao;

@Component
public class MainService {
	
	@Autowired
	private MainDao dao;
	
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
	
}
