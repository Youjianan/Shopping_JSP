<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>商品详情</title>
    <link rel="stylesheet" href="./css/jquery-ui.min.css">
    <style type="text/css">
    	a{
    		text-decoration: none;   		
    	}
        span{
            float: right;
            color: #0066cc;
        }
        span a:link,span a:visited{
        	color: #0066cc;
        }
        b,span{
        	font-size: 20px;
        }
        h2{
            text-align: center;
            color: #0099CC;
        }
        img{
            width: 500px;
            height: 300px;
        }
        #img{
            float: left;
            margin-left: 150px;
            width: 500px;
            height: 300px;
        }
        #detail{
            float: right;
            margin-top: 20px;
            margin-right: 250px;
            width: 500px;
            height: 300px;
        }
        table{
            width: 600px;
        }
        tr{
            height: 50px;
        }
        td{            
            border-bottom:3px solid orange;
        }
        td:first-chird{
        	width: 250px;
        }
        #price{
        	font-size: 20px;
        	color: red;
        }
        #img1,#img2{
        	width: 30px;
        	height: 30px;
        	vertical-align: middle;
        }
    </style>
    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/jquery-ui.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#buy").button();
        });
    </script>
  </head>
  
  <body>
  	<b>商品详情</b>
  	<img id="img1" src="icons/detail.png">
    <span>
    	<img id="img2" src="icons/shopcar.png">
    	<a href="goods.showbuy">购物车</a> | 
    	商品列表 | 
    	<a href="login.jsp">注销用户</a>
    </span><hr />
  	<h2>${data[0]}</h2>
    <div id="img">
        <img src="${data[8]}">
    </div>
    <div id="detail">
        <table>
            <tr>
                <td>电脑品牌：${data[2]}</td>
                <td>CPU品牌：${data[3]}</td>
            </tr>
            <tr>
                <td>内存容量：${data[5]}</td>
                <td>CPU型号：${data[4]}</td>
            </tr>
            <tr>
                <td>磁盘容量：${data[6]}</td>
                <td>显卡类型：${data[7]}</td>
            </tr>
            <tr>
                <td colspan="2" id="price">当前价格：${data[1]}</td>
            </tr>
        </table>
        <br />
        <a href="goods.buy?id=${data[9]}" id="buy">添加至购物车</a>
    </div>
  </body>
</html>
