package util;

import java.io.UnsupportedEncodingException;
 
public class Fn {
	
	/**
	 * 乱码处理
	 * @param temp
	 * @return
	 */
	public static String GBK(String temp){
		try {
			return new String(temp.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
		}
		return "";
	}
 
}