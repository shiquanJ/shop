package shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import shop.utils.JdbcUtil;

@Component
public class MainDao {
	@Autowired
	private JdbcUtil jdbc;
	
	public List<HashMap> getUserList(){
		
		String sql ="SELECT * FROM SG_MEMBER ";
		return (List)jdbc.getList(sql, null);
	}
	//获取 banner 
	public List<HashMap> getBannerList(){
		
		String sql ="SELECT * FROM SG_BANNER WHERE ISUSE='Y'";
		//传空的参数
		Object[] obj = new Object[]{};
		
		return (List)jdbc.getList(sql,obj);
	}
	//获取lookbook
	public List<HashMap> getLookBookList(){
			
		String sql ="SELECT * FROM SG_LOOKBOOK WHERE ISUSE='Y'";
		//传空的参数
		Object[] obj = new Object[]{};
		try {
			List<HashMap> list  = (List)jdbc.getList(sql,obj);
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	//获取商品
	public List<HashMap> getPrdList(){
		
		String sql ="SELECT * FROM SG_GOODS WHERE ISUSE='Y' ORDER BY UPDATE_DT DESC";
		
		//传空的参数
		Object[] obj = new Object[]{};
		try {
			List<HashMap> list  = (List)jdbc.getList(sql, obj);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//注册画面 获取DB密码
	public String getDBPwd(HashMap map){
		
		try {
			String sql ="\n SELECT MEMBER_ID, MEMBER_PWD "
					+ "\n FROM SG_MEMBER "
					+ "\n WHERE MEMBER_NAME = ? "
					+ "\n AND MEMBER_EMAIL = ?";
			
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
			String sql ="\n SELECT MEMBER_ID, MEMBER_PWD "
					+ "\n FROM SG_MEMBER "
					+ "\n WHERE MEMBER_EMAIL = ? OR MEMBER_PHONE = ?";
			
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
		
		String sql ="insert INTO  SG_MEMBER (MEMBER_NAME, MEMBER_EMAIL, MEMBER_PWD) VALUES(?,?,?) ";
		
		Object[] obj = new Object[3];
		obj[0] = map.get("r_name");
		obj[1] = map.get("r_email");
		obj[2] = map.get("r_password");
		
		return (int) jdbc.update(sql, obj);
	}
	
	//获取用户信息
	public Map<String,Object> getUserInfo(HashMap map){
		
		String sql ="SELECT * FROM sg_member WHERE member_id = ?";
		
		//传空的参数
		Object[] obj = new Object[1];
		obj[0] = map.get("member_id");
		
		return jdbc.queryForMap(sql, obj);
	}
}
