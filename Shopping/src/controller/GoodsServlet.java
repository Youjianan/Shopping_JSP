package controller;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DataUtil;

public class GoodsServlet extends HttpServlet {
	
	private DataUtil du = new DataUtil();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//数据准备
		int id = Integer.parseInt(request.getParameter("id"));
		String tableName = "goods";
		String[] field = new String[]{"description","price","brand","cpu_brand","cpu_type","memory_capacity","hd_capacity","card_type","image","id"};
		String condition = "id='" + id + "'";
		Vector<String[]> vec = du.getData(tableName, field, condition);
		request.setAttribute("data", vec.get(0));
		gotoPath(request,response,"WEB-INF/detail.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	private void gotoPath(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
}
