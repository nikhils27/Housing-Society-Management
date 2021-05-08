<%-- 
    Document   : logout
    Created on : Nov 12, 2020, 11:10:28 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            session.invalidate(); 
            response.sendRedirect("loginn.jsp");
            %>
    </body>
</html>
