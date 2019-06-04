<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>登录失败</title>
 	<meta http-equiv="Refresh" content="5;url=login.jsp">
  </head>
  
  <body>
	<c:choose>
  		<c:when test="${status=='1'}">
  			用户名或密码错误，请重新输入！<br/>
  		</c:when>
  		<c:otherwise>
  			验证码错误<br/>
  		</c:otherwise>
  	</c:choose>
  	<a href="login.jsp">若页面在5秒内没有跳转，请点击此处返回。</a>
  </body>
</html>
