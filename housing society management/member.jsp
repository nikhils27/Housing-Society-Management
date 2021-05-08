<%-- 
    Document   : mwmber
    Created on : Aug 22, 2020, 10:27:51 AM
    Author     : Admin
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <style>
            tr,td{
                padding: 5px 5px;
            
             }
           .allo{
                display: none;
                width:69%;
                float:left;
            }
            
            .allt{
                display: none;
                width:69%;
                float:left;
            }
            .allt th{
                background-color: #333;
                color:white; 
            }
            .allt table{
                font-size: 15px;
            }
             .allo th{
                background-color: #333;
                color:white;
            }
            .allo table{
                font-size:15px;
              
            }
           
            caption{background: rgba(0,0,0,0.5);
                    color:white;
                    padding:10px
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
            .contain{
                width:100%;
            }
            .view{
                width:69%;
                float:left;
                dispaly:none;
            }
           .update{
                width:69%;
                float:left;
                display:none;
            }
            input[type=text]{
                width:100%;
                padding: 10px 10px;
                //margin: 5px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            .btn1 input[type=submit]{
                     width:30%;     
                     background-color:#333;
                     color: white;
                     padding: 10px 10px;
                     border: white;
                     cursor: pointer;
            }
            .btn1 input[type=submit]:hover{
                background-color:#f2f2f2;
                color:black;
                border:1px solid black;
            }
            .one{
                border:2px solid black;
                background: #ddd;
                border-radius: 5px;
                width:70%;
                margin:15px;
            }
            .delete{
                 display: none;
                width:69%;
                float:left;
            }
            
        </style>
        <script>
            $(document).ready(function () {
                $(".b1").click(function () {
                    $(".view").show();
                    $(".update").hide();
                    $(".allo").hide();
                    $(".allt").hide();
                    $(".delete").hide();
                });
                $(".b2").click(function () {

                    $(".view").hide();
                    $(".update").show();
                    $(".allo").hide();
                    $(".allt").hide();
                     $(".delete").hide();
                });
                $(".b3").click(function () {
                   $(".view").hide();
                    $(".update").hide();
                    $(".allo").show();
                    $(".allt").hide();
                     $(".delete").hide();
                });
                 $(".b4").click(function () {
                    $(".view").hide();
                    $(".update").hide();
                    $(".allo").hide();
                    $(".allt").show();
                    $(".delete").hide();
                });
            $(".b5").click(function () {
                    $(".view").hide();
                    $(".update").hide();
                    $(".allo").hide();
                    $(".allt").hide();
                    $(".delete").show();
                });
            });
            

        </script>
    </head>
    <body>
        <%
            if (session.getAttribute("username") == null) {
                response.sendRedirect("loginn.jsp");
            }
            
        %>

        <jsp:include page="header.html"/>
        <div class="contain">

            <div class="btn-group">
                <button class="b1">your information</button>
                <button class="b2">update information</button> 
                <button class="b3">All owners</button> 
                <button class="b4">All tenant</button> 
                <button class="b5">delete account</button> 
            </div>  
            <div class="view">
                
                <%
                    String un = (String) session.getAttribute("username");
                    String pa = request.getParameter("password");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection c = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
                %> 
                <center>
                    <h2 style="background-color:rgba(0,0,0,0.5);width:30%;color:white;">User Information</h2>
                <%
                    
                    PreparedStatement ps = c.prepareStatement("select * from owner where username=?");
                    ps.setString(1, un);
                    ResultSet RS = ps.executeQuery();
                    while (RS.next()) {
                        out.println("");
                        out.println("<table style='font-size:17px;'>");
                        
                        out.println("<tr><td><b>Your Flat</b></td><td>" + RS.getString(1) + "</td></tr>");
                        out.println("<tr><td><b>Type</b></td><td>" + RS.getString(2) + "</td></tr>");
                        out.println("<tr><td><b>Full Name</b></td><td>" + RS.getString(3) + "</td></tr>");
                        out.println("<tr><td><b>Phone</b></td><td>" + RS.getString(4) + "</td></tr>");
                        out.println("<tr><td><b>Email ID</b></td><td>" + RS.getString(5) + "</td></tr>");
                        out.println("<tr><td><b>Birth Bate</b></td><td>" + RS.getString(6) + "</td></tr>");
                        out.println("<tr><td><b>No. of Family Members</b></td><td>" + RS.getString(9) + "</td></tr>");
                        out.println("</table>");
                    }
                    RS.close();
                    ps.close();
                      
                %>
                </center>
            </div>
            <div class="update">
                <form action="member_ser.jsp" method="post">
                    
                    <center>
                        <h2 style="background-color:rgba(0,0,0,0.5);width:35%;color:white;">Update Information</h2>
                  <%
                   
                    PreparedStatement ps1 = c.prepareStatement("select * from owner where username=?");
                        ps1.setString(1, un);
                        ResultSet RS1 = ps1.executeQuery();
                        while (RS1.next()) {
                        
                        out.println("<table style='font-size:17px;'>");
                        out.println("<tr><td><b>Flat</b></td><td><input type='text' name='flat' value='"+RS1.getString(1)+"'></td></tr>");
                        out.println("<tr><td><b>Type</b></td><td><input type='text' name='type' value='"+RS1.getString(2)+"'></td></tr>");
                        out.println("<tr><td><b>Full Name</b></td><td><input type='text' name='name' value='"+RS1.getString(3)+"'></td></tr>");
                        out.println("<tr><td><b>Mobile</b></td><td><input type='text' name='mobile' value='"+RS1.getString(4)+"'></td></tr>");
                        out.println("<tr><td><b>Email</b></td><td><input type='text' name='email' value='"+RS1.getString(5)+"'></td></tr>");
                        out.println("<tr><td><b>Birth Date</b></td><td><input type='text' name='date' value='"+RS1.getString(6)+"'></td></tr>");
                        out.println("<tr><td><b>No. of Family Members</b></td></b><td><input type='text' name='no' value='"+RS1.getString(9)+"'></td></tr>");
                        out.println("</table>");
                    }
                     RS1.close();  
                     ps1.close();
                   
                    
                    
                  %>
                <div class="btn1"><input type='submit' name='s2' value='save'>
                </div>
                    </center>
                  </form>
            </div>
                    <center>
                  <div class="allo">
                       <h2 style="background-color:rgba(0,0,0,0.5);width:30%;color:white;">All Owners</h2>
                    <table border="1" cellpadding="7px"><tr>
                              <th>flat</th><th>type</th><th>name</th><th>phone</th><th>mobile no</th><th>DOB</th><th>no. of family members</th></tr>
                     <%  
                     PreparedStatement ps2 = c.prepareStatement("select * from owner where type=?");
                     ps2.setString(1,"owner");
                     ResultSet RS2 = ps2.executeQuery();
                     while (RS2.next()) {
                        
                        out.println("<tr>");
                        out.println("<td>"+RS2.getString(1)+"</td>");
                        out.println("<td>"+RS2.getString(2)+"</td>");
                        out.println("<td>"+RS2.getString(3)+"</td>");
                        out.println("<td>"+RS2.getString(4)+"</td>");
                        out.println("<td>"+RS2.getString(5)+"</td>");
                        out.println("<td>"+RS2.getString(6)+"</td>");
                        out.println("<td>"+RS2.getString(9)+"</td>");
                        out.println("</tr>");
                     }
                     RS2.close();
                     ps2.close();
                      %>
                      </table>
                  </div>
                      </center>
                  <div class="allt">
                      <center>
                           <h2 style="background-color:rgba(0,0,0,0.5);width:30%;color:white;">All Tenants</h2>
                    <table border="1"><tr>
                              <th>flat</th><th>type</th><th>name</th><th>phone</th><th>mobile no</th><th>DOB</th><th>no. of family members</th></tr>
                     <%  
                     PreparedStatement ps3 = c.prepareStatement("select * from owner where type=?");
                     ps3.setString(1,"tenant");
                     ResultSet RS3 = ps3.executeQuery();
                     while (RS3.next()) {
                        out.println("<tr>");
                        out.println("<td>"+RS3.getString(1)+"</td>");
                        out.println("<td>"+RS3.getString(2)+"</td>");
                        out.println("<td>"+RS3.getString(3)+"</td>");
                        out.println("<td>"+RS3.getString(4)+"</td>");
                        out.println("<td>"+RS3.getString(5)+"</td>");
                        out.println("<td>"+RS3.getString(6)+"</td>");
                        out.println("<td>"+RS3.getString(9)+"</td>");
                        out.println("</tr>");
                     }
                     RS3.close();
                     ps3.close();
                      %> 
                    </table>  
                      </center>
                  </div>
                  <div class="delete">
                  <center><h2 style="background-color:rgba(0,0,0,0.5);width:30%;color:white;">Delete Account</h2></center>
                      
                  <center>
                      </br></br>
                      <div class="one">
                          <form method="post" action="member_ser.jsp">
                              </br></br>
                      <b style="font-size:20px;"> delete account!! Are you sure?</b></br></br></br>    
                      <input type="submit" name="delete" value="Delete" style="width:46%;height:40px;background-color:red; cursor: pointer;
                             color:black;">&nbsp;&nbsp;&nbsp;<a href="member.jsp"><button style="width:46%;cursor: pointer;height:40px;background-color:#333;
                     color: white;">cancel</button></a>  </br></br>                          
                          </form>
                      </div>
                  </center>
                  </div>
                <%c.close();%> 
        </div>
    </body>
</html>
