<%-- 
    Document   : forgot_pass_ser
    Created on : Jan 30, 2021, 10:57:39 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*; "%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
        String username=session.getAttribute("newpass").toString();    
        String pass = request.getParameter("pass2");
      //  out.println(username);
       // out.println(pass);
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection c = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
                    PreparedStatement ps1 = c.prepareStatement("UPDATE owner SET password=? WHERE username=?");
                    ps1.setString(1,pass);
                    ps1.setString(2,username);
                    ps1.executeUpdate();
                    ps1.close();
                    c.close();
                    out.println("<script>alert('new password generated successfully');window.location.href='loginn.jsp'</script>");
            }
            catch(Exception e){
                out.println(e);
            }
                    %>
        
     
    </body>
</html>
