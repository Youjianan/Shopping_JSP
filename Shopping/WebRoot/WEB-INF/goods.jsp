<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="UTF-8">
    <title>网上商城系统</title> 
    <style type="text/css">
    	a{
    		text-decoration: none;
    	}
        span{
            float: right;
            color: #0066cc;
        }
        a:link,a:visited{
        	color: #0066cc;
        }
        strong{
            font-size: 24px;
            color: #0099CC;
        }
        b,span{
        	font-size: 20px;
        }
        table{
            width: 100%;
            text-align: center;
            border-collapse: collapse;
            table-layout: fixed;
            line-height: 50px;
        }
        table,th,td{
            border: 1px solid black;
        }
        td{
            font-size: 18px;
        }
        th{
            font-size: 20px;
        }
        tr:first-child{
            background-color: #B3C7EF;
        }
        table tr td:first-child{
            text-align: left;
            text-indent: 50px;
        }
        tr:nth-child(n+2):nth-child(odd):nth-child(-n+9){
            background-color: #EEF7FF;
        }
        #nav {
        	 text-align: center;
        }
        #page {
            list-style-type: none;
            font-size: 15px;
            display: inline-block;
            padding: 0;
        }
        #page>li {
            float: left;
            padding: 1px;
        }
        #page a {
            text-decoration: none;
            border: 1px solid #cccccc;
            display: block;
            width: 35px;
            padding: 6px;
        }
        #page a:hover {
        	background-color: #eeeeee;
        }
        table a:link,
        table a:visited{
        	color: #35353D;
        }
        table a:hover{
        	color: #145A9E;
        }        
        #nav a:link,
        #nav a:visited{
        	color: #6688FF;
        }
        img{
        	width: 30px;
        	height: 30px;
        	vertical-align: middle;
        }
    </style>
</head>
<body>
    <b>商品列表</b>
    <img src="icons/goods.png">
    <span>
    	<img src="icons/shopcar.png">
    	<a href="goods.showbuy">购物车</a> | 
    	商品列表 | 
    	<a href="login.jsp">注销用户</a>
    </span><hr />
    <center><strong>请从商品列表中选取你喜欢的商品</strong></center><br />
    
    <c:set var="data" value="${requestScope.page.data}"/>
    <c:set var="pageNo" value="${requestScope.page.pageNo}"/>
    <c:set var="totalPage" value="${requestScope.page.totalPage}"/>
    
    <table>
        <tr>
			<th width="70%">商品名称（点击可查看商品详情）</th>
			<th width="15%">商品价格</th>
			<th>操作</th>
        </tr>
        <c:forEach var="data" items="${data}" begin="0" step="1">
	        <tr>
				<td>
					<a href="goods.detail?id=${data[0]}">${data[1]}</a>
				</td>
				<td>¥${data[2]}</td>
				<td><a href="goods.detail?id=${data[0]}">添加至购物车</a></td>
	        </tr>
        </c:forEach>
    </table>
    
    <div id="nav">
	   	<ul id="page">
	   		<li>
	   			<a href="user.login?pageNo=1">首页</a>
	   		</li>
	   		<li>
	   			<a href="user.login?pageNo=${pageNo-1>1?pageNo-1:1}">&laquo;</a>
	       	</li>
			
	       	<c:forEach begin="1" end="${totalPage}" varStatus="loop">           	
	           	<li>
	               	<a href="user.login?pageNo=${loop.index}">${loop.index}</a>
	           	</li>
	       	</c:forEach>
	       	
	       	<li>
	           	<a href="user.login?pageNo=${pageNo+1<totalPage?pageNo+1:totalPage}">&raquo;</a>
	       	</li>
	       	<li>
	           	<a href="user.login?pageNo=${totalPage}">尾页</a>
	       	</li>
	   	</ul>
	</div>
</body>
</html>
