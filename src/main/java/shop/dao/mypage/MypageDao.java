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
	public List<HashMap> getUserinfoList(HashMap map){
		
		String sql ="select user_id, user_wechat_id, user_nm, user_sex, user_phone, user_email,user_addr1,user_addr2,user_pass from sg_user where isuse='Y' and user_id = ?";
		//传空的参数
		Object[] obj = new Object[1];
	
		obj[0] = map.get("user_id");
		
		return (List)jdbc.getList(sql,obj);
	}

	//更新用户
	public int updUserinfo(HashMap map){
			
		String sql ="update sg_user set user_nm= ? ,user_phone = ? , user_email = ?,user_sex = ?  where  user_id = ? ";
			
		Object[] obj = new Object[5];
		obj[0] = map.get("session_id");
		obj[1] = map.get("member_id");
		obj[2] = map.get("member_id");
		obj[3] = map.get("member_id");
		obj[4] = map.get("member_id");
		
		return (int) jdbc.update(sql, obj);
	}
	
}
