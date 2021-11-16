package shop.utils;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
@Component
public class JdbcUtil {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public ArrayList getList(String sql){
		
		return (ArrayList)jdbcTemplate.queryForList(sql);
	}
}
