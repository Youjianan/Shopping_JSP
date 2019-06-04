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
		// 点击跳转页面索引的数据准备
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		PageUtil page = du.getPage(pageNo, 5);
		page.setPageNo(pageNo);
		request.setAttribute("page", page);
		gotoPath(request, response, "WEB-INF/goods.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String trueCode = (String)request.getSession().getAttribute("checkCode");
		String checkCode = request.getParameter("checkCode");
		
		String tableName = "customers";
		String condition = "username='" + username + "'and password='" + password + "'";
		if (checkCode.equals(trueCode)) {
			if(du.CheckLogin(tableName, condition)){
				// 登录后的数据准备
				int pageNo = 1;
				PageUtil page = du.getPage(pageNo, 5);
				page.setPageNo(pageNo);
				request.setAttribute("page", page);
				gotoPath(request, response, "WEB-INF/goods.jsp");
			}else {
				request.setAttribute("status", 1);
				gotoPath(request, response, "failToLogin.jsp");
			}
		}else {
			request.setAttribute("status", 0);
			gotoPath(request, response, "failToLogin.jsp");
		}
	}
	
	public void gotoPath(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
}
