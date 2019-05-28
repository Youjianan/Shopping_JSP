package controller;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DataUtil;

public class ShowBuyServlet extends HttpServlet {
	
	DataUtil du = new DataUtil();

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tableName = "buy";
		String[] field = new String[]{"name","price","number"};
		String condition = null;
		Vector<String[]> vec = du.getData(tableName, field, condition);
		request.setAttribute("buy", vec);
		gotoPath(request, response, "WEB-INF/buylist.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	private void gotoPath(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
	
}
