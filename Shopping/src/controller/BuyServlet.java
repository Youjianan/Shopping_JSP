package controller;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DataUtil;

public class BuyServlet extends HttpServlet {
	
	DataUtil du = new DataUtil();

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestPath = request.getRequestURI();
		HttpSession session = request.getSession();
		String number = "1";
		if(requestPath.contains("add")||requestPath.contains("min")){
			number = request.getParameter("number");
			session.setAttribute("number", number);
		} else{
			//获取购买物品的id及相关数据
			int id = Integer.parseInt(request.getParameter("id"));
			String tableName = "goods";
			String[] field = new String[]{"id","name","price"};
			String condition = "id='" + id + "'";
			Vector<String[]> vec = du.getData(tableName, field, condition);
			
			//将购买物品的相关数据添加至数据库
			tableName = "buy";
			String[] finalField = new String[]{"id","name","price","number"};
			String[] value = vec.get(0);
			String[] finalValue = new String[4];
			for (int i = 0; i < value.length; i++) {
				finalValue[i] = value[i];
			}
			finalValue[3] = (String) session.getAttribute("number");
			du.addData(tableName, finalField, finalValue);
			
			//不跳转链接，回到原来界面
			tableName = "goods";
			field = new String[]{"description","price","brand","cpu_brand","cpu_type","memory_capacity","hd_capacity","card_type","image","id"};
			condition = "id='" + id + "'";
			vec = du.getData(tableName, field, condition);
			request.setAttribute("data", vec.get(0));
			gotoPath(request, response, "WEB-INF/detail.jsp");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	private void gotoPath(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
}
