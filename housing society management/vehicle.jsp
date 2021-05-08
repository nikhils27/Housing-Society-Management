<%-- 
    Document   : newjsp
    Created on : Oct 27, 2020, 12:01:34 AM
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
                display:none;
            }
            .side h1{
                font-size: 30px;
                background-color: rgba(0,0,0,0.5);
                width:30%;
                color:white;
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
            .add{
                width:69%;
                float:left;
                display:none;
            }
            .del{
                width:69%;
                float:left;
                display:none;
            }
            #fname{
                width:30%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
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
            #btn1{
                     width:50%;     
                     background-color:#333;
                     color: white;
                     padding: 10px 10px;
                     border: white;
                     cursor: pointer;
            }
            #btn1 :hover{
                background-color:#f2f2f2;
                color:black;
                border:1px solid black;
            }
            #btn3{
                     width:20%;     
                     background-color:#333;
                     color: white;
                     padding: 8px 8px;
                     border: white;
                     cursor: pointer;
            }
            #btn3:hover{
                background-color:#f2f2f2;
                color:black;
                border:1px solid black;
            }
            .all{
                width:69%;
                float:left;
                display: none;
            }
            .add table,tr,td{
                border:none;
            }
            .add  input[type=text]{
                width:80%;
                padding: 5px 8px;
                margin: 5px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            
        </style>
        <script>
            $(document).ready(function () {
                $(".b1").click(function () {
                    $(".side").show();
                    $(".add").hide();
                    $(".del").hide();
                    $(".all").hide();
                });
                $(".b2").click(function () {

                    $(".add").show();
                    $(".side").hide();
                    $(".del").hide();
                    $(".all").hide();
                });
                $(".b3").click(function () {
                    $(".side").hide();
                    $(".add").hide();
                    $(".del").show();
                    $(".all").hide();
                });
                 $(".b4").click(function () {
                    $(".side").hide();
                    $(".add").hide();
                    $(".del").hide();
                    $(".all").show();
                });
            });

        </script>
    </head>
    <body>
        <%
            if (session.getAttribute("flat")==null) {
                response.sendRedirect("loginn.jsp");
            }
        %>


        <jsp:include page="header.html"/>

        <div class="contain">
            <div class="btn-group">
                <button class="b1">your vehicles</button>
                <button class="b2">add new vehicles</button>
                <button class="b3">delete vehicles</button>
                <button class="b4">all vehicles</button>

            </div>    
            <div class="side">
                <center><h1>your vehicle</h1></center>
                <center>
                    <table>
                        <%
                            String flat = session.getAttribute("flat").toString();
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection c = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
                            PreparedStatement ps = c.prepareStatement("select * from vechile where flat='" + flat + "'");
                            ResultSet RS = ps.executeQuery();
                            while (RS.next()) {   
                                out.println("<tr><th>Vehicle owner</th><td>" + RS.getString(4) + "</td></tr>");
                                out.println("<tr><th>Vehicle type</th><td>" + RS.getString(3) + "</td></tr>");
                                out.println("<tr><th>Vehicle name</th><td>" + RS.getString(5) + "</td></tr>");
                                out.println("<tr><th>vehicle number</th><td>" + RS.getString(6) + "</td></tr>");
                                out.println("<tr><th>parking space</th><td>" + RS.getString(2) + "</td></tr>");
                            }

                        %>     
                    </table>
                </center>
            </div>

            <div class="add">
                <form action="vech_reg.jsp" method="post">       
                    </br></br>
                    <center>
                        <table cellspacing="10px" cellpadding="10px">
                            
                            <tr><td>Select Parking Place:</td><td><select style="width:100px;height:25px;background:rgba(0,0,0,0.5);color:white" name="park_id">    
                                        <option value="p-001">p-001</option>
                                        <option value="p-002">p-002</option>
                                        <option value="p-003">p-003</option>
                                        <option value="p-004">p-004</option>
                                        <option value="p-005">p-005</option>
                                        <option value="p-006">p-006</option>
                                        <option value="p-007">p-007</option>
                                        <option value="p-008">p-008</option>
                                        <option value="p-009">p-009</option>
                                        <option value="p-010">p-010</option>
                                </td></tr>

                            <tr><td>Vehicle Type:</td><td><input type="radio" name="vehicle" value="2_wheeler" >2 wheeler
                                    <input type="radio" name="vehicle" value="4_wheeler">4 wheeler</td></tr>
                            <tr><td>Enter Vehicle Owner Name:</td><td><input type="text" name="vech_own_name"></td></tr>
                            <tr><td>Enter Vehicle Name:</td><td><input type="text" name="vech_name"></td></tr>

                            <tr><td>Enter Vehicle Number:</td><td><input type ="text"  name="vech_no" ></td></tr>
                            <tr><td colspan="2"></br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" id="btn1" name="btn" value="submit"></td></tr>
                        </table>
                        </br></br></br></br>   
                    </center>
                </form>

            </div>
                    
                    
            <div  class="del">
                
                    <center>
                       
                        <h2 style="background-color:rgba(0,0,0,0.5);width:30%;color:white;">delete vehicle</h2>
                     <h3> select vehicle to delete</h3>
                     <% 
                            
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection C2 = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
                            PreparedStatement PS = C2.prepareStatement("select * from vechile where flat='"+flat+"'");
                            ResultSet rs = PS.executeQuery();
                            while(rs.next())
                            {   
                                out.println("</br>");
                                out.println("<b style='font-size:20px;'>"+rs.getString(6)+"</b>");
                                out.println("<a href='delete_vech.jsp?flat="+flat+"&vech="+rs.getString(6)+"'><button id='btn3'>delete</button></a>");
                                out.println("</br>");
                            }
                            
                            
                            %>
                     
                     
                    
                    </center>
                     
            </div>
             <div class="all">       
             
             
             
              <center><h2 style="background-color:rgba(0,0,0,0.5);width:30%;color:white;">All vehicle</h2></center>
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
         
                    
        <%  
            RS.close();
            ps.close();
            c.close();
        %>
        </br>
        </br></br></br></br></br></br></br></br></br></br></br></br>
        </br></br></br></br></br> </br></br></br>
        </br></br>
        <div class="down">    
            <jsp:include page="footer.html"/>
        </div>
    </body>
</html>
