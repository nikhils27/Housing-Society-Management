<%-- 
    Document   : post_data
    Created on : Apr 19, 2021, 7:40:09 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String text=request.getParameter("text");
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost/data", "root", "");
            PreparedStatement ps = c.prepareStatement("insert into document(text) values(?) ");
            ps.setString(1,text);
            ps.executeUpdate();
            out.print("data saved");
            
            
        %>
            
            
            
    </body>
</html>
