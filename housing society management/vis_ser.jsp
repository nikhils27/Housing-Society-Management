<%-- 
    Document   : vis_ser
    Created on : Oct 30, 2020, 7:04:14 PM
    Author     : Admin
     
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
            String name=request.getParameter("name");
            String purpose=request.getParameter("pur");
            String in_time=request.getParameter("in_hrs")+":"+request.getParameter("in_min");
            String out_time=request.getParameter("out_hrs")+":"+request.getParameter("out_min");
            String flat=request.getParameter("flat");
            String phone=request.getParameter("phone");
            LocalDate date = LocalDate.now();
            
            Class.forName("com.mysql.jdbc.Driver");
                    Connection c = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
                    PreparedStatement ps = c.prepareStatement("insert into visitor values(?,?,?,?,?,?,?)");
                    ps.setString(1, flat);
                    ps.setString(2, date.toString());
                    ps.setString(3, name);   
                    ps.setString(4, phone);
                    ps.setString(5, purpose);
                    ps.setString(6, in_time);
                    ps.setString(7, out_time);              
                    ps.executeUpdate();
                    ps.close();
                    c.close();
                    out.println("<script>alert('visior added'); window.location.href='visitor_add.jsp'</script>");
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>
    </body>
</html>
