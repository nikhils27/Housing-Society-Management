<%-- 
    Document   : comp_reg
    Created on : Oct 29, 2020, 12:20:20 PM
    Author     : Admin
--%>



<%@page import="javax.swing.text.DateFormatter"%>
<%@page contentType="text/html" import="java.sql.*" import="java.time.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String flat;
            
               if(session.getAttribute("flat")!=null)
            {
                flat=session.getAttribute("flat").toString();
                 try {
                    
                    LocalDate date = LocalDate.now();
                    
                    //DateFormatter date = DateFormatter.ofPattern("dd-MM-yyyy").toString();
                    String comp = request.getParameter("c1");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection c = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
                    PreparedStatement ps = c.prepareStatement("insert into complaint values(?,?,?)");
                    ps.setString(1, flat);
                    ps.setString(2, date.toString());
                    ps.setString(3, comp);
                   
                    ps.executeUpdate();
                    ps.close();
                    c.close();
                    out.println("<script>alert('compalint added'); window.location.href='complaint.jsp'</script>");
                 }
                 catch(Exception e){
                     //out.println("<script>alert('complaint not added try again later..'); window.location.href='complaint.jsp'</script>");
                     out.println(e);
                 
                 }
               
            } 
       
               
        %>
    </body>
</html>
