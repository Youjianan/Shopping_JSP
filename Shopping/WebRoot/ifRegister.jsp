<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>注册失败</title>
  </head>
  
  <body>
  		<c:choose>
  			<c:when test="${ flag == true }">
  				注册成功！ <br>
  				<a href="login.jsp">点击此处返回登录界面</a>
  			</c:when>
  			<c:otherwise>
  				注册失败，请检查信息是否输入完整！<br>
    			<a href="register.jsp">点击此处返回注册界面</a>
  			</c:otherwise>
  		</c:choose>
  </body>
</html>
