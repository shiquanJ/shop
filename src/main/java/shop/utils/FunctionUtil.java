package shop.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.stereotype.Component;

@Component
public class FunctionUtil {

	public static String getYMDHMS(){
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		return  dateFormat.format(cal.getTime());
	}
	public static String getYYMMDDHHMMSS(){
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		Calendar cal = Calendar.getInstance();
		return  dateFormat.format(cal.getTime());
	}
	
	public static String strNvl(Object obj){
		String str ="";
		if(obj == null){
			return str;
		}else{
			return (String)obj;
		}
	}
	
	
}
