<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>    
    <title>用户注册</title>
    <style type="text/css">
    	.header{
            width: 100%;
            height: 100px;
            background-color: #cccccc;
            text-align: center;
            line-height: 100px;
            font-size: 25px;
        }
        .login{
            width: 100%;
            height: 350px;
            text-align: center;
            line-height: 50px;
        }
        span{
        	color: red;
        }
        strong{
            font-size: 20px;
        }
        input[type=submit]{
            border: none;
            padding: 5px 50px;
            color: white;
            font-size: 16px;
        }
        input[type=text],input[type=password]{
            width: 200px;
        }
        #register{
        	background-color: orange;
        }
    </style>
</head>
  
<body>
    <div class="header">网上商城系统</div><hr />
    <div class="login">
        <strong>注册</strong>
        <form action="user.register" method="post">
            <span>*</span>用户名：<input type="text" name="username"><br />
            <span>*</span>密&nbsp;&nbsp;&nbsp;码：<input type="password" name="password"><br />
            &nbsp;姓&nbsp;&nbsp;&nbsp;名：<input type="text" name="name"><br />
            &nbsp;地&nbsp;&nbsp;&nbsp;址：<input type="text" name="address"><br />
            &nbsp;电&nbsp;&nbsp;&nbsp;话：<input type="text" name="phone"><br />
                                 其中带<span>*</span>为必填信息<br />
        	<input type="submit" value="注册" id="register">
    	</form>
    </div>
</body>
</html>
