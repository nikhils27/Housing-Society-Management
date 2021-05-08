<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <style>
            .contain{
                width:100%;
            }
            .btn-group{
                width:30%; 
                float:left;
            }
            .btn-group button {
                width:100%;
                background-color: rgba(0,0,0,0.5);
                border: 1px solid #ddd;; 
                color: white; 
                padding: 12px 24px; 
                cursor: pointer;   
                height:10%;
                display: block; 
            }
            .btn-group button:not(:last-child) {
                border-bottom: none; 
            }

            .btn-group button:hover {
                background-color: #ddd;
                color: black;
            }
            .side{
                width:69%;
                float:left;
               
            }
         th{
                font-size:17px;
                padding:5px;
                border-bottom:1px solid black; 
            }
            tr,td{
                border-bottom:1px solid black;   
            }
            td{
                font-size:17px;
                padding:5px;  
            }                       
        </style>
        <script>
            $(document).ready(function () {
                $(".b1").click(function () {
                    $(".side").show();
                });               
            });
        </script>
    </head>
    <body>
        <%
         if (session.getAttribute("admin") == null) {
                response.sendRedirect("loginn.jsp");
            }
         
            %>
      <jsp:include page="admin_header.html"/>

        <div class="contain">
            <div class="btn-group">
                <button class="b1">all vehicles</button>
                
             </div>    
            <div class="side">
                <center><h2 style="background-color:rgba(0,0,0,0.5);width:30%;color: white;">All vehicle</h2></center>
                <center>
                    <table>
                        <tr><th>flat no</th><th>parking space</th><th>type</th><th>owner name</th><th>vehicle name</th><th>vehicle number</th>
                        </tr>                       
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection c2 = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
                            PreparedStatement ps2 = c2.prepareStatement("select * from vechile");
                            ResultSet RS2 = ps2.executeQuery();
                            while (RS2.next()) {
                                out.println("<tr>");
                                out.println("<td>" + RS2.getString(1) + "</td>");
                                out.println("<td>" + RS2.getString(2) + "</td>");
                                out.println("<td>" + RS2.getString(3) + "</td>");
                                out.println("<td>" + RS2.getString(4) + "</td>");
                                out.println("<td>" + RS2.getString(5) + "</td>");
                                out.println("<td>" + RS2.getString(6) + "</td>");
                                out.println("</tr>");
                            }
                           RS2.close();
                           ps2.close();
                           c2.close();
                        %>     
                    </table>
                </center>  
              </div>
            </div>
 </body>
</html>