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
<title>登录检验</title>
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
        /* PreparedStatement继承自Statement  都是接口   */
        Statement stmt=conn.createStatement();
        
        String sql = "select * from users where username = '" + username + "' and password = '" + password + "'"; 
     
        System.out.println("select * from users where username = '" + username + "' and password = '" + password + "'");
        
       /*  rs=stmt.executeQuery("select * from users where username = '" + username + "' and password = '" + password + "'");//查询语句 */
        rs=stmt.executeQuery(sql);//查询语句
        /* if(){
        	
        } */
        if(rs.next()){
        	/* System.out.println(rs.next()+"------成功"); */
        	   response.sendRedirect("success.jsp?");
          }else{
        	  /* System.out.println(rs.next()+"------失败"); */
               response.sendRedirect("err.jsp?");
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