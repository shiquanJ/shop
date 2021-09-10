package shop.utils;

import java.io.UnsupportedEncodingException;
import java.security.AlgorithmParameters;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.Security;
import java.util.Arrays;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.util.encoders.Base64;

import net.sf.json.JSONObject;

public class CheckUtil {

	private static final String token = "weixin123";
	public static boolean checkSignature(String signature,String timestamp,String nonce) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		String [] arr = new String[]{token,timestamp,nonce} ;
		
		Arrays.sort(arr);
		
		StringBuffer content = new StringBuffer();
		for (int i = 0; i < arr.length; i++) {
			content.append(arr[i]);
		}
		String temp = getSha1(content.toString());
		return temp.equals(signature);
	}
	
	
	public static String getSha1(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException {
	    if (null == str || str.length() == 0){
	        return null;
	    }
	    char[] hexDigits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
	            'a', 'b', 'c', 'd', 'e', 'f'};
	    try {
	        MessageDigest mdTemp = MessageDigest.getInstance("SHA1");
	        mdTemp.update(str.getBytes("UTF-8"));

	        byte[] md = mdTemp.digest();
	        int j = md.length;
	        char[] buf = new char[j * 2];
	        int k = 0;
	        for (int i = 0; i < j; i++) {
	            byte byte0 = md[i];
	            buf[k++] = hexDigits[byte0 >>> 4 & 0xf];
	            buf[k++] = hexDigits[byte0 & 0xf];
	        }
	        return new String(buf);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	public static JSONObject getPhoneNumber(String encryptedData, String session_key, String iv) {
        // 被加密的数据
       byte[] dataByte = Base64.decode(encryptedData);
       // 加密秘钥
       byte[] keyByte = Base64.decode(session_key);
       // 偏移量
       byte[] ivByte = Base64.decode(iv);
       try {
           // 如果密钥不足16位，那么就补足.  这个if 中的内容很重要
           int base = 16;
           if (keyByte.length % base != 0) {
               int groups = keyByte.length / base + (keyByte.length % base != 0 ? 1 : 0);
               byte[] temp = new byte[groups * base];
               Arrays.fill(temp, (byte) 0);
               System.arraycopy(keyByte, 0, temp, 0, keyByte.length);
               keyByte = temp;
           }
           // 初始化
           Security.addProvider(new BouncyCastleProvider());
           Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
           SecretKeySpec spec = new SecretKeySpec(keyByte, "AES");
           AlgorithmParameters parameters = AlgorithmParameters.getInstance("AES");
           parameters.init(new IvParameterSpec(ivByte));
           cipher.init(Cipher.DECRYPT_MODE, spec, parameters);// 初始化
           byte[] resultByte = cipher.doFinal(dataByte);
           if (null != resultByte && resultByte.length > 0) {
               String result = new String(resultByte, "UTF-8");
               JSONObject json = JSONObject.fromObject(result);
               return json;
           }
       } catch (Exception e) {
           e.printStackTrace();
       }
       return null;
	}
}
