package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.StringUtils;
import com.sun.org.apache.bcel.internal.generic.NEW;

import util.DataUtil;

public class RegisterServlet extends HttpServlet {
	
	private DataUtil du = new DataUtil();

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		Boolean flag = false;

		if(username.trim().length()>0 && password.trim().length()>0){
			String table = "customers";
			String[] field = new String[] { "username", "password", "name", "address", "phone" };
			String[] value = new String[] { username,password,name,address,phone };	
			du.addData(table, field, value);
			flag = true;
		}
		request.setAttribute("flag", flag);
		gotoPath(request, response, "ifRegister.jsp");
	}
	
	public void gotoPath(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
}
