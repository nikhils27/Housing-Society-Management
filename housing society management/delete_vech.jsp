<%-- 
    Document   : delete_vech
    Created on : Mar 3, 2021, 11:36:44 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% try{
                            String flat=request.getParameter("flat");
                            String number=request.getParameter("vech");
                           Class.forName("com.mysql.jdbc.Driver");
                            Connection c = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
                           PreparedStatement ps = c.prepareStatement("delete from vechile where vech_no='" + number + "'and flat='"+flat+"'");
                           ps.executeUpdate();                            
                           out.println("<script>alert('vehicle removed successfully');window.location.href='vehicle.jsp'</script>");       
                           c.close();
                           ps.close(); 
                      } 
                          catch(Exception E){
                          out.println(E);
                          out.println("<script>alert('vehicle not found');window.location.href='vehicle.jsp'</script>");
                      
                      }
        %>
    </body>
</html>
