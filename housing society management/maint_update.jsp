<%-- 
    Document   : maint_update
    Created on : Nov 2, 2020, 12:34:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" import="java.sql.*" import="java.time.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type"  content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            h1{
                color:white;
                background-color: rgba(0,0,0,0.5);
                width:30%;
            }
            th,td{
                font-size:17px;
                //margin: 10px;
                padding: 6px;
            }
            tr{
                
            }
            button{
                width:25%;
                background-color: #333;
                color:white;
                height:33px;
                cursor:pointer;
                
            }
            button :hover{
               background-color:white;
                color:black; 
            }
            #btn{
                width:30%;     
                background-color:#333;
                color: white;
                padding: 12px 12px;
                margin: 8px 0;
                border: white;
                cursor: pointer;
            }
            #btn:hover{
                background-color:#f2f2f2;
                color:black;
                border:1px solid black;
            }
            #fname{
                width:100%;
                padding: 5px 5px;
                margin: 5px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
        </style>
            </head>
    <body>
        <jsp:include page="header.html"/>

    <center>
        <%
            //from admin_maint.jsp
            if (request.getParameter("s2") != null) {
                out.println("<h1>update maintenance</h1>");
                out.println("<form action='maint_reg1.jsp' method='post'>");
                String flat = request.getParameter("flat");
                String month = request.getParameter("month");
                String date = request.getParameter("date");
                LocalDate dt = LocalDate.now();
                int year = dt.getYear();
                Class.forName("com.mysql.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
                PreparedStatement ps = c.prepareStatement("SELECT * FROM maint WHERE flat=? AND month=? AND year=?");
                ps.setString(1, flat);
                ps.setString(2, month);
                ps.setInt(3, year);
                ResultSet rs = ps.executeQuery();
                out.print("<table>");
                if (rs.first()) {
                    out.println("<tr><td><b>Flat</b></td><td><input type='text' name='flat' id='fname' value='" + rs.getString(2) + "'></td></tr>");
                    out.println("<tr><td><b>Month</b></td><td><input type='text' name='month' id='fname' value='" + rs.getString(3) + "'></td></tr>");
                    out.println("<tr><td><b>Year</b></td><td><input type='text' name='year' id='fname' value='" + rs.getString(4) + "'></td></tr>");
                    out.println("<tr><td><b>Due Date</b></td><td><input type='text' name='due' id='fname' value='" + rs.getString(5) + "'></td></tr>");
                    out.println("<tr><td><b>Service Charge</b></td><td><input type='text' name='service' id='fname' value='" + rs.getString(6) + "'></td></tr>");
                    out.println("<tr><td><b>Parking Charges</b></td><td><input type='text' name='park' id='fname' value='" + rs.getString(7) + "'></td></tr>");
                    out.println("<tr><td><b>Other Funds</b></td><td><input type='text' name='other' id='fname' value='" + rs.getString(8) + "'></td></tr>");
                    out.println("<tr><td><b>Pending</b></td><td><input type='text' name='pending' id='fname' value='" + rs.getString(9) + "'></td></tr>");
                    out.println("<tr><td><b>Total</b></td><td><input type='text' name='total' id='fname' value='" + rs.getString(11) + "'></td></tr>");
                    out.println("<tr><td><b>Paid</b></td><td><input type='text' name='paid' id='fname' value='" + rs.getString(12) + "'></td></tr>");
                }
                else{
                    out.println("<script>alert('bill not found');window.location.href='admin_maint.jsp'</script>");
                }
                out.print("</table>");
                 out.println("<input type='submit' id='btn' name='s2' value='update'>");
                    out.println("</form>");
                    rs.close();
                    ps.close();
                    c.close();
            }
        %>
        <%
            //from maint.jsp
            if (request.getParameter("s1") != null) {
                out.println("<h1>Maintenance</h1>");
                String flat = request.getParameter("flat");
                String month = request.getParameter("month");
                String year = request.getParameter("year");
                LocalDate dt = LocalDate.now();
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection c = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
                PreparedStatement ps = c.prepareStatement("SELECT * FROM maint WHERE flat=? AND month=? AND year=?");
                ps.setString(1, flat);
                ps.setString(2, month);
                ps.setString(3, year);
                ResultSet rs = ps.executeQuery();
                out.println("<table>");
                while (rs.next()) {
                    out.println("<tr><td><b>Flat</b></td><td>" + rs.getString(2) + "</td></tr>");
                    out.println("<tr><td><b>Month</b></td><td>" + rs.getString(3) + "</td></tr>");
                    out.println("<tr><td><b>Year</b></td><td>" + rs.getString(4) + "</td></tr>");
                    out.println("<tr><td><b>Due Date</b></td><td>" + rs.getString(5) + "</td></tr>");
                    out.println("<tr><td><b>Service Charge</b></td><td>" + rs.getString(6) + "</td></tr>");
                    out.println("<tr><td><b>Parking Charges</b></td><td>" + rs.getString(7) + "</td></tr>");
                    out.println("<tr><td><b>Other Funds</b></td><td>" + rs.getString(8) + "</td></tr>");
                    out.println("<tr><td><b>Pending</b></td><td>" + rs.getString(9) + "</td></tr>");
                    out.println("<tr><td><b>Total</b></td><td><b>" + rs.getString(11) + "</b></td></tr>");
                    out.println("<tr><td><b>Paid</b></td><td>" + rs.getString(12) + "</td></tr>");
                   }
               
                out.println("</table>");
                    rs.close();
                    ps.close();
                    c.close();
                     out.println("</br><a href='admin_maint.jsp'><button>back</button></a>");
            }
        %>
    </center>
</body>
</html>
