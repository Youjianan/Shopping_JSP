package util;

import java.util.*;
import java.io.*;
import java.sql.*;

public class DataUtil {
	private Connection conn = null;
	 
	private ResultSet rs = null;
 
	private PreparedStatement prestmt = null;
 
	public DataUtil() {
		String[] str = readConfigFile();
		try {
			Class.forName(str[0]);
			conn = DriverManager.getConnection(str[1], str[2], str[3]);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private String[] readConfigFile() {
		String[] str = new String[4];
		try {
			Properties props = new Properties();
			InputStream infile = this.getClass().getResourceAsStream("/ConfigFile/SystemConfig.properties");
			props.load(infile);
 
			str[0] = props.getProperty("driver");
			str[1] = props.getProperty("url");
			str[2] = props.getProperty("username");
			str[3] = props.getProperty("password");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return str;
	}
	
	public boolean CheckLogin(String table, String condition) {
		boolean flag = false;
		try {
			String sql = "select * from " + table + " where " + condition;
			prestmt = conn.prepareStatement(sql);
			rs = prestmt.executeQuery();
			if (rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean addData(String tableName, String[] field, String[] value) {
		boolean flag = false;
		if (field == null || value == null || field.length == 0 || value.length == 0 || field.length != value.length)
			return flag;
		String strField = "", strValue = "";
		for (int i = 0; i < field.length; i++) {
			strField += field[i] + ",";
			strValue += "'" + value[i] + "',";
		}
		strField = strField.substring(0, strField.lastIndexOf(","));
		strValue = strValue.substring(0, strValue.lastIndexOf(","));
		
		try {
			String sql = "insert into " + tableName;
			sql += " (" + strField + ") values(";
			sql += strValue + ")";
			prestmt = conn.prepareStatement(sql);
			int rscount = prestmt.executeUpdate();
			if (rscount > 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean deleteData(String table, String condition) {
		String sql = "";
		boolean flag = false;
		if (condition == null || condition == "") {
			sql = "delete from " + table;
		} else {
			sql = "delete from " + table + " where " + condition;
		}
		
		try {
			prestmt = conn.prepareStatement(sql);
			int rscount = prestmt.executeUpdate();
			if (rscount > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public boolean updateData(String table, String[] field, String[] value, String condition) {
		boolean flag = false;
		if (field == null || value == null || field.length == 0 || value.length == 0 || field.length != value.length)
			return flag;
		String str = "";
		for (int i = 0; i < field.length; i++) {
			str += field[i] + "='" + value[i] + "',";
		}
		str = str.substring(0, str.lastIndexOf(","));
		// Debug(str);
		String sql = "";
		if (condition == null || condition == "") {
			sql = "update " + table + " set " + str;
		} else {
			sql = "update " + table + " set " + str + " where " + condition;
		}
 
		try {
			prestmt = conn.prepareStatement(sql);
			int rscount = prestmt.executeUpdate();
			if (rscount > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public Vector<String[]> getData(String table, String[] field, String condition) {
		Vector<String[]> vec = new Vector<String[]>();
 
		String strField = "", sql = "";
		for (int i = 0; i < field.length; i++) {
			strField += field[i] + ",";
		}
		strField = strField.substring(0, strField.lastIndexOf(","));
		if (condition == null || condition == "") {
			sql = "select " + strField + " from " + table;
		} else {
			sql = "select " + strField + " from " + table + " where " + condition;
		}
		
		try {
			prestmt = conn.prepareStatement(sql);
			rs = prestmt.executeQuery();
			while (rs.next()) {
				String[] temp = new String[field.length];
				for (int i = 0; i < field.length; i++) {
					temp[i] = rs.getString(field[i]);
				}
				vec.add(temp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return vec;
	}
	
	//根据页码和每页的容量来得到数据
   public PageUtil getPage(int pageNo, int pageSize) {
       Vector<String[]> vec = new Vector<String[]>();
       PageUtil page = null;
       
       try {
           //获取总数据条数
           int totalCount = 0; 
           String sql = "select count(id) from goods";
           prestmt = conn.prepareStatement(sql);
           rs = prestmt.executeQuery();
           while(rs.next()){
               totalCount = rs.getInt(1);
           }
           
           String[] field = new String[] { "id" , "description", "price" };
           sql = "select id,description,price from goods limit " + (pageNo-1)*pageSize + "," + pageSize;
           prestmt = conn.prepareStatement(sql);
           rs = prestmt.executeQuery();
           while (rs.next()) {
			    String[] temp = new String[field.length];
				for (int i = 0; i < field.length; i++) {
					temp[i] = rs.getString(field[i]);
				}
				vec.add(temp);
           }
           page = new PageUtil(pageSize, totalCount);
           page.setData(vec);
       } catch (SQLException e) {
           e.printStackTrace();
       }
       return page;
   }
   
}
