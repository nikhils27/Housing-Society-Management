<%-- 
    Document   : member_ser
    Created on : Aug 27, 2020, 11:12:15 PM
    Author     : Admin
--%>

<%@page contentType="text/html" import="java.sql.*;" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <style>
            tr,td{padding: 10px 10px;}
            table{font-size: 15px; position:relative; left:330px; top:-160px;}
            caption{background: rgba(0,0,0,0.5);color:white;padding:10px} 
        </style>
    </head>
    <body>
        
           <%  
               String un = (String) session.getAttribute("username");
                    String pa = request.getParameter("password");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection c = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
            if(request.getParameter("s2")!=null){
                String flat=request.getParameter("flat");
                String type=request.getParameter("type");
                String name=request.getParameter("name");
                String mobile=request.getParameter("mobile");
                String email=request.getParameter("email");
                String date=request.getParameter("date");
                String no=request.getParameter("no");
                PreparedStatement ps1 = c.prepareStatement("UPDATE owner SET flat=?,type=?,name=?,mobile=?,email=?,dob=?,no_of_family=? WHERE username=?");
                ps1.setString(1,flat);
                ps1.setString(2,type);
                ps1.setString(3,name);
                ps1.setString(4,mobile);
                ps1.setString(5,email);
                ps1.setString(6,date);
                ps1.setString(7,no);
                ps1.setString(8,un);
                ps1.executeUpdate();
                ps1.close();
                
                out.print("<script>alert('information updated');window.location.href='member.jsp'</script>");
            } 
            if(request.getParameter("del")!=null){
                String flat=request.getParameter("flat");
                String type=request.getParameter("type");  
              PreparedStatement ps2 = c.prepareStatement("DELETE FROM owner WHERE flat=? AND type=?");   
               ps2.setString(1,flat);
               ps2.setString(2,type);
               ps2.executeUpdate();
               ps2.close();
                PreparedStatement ps3 = c.prepareStatement("DELETE FROM vechile WHERE flat=?");   
                ps3.setString(1,flat);
                ps3.executeUpdate();
                ps3.close();
               out.print("<script>alert('account deleted');window.location.href='admin_member.jsp'</script>");
            } 
            if(request.getParameter("delete")!=null){
               String flat=request.getParameter("flat");
             //   String type=request.getParameter("type");  
              PreparedStatement ps2 = c.prepareStatement("DELETE FROM owner WHERE username=?");   
               ps2.setString(1,un);
               ps2.executeUpdate();
               ps2.close();
               PreparedStatement ps3 = c.prepareStatement("DELETE FROM vechile WHERE flat=?");   
                String flat1=session.getAttribute("flat").toString();
                ps3.setString(1,flat1);
                ps3.executeUpdate();
                ps3.close();
               out.print("<script>alert('account deleted');window.location.href='welcome.html'</script>");
            
            } 
            
           c.close();
           %>
    </body>
</html>
