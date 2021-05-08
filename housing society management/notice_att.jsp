<%-- 
    Document   : notice_att
    Created on : Jan 11, 2021, 11:29:15 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            iframe{
               height:600px;
               width: 100%;
               margin-top:-5px;
            
            }
            
        </style>
    </head>
    <body>
        <%
            
           try{
           String id=request.getParameter("data");
           //out.println(data);
           Class.forName("com.mysql.jdbc.Driver");
                   Connection c=DriverManager.getConnection("jdbc:mysql://localhost/housing","root","");
                   PreparedStatement ps=c.prepareStatement("select data from notice where id=?");
                   ps.setString(1,id);
                   ResultSet RS= ps.executeQuery();
                   while(RS.next())
                   {    
                       
                       String data=RS.getString(1);
                      if(data.equals("")){
                          out.print("<h2>Attachment Not Found</h2>");
                          out.print("<a href='notice.jsp'><button><- Back</button></a>");
                       
                      }
                      else{
                       out.print("<iframe src='"+data+"'>");
                      }   
                   }     
           }
           catch(Exception e){
           out.println(e);
           }
        %>
    </body>
</html>
