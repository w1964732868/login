<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录界面</title>
</head>
<body>
  <h3>登录</h3>
      <hr>
      <form action = "checkout.jsp"  method = "post">
                用户名：<input type = "text" name = "username"/><br>
                 密码：<input type = "password" name = "password"/><br>
           <button type = "submit"  value = "1"/ >登录</button>
                    
         <a href="register.jsp?" value = "2">注册</a> 
         <!--  <button type = "submit"  value = "注册"/>注册</button> -->
      </form>
</body>
</html>