<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>用户登录</title>
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
            height: 200px;
            text-align: center;
            line-height: 50px;
        }
        strong{
            font-size: 20px;
        }
        input[type=submit],
        input[type=button]{
            border: none;
            padding: 5px 15px;
            color: white;
            font-size: 16px;
        }
        input[type=text],
        input[type=password]{
            width: 200px;
        }
        #login{
        	background-color: #008CBA;
        }
        #register{
        	background-color: orange;
        }
    </style>
</head>
<body>
    <div class="header">网上商城系统</div><hr />
    <div class="login">
        <strong>请您登录</strong>
        <form action="user.login" method="post">
                                 用户名：<input type="text" name="username"><br />
                                 密&nbsp;&nbsp;&nbsp;码：<input type="password" name="password"><br />
        	<input type="submit" value="登录" id="login">
        	<input type="button" value="注册" id="register" onclick="location.href='register.jsp'">
    	</form>
    </div><hr />
</body>
</html>
