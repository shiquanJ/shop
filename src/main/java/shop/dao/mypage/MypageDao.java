package shop.dao.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import shop.utils.JdbcUtil;

@Component
public class MypageDao {
	@Autowired
	private JdbcUtil jdbc;
	
	//my page 用户信息
	public List<HashMap> getUserinfoList(){
		
		String sql ="select user_id, user_wechat_id, user_nm, user_sex, user_phone, user_email,user_addr1,user_addr2,user_pass from sg_user where isuse='Y' and user_id = ?";
		//传空的参数
		Object[] obj = new Object[]{};
		
		return (List)jdbc.getList(sql,obj);
	}
	
}
