package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DataUtil;
import util.PageUtil;

public class LoginServlet extends HttpServlet {
		
	private DataUtil du = new DataUtil();
		
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 数据准备
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		PageUtil page = du.getPage(pageNo, 2);
		page.setPageNo(pageNo);
		request.setAttribute("page", page);
		gotoPath(request, response, "WEB-INF/goods.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		String tableName = "customers";
		String condition = "username='" + username + "'and password='" + password + "'";
		if(du.CheckLogin(tableName, condition)){
			// 数据准备
			int pageNo = 1;
			PageUtil page = du.getPage(pageNo, 2);
			page.setPageNo(pageNo);
			request.setAttribute("page", page);
			gotoPath(request, response, "WEB-INF/goods.jsp");
		}else {
			response.sendRedirect("failToLogin.jsp");
		}
		
	}
	
	public void gotoPath(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
}
