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
            .del{
                
                display: none;
                width:69%;
                float:left;
            
            }
           .allo th{
                background-color: #333;
                color:white;
            }
            .allo table{
                font-size:15px;
              
            }
            .allt th{
                background-color: #333;
                color:white; 
            }
            
            table{
                font-size: 15px;
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
            .del{
                width:69%;
                float:left;
                dispaly:none;
            }
            label{
                font-size: 17px;
            }
           .del input[type=radio]{
                font-size: 17px;
                display: inline-block;
                box-sizing: border-box;
            }
        </style>
        <script>
            $(document).ready(function () {
                $(".b1").click(function () {
                    $(".allo").show();
                    $(".allt").hide();
                    $(".del").hide();
                });
                $(".b2").click(function () {
                    $(".allo").hide();
                    $(".allt").show();
                    $(".del").hide();
                });
                $(".b3").click(function () {
                    $(".allo").hide();
                    $(".allt").hide();
                    $(".del").show();
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
                <button class="b1">All owners</button> 
                <button class="b2">All tenant</button>
                <button class="b3">delete users</button>
            </div>  
            
                
                <%
                    String un = (String) session.getAttribute("username");
                    String pa = request.getParameter("password");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection c = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
                %> 
                      <div class="allo">
                  <center><h2 style="background-color:rgba(0,0,0,0.5);width:30%;color:white;">All owners</h2></center>
                      <table border="1" cellpadding="7px"><tr>
                              <th>flat</th><th>type</th><th>name</th><th>phone</th><th>email</th><th>DOB</th><th>no. of family members</th></tr>
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
                  <div class="allt">
                      <center>    <h2 style="background-color:rgba(0,0,0,0.5);width:30%;color:white;">All tenant</h2></center>
                     <table border="1"><tr>
                              <th>flat</th><th>type</th><th>name</th><th>phone</th><th>email</th><th>DOB</th><th>no. of family members</th></tr>
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
                  </div>
                    <div class="del">
                        <center><h2 style="background-color:rgba(0,0,0,0.5);width:30%;color:white;">delete user</h2>
                
                        <form method="post" action="member_ser.jsp"></br></br>
            <label>Select Flat No:</label>&nbsp;<select  style="width:130px;height:30px;background:rgba(0,0,0,0.5);color:white" name="flat" id="flat">
            <option value="101">101</option>
            <option value="102">102</option>
            <option value="103">103</option>
            <option value="104">104</option>
            <option value="105">105</option>
            <option value="106">106</option>
            <option value="107">107</option>
            <option value="108">108</option>
            <option value="109">109</option>
            <option value="110">110</option>
            <option value="111">111</option>
            <option value="112">112</option>
        </select></br></br>
            <label>Select type:</label><input type="radio" name="type" value="owner">owner
        <input type="radio" name="type" value="tenant">tenant</br>      
        </br></br>  <div class="btn1"><input type="submit" value="delete" name="del"></div>       
                        </form> 
                    </center>
                    </div>
                    
                <%c.close();%> 
        </div>
    </body>
</html>
