package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DataUtil;

public class BuyUpdateServlet extends HttpServlet {
	
	DataUtil du = new DataUtil();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String requestPath = request.getRequestURI();// 得到请求路径
		if(requestPath.contains("delete")){
			//购物车商品删除
			String tableName = "buy";
			String condition = "";
			String name = request.getParameter("name");
			int length = 0;
			
			//根据逗号数判断要删除的商品数
			for(int i = 0; i < name.length(); i++){
				if(name.substring(i, i+1).equals(",")){
					length++;
				}
			}
			String[] strName = new String[length];
			
			//去除字符串中的逗号
			for(int i = 0; i < length; i++){
				strName[i] = name.substring(0 , name.indexOf(","));
				condition = "name='" + strName[i] + "'";
				du.deleteData(tableName, condition);
				
				name = name.substring(name.indexOf(",")+1,name.length());
			}
		
		}else if(requestPath.contains("update")){
			//购物车数量更新
			String name = request.getParameter("name");
			String number = request.getParameter("number");
			String tableName = "buy";
			String[] field = new String[]{"number"};
			String[] value = new String[]{number};
			String condition = "name='" + name + "'";
			du.updateData(tableName, field, value, condition);
		}
	}

}
