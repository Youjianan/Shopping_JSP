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
            height: 250px;
            float: left;
            margin-left: 620px;
            line-height: 50px;
        }
        strong{
            font-size: 20px;
            padding-left: 100px;
        }
        form{
        	font-size: 18px;
        }
        input[type=submit],
        input[type=button]{
            border: none;
            padding: 5px 50px;
            color: white;
            font-size: 16px;
        }
        input[type=text],
        input[type=password]{
            width: 200px;
            height: 30px;
        }
        #login{
        	background-color: #008CBA;
        }
        #register{
        	background-color: orange;
        }
        img{
        	vertical-align: middle;
        }
    </style>
    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript">
	    $(function(){
	  		$("#checkImg").click(function(){
	  			var timestamp = new Date().getTime();
				$(this).attr('src',$(this).attr('src') + '?' +timestamp );
	  		});
	  	});
    </script>
</head>
<body>
    <div class="header">网上商城系统</div><hr /><br /><br />
    <div class="login">
        <strong>请您登录</strong>
        <form action="user.login" method="post">
                                 用户名：<input type="text" name="username"><br />
                                 密&nbsp;&nbsp;&nbsp;码：<input type="password" name="password"><br />
                                 验证码：<input type="text" name="checkCode" id="checkCode">
            <img src="./servlet/VerificationServlet" id="checkImg" title="看不清，请点击图片刷新"><br />
        	<input type="submit" value="登录" id="login">
        	<input type="button" value="注册" id="register" onclick="location.href='register.jsp'">
    	</form>
    </div>
</body>
</html>
