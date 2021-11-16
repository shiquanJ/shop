package shop.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import shop.utils.JdbcUtil;
@Component
public class MainDao {
	@Autowired
	private JdbcUtil jdbc;
	
	public List<HashMap> getUserList(){
		
		String sql ="select * from sg_member";
		return jdbc.getList(sql);
	}
	//banner
	public List<HashMap> getBannerList(){
		
		String sql ="select * from sg_banner where isuse='Y'";
		return jdbc.getList(sql);
	}
	//banner
	public List<HashMap> getLookBookList(){
			
		String sql ="select * from sg_lookbook where isuse='Y'";
		return jdbc.getList(sql);
	}
	
	//banner
	public List<HashMap> getPrdList(){
		
		String sql ="select * from sg_goods where isuse='Y' order by update_dt desc";
		return jdbc.getList(sql);
	}
}
