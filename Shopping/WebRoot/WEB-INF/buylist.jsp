<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
  	<meta charset="UTF-8">
    <title>购物车</title>
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
        tr:last-child td:last-child{
        	text-align: right;
        }
        #bill{
        	margin-left: 25px;
        	margin-right: 25px;
        }
        .num{
        	width: 50px;
        }
        .numAll,.total{
        	color: red;
        	font-size: 20px;
        }
        img{
        	width: 30px;
        	height: 30px;
        	vertical-align: middle;
        }
    </style>
    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript">
	    $(function () {
	    	//全选
	        $(".checkAll input").click(function() {
	            var flag = $(this).prop("checked");
	            if(flag) {
	                $(".check input").prop("checked", true);
	            } else {
	                $(".check input").prop("checked", false);
	            }
	            counts();
	            totalPrice();
	        });
	    	
	        //单选
	        $(".check input").click(function() {
	            var listLength = $(".check input").length; //列表长度；
	            var checkedLength = $(".check input:checked").length; //列表中被选中的长度

	            if(listLength == checkedLength) {
	                $(".checkAll input").prop("checked", true);
	            } else {
	                $(".checkAll input").prop("checked", false);
	            }
	            counts();
	            totalPrice();
	        })
	    	
	    	//数目加
	        $(".add").click(function () {	        	
	            var $num = $(this).parent().find("input[class=num]");
	            var $price = $(this).parent().prev().find("label[class=price]");
	            var num = parseInt($num.val());
	            var price = parseFloat($price.text());
	            num++;
	            $num.val(num);
	            $(this).parent().next().find("label[class=sum]").html((price * num).toFixed(1));
	            $.ajax({
					url:'update.do',
					type:'post',
					data: {number:$(this).prev().val() , name:$(this).parent().prev().prev().text()},
					dataType:'json',
				});
	            counts();
	            totalPrice();
	        })
			
	        //数目减
	        $(".min").click(function () {
	        	var $num = $(this).parent().find("input[class=num]");
	            var $price = $(this).parent().prev().find("label[class=price]");
	            var num = parseInt($num.val());
	            var price = parseFloat($price.text());
	            if (num > 0) {
	            	num--;
	            }
	            $num.val(num);
	            $(this).parent().next().find("label[class=sum]").html((price * num).toFixed(1));
	            $.ajax({
					url:'update.do',
					type:'post',
					data: {number:$(this).next().val() , name:$(this).parent().prev().prev().text()},
					dataType:'json',
				});
	            counts();
	            totalPrice();
	        })
	        
	        //单行删除
		    $(".del button").click(function() {
	            if(confirm("是否确定删除")) {
	            	$.ajax({
						url:'delete.do',
						type:'post',
						data: {name:$(this).parent().prev().prev().prev().prev().text()},
						dataType:'json',
					});
	            	
	                $(this).parents("tr").remove();
	                var CL = $(".check input").length;
	                if(CL == 0) {
	                    $(".checkAll input").prop("checked", false);
	                }
	                counts();
	                totalPrice();
	            }
		    })
		    
		    //选中的删除
		    $(".delMore button").click(function() {
		    	var flag = $(".check input:checked").length>0 ? true:false;
		        if(flag) {
		            if(confirm("是否确定删除")) {
		            	var name = "";
		            	$(".check input:checked").each(function(i){
			            	name += $(this).parent().next().text();
			            	name += ",";
		              	});
		            	
		            	$.ajax({
							url:'delete.do',
							type:'post',
							data: {name:name},
							dataType:'json',
						});
		            	
		            	$(".check input:checked").parent().parent().remove();
		                var CL = $(".check input").length;
		                if(CL == 0) {
		                    $(".checkAll input").prop("checked", false);
		                }
		                counts();
		                totalPrice();
		            }
		        }
		    })
		    
			//总价钱
	        totalPrice();       
	        function totalPrice() {
		        var prices = 0;
		        $('.check input:checked').each(function(i) {
		            prices += parseFloat($(this).parents("tr").find('.sum').text());
		        })
		        $('.total').html("¥"+(prices).toFixed(1));
	    	}
	        
	      	//总数目
	        counts();
	        function counts() {
	            var sum = 0;
	            $('.check input:checked').each(function(i) {
	                sum += parseInt($(this).parents("tr").find('.num').val());
	            })
	            $('.numAll').html(sum);
	        }
	    })
    </script>
    <script type="text/javascript" src="./js/jquery-ui.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#bill").button();
        });
    </script>
  </head>
  
  <body>
  	<b>我的购物车</b>
  	<img src="icons/shopcar.png">
    <span>
    	<img src="icons/shopcar.png">
    	<a href="goods.showbuy">购物车</a> | 
    	商品列表 | 
    	<a href="login.jsp">注销用户</a>
    </span><hr />
    <center><strong>您选好的商品</strong></center><br />
    
    <table id="list">
    	<tr>
    		<td width="10%" class="checkAll"><input type="checkbox" checked />全选</td>
    		<td width="30%">商品</td>
    		<td width="15%">单价</td>
    		<td width="15%">数量</td>
    		<td width="20%">小计</td>
    		<td width="10%">操作</td>
    	</tr>
    	<c:forEach var="data" items="${buy}">
	    	<tr class="data">
	    		<td class="check"><input type="checkbox" checked /></td>
	    		<td class="goodsname">${data[0]}</td>
	    		<td>¥<label class="price">${data[1]}</label></td>
	    		<td>
	    			<input class="min" name="" type="button" value="-" />
	    			<input class="num" type="text" value="${data[2]}" />
	    			<input class="add" name="" type="button" value="+" />
	    		</td>
	    		<td>
	    			¥<label class="sum">${data[1]*data[2]}</label>
	    		</td>
	    		<td class="del"><button>删除</button></td>
	    	</tr>
	    </c:forEach>
    	<tr>
    		<td class="delMore">
    			<button>删除选中的商品</button>
    		</td>
    		<td colspan="5">
    			已选择 <label class="numAll"></label> 件商品 &nbsp;&nbsp;
    			总价：<label class="total"></label>
    			<a id="bill">去结算</a>
    		</td>
    	</tr>
    </table>
  </body>
</html>
