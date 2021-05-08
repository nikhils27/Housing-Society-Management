 
<%-- 
    Document   : notice_reg
    Created on : Oct 31, 2020, 11:43:47 AM
    Author     : Admin
out.println("<script>alert('complaint not added try again later..'); window.location.href='admin_notice.jsp'</script>");
--%>
<%@page contentType="text/html" import="java.sql.*" import="java.time.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
                    try{
                    LocalDate date = LocalDate.now();
                    String notice = request.getParameter("c1");
                    String data = request.getParameter("hide");
                    out.print(data);
                    out.print("<iframe src='"+data+"'>");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection c = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
                    PreparedStatement ps = c.prepareStatement("insert into notice values(?,?,?)");
                    ps.setString(1,date.toString());
                    ps.setString(2,notice);
                    ps.setString(3,data);
                    ps.executeUpdate();
                    ps.close();
                    c.close();
                    out.println("<script>alert('notice added'); window.location.href='admin_notice.jsp'</script>");
                 }
        
                 catch(Exception e){
                     
                     out.println(e);
                 
                 }
               
             
       
               
        %>
    </body>
</html>

