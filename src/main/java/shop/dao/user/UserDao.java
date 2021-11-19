package shop.dao.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import shop.utils.JdbcUtil;
@Component
public class UserDao {
	@Autowired
	private JdbcUtil jdbc;
	//注册画面 获取DB密码
	public String getDBPwd(HashMap map){
		
		try {
			String sql ="\n select member_id, member_pwd "
					+ "\n from sg_member "
					+ "\n where member_name = ? "
					+ "\n and member_email = ?";
			
			Object[] obj = new Object[2];
			obj[0] = map.get("r_name");
			obj[1] = map.get("r_email");
			
			return (String) jdbc.getObject(sql, obj, String.class );
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	//login画面 获取DB密码
	public Map<String,Object> chkLogin(HashMap map){
		
		try {
			String sql ="\n select member_id, member_pwd "
					+ "\n from sg_member "
					+ "\n where member_email = ? or member_phone = ?";
			
			Object[] obj = new Object[2];
			obj[0] = map.get("r_email");
			obj[1] = map.get("r_email");
			return jdbc.queryForMap(sql, obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//注册
	public int insSG_MEMBER(HashMap map){
		
		String sql ="insert into sg_member (member_name, member_email, member_pwd) values(?,?,?) ";
		
		Object[] obj = new Object[3];
		obj[0] = map.get("r_name");
		obj[1] = map.get("r_email");
		obj[2] = map.get("r_password");
		
		return (int) jdbc.update(sql, obj);
	}
	
	//获取用户信息
	public Map<String,Object> getUserInfo(HashMap map){
		
		String sql ="select member_id, member_name,member_pwd, member_email"
				+ "\n		,member_level, member_label,member_ip"
				+ "\n		,member_phone, img_url,memo"
				+ "\n from sg_member where member_id = ?";
		
		//传空的参数
		Object[] obj = new Object[1];
		obj[0] = map.get("member_id");
		
		return jdbc.queryForMap(sql, obj);
	}
	
	//更新用户session
	public int updLoginSession(HashMap map){
			
		String sql ="update sg_member set session_id= ? where member_id = ? ";
			
		Object[] obj = new Object[2];
		obj[0] = map.get("session_id");
		obj[1] = map.get("member_id");
			
		return (int) jdbc.update(sql, obj);
	}
	
	//check session值
	public int chkLoginSession(HashMap map){
		
		String sql ="select count(*) from sg_member where session_id = ? ";
		
		Object[] obj = new Object[1];
		obj[0] = map.get("session_id");
		
		return (int) jdbc.getObject(sql, obj, Integer.class);
	}
}
