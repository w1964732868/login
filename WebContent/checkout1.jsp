<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" import="java.util.*"  import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%String username = request.getParameter("username");%>
  <%String password = request.getParameter("password");%>
  <%-- System.out.println("用户名="+<%=username %>);
  System.out.println("密码="+<%=password %>); --%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册校验</title>
</head>
<body>
<%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
        
        String DB_URL = "jdbc:mysql://127.0.0.1:3306/TEST?useSSL=false&serverTimezone=UTC"; 
        String USER = "root";
        String PASS = "wuhuijie";
        
        Class.forName(JDBC_DRIVER);
        conn = DriverManager.getConnection(DB_URL,USER,PASS);
        
        Statement stmt=conn.createStatement();
        
        String sql = "select * from users where username = '" + username + "' and password = '" + password + "'"; 
     
        System.out.println("select * from users where username = '" + username + "' and password = '" + password + "'");
       /*  rs=stmt.executeQuery("select * from users where username = '" + username + "' and password = '" + password + "'");//查询语句 */
        rs=stmt.executeQuery(sql);//查询语句
        if(rs.next()){
        	 System.out.println("此用户已存在，请去登录！");
        	 /* response.sendRedirect("checkout.jsp?");  */
        	  response.sendRedirect("login.jsp?");
          }else{
              PreparedStatement tmt = conn.prepareStatement("Insert into users values('" + username + "','" + password + "')");
              int rst = tmt.executeUpdate();
              if (rst != 0){
            	  System.out.println("用户注册成功，请去登录！");
            	  out.println("<script language='javascript'>alert('用户注册成功，请去登录！');</script>");
            	  /*  response.sendRedirect("checkout.jsp?");  */
             	   response.sendRedirect("login.jsp?");
                   /*  out.println("<script language='javascript'>alert('用户注册成功！');window.location.href='login.jsp';</script>");  */ 
              }else{
                /*  out.println("<script language='javascript'>alert('用户注册失败！');window.location.href='register.jsp';</script>");   */
                System.out.println("用户注册失败！请重新注册");
            	  response.sendRedirect("register.jsp?");
              }
              
              tmt.close();
              
                                       
      }
        

        if(rs != null) {
            rs.close();
        }
        if(stmt != null) {
            stmt.close();
        }
        if(conn != null) {
            conn.close();
        }
   %>

</body>
</html>