<%-- 
    Document   : add_visitor
    Created on : Oct 29, 2020, 10:59:43 PM
    Author     : Admin
<%
             <script>
            if(!!window.performance && window.performance.navigation.type == 2)
            { 
                   window.location.reload(true);
                    object.reload(forcedReload);
                    window.location = window.location; 
            } 
        </script>


--%>



<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

            tr:nth-child-(even){
                background-color:#f2f2f2;
            }
            th{
                font-size:15px;
                padding:5px;
            }
            th,tr,td{
                border-bottom:1px solid black;
            }
            td{
                font-size:15px;
                padding:5px;
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

            .texta{
                border:2px solid black;
                background:#ddd;
                width:60%;
            }
            .add{
                float:left;
                width:69%;
                display:none;    
            }
            #att{
                width:100%;
                background-color:white;
                color: black;
                padding: 5px 5px;
                border-bottom:3px solid blue; 
                margin : 0px 0;
                cursor: pointer;
               }
            #att:hover{
                border:3px solid black;
                
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $(".b1").click(function () {
                    $(".side").show();
                    $(".add").hide();

                });
                $(".b2").click(function () {
                    $(".add").show();
                    $(".side").hide();

                });
            });
             
              var openFile=function openFile(file)
            {
                var input=file.target;
                var reader=new FileReader();
                reader.onload=function(){
                    var dataURL=reader.result;
                    // var output=document.getElementById('imgnew123');
                   
                   // output.src=dataURL;
                   
                    document.getElementById("hide1").value=dataURL;
                    
                };
                reader.readAsDataURL(input.files[0]);
            };
            
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
                <button class="b1">add new notice</button>
                <button class="b2">notices</button> 
            </div>    
            <div class="side">

                <center>
                    <form action="notice_register.jsp" method="post">    
                        <h2 style="background-color:rgba(0,0,0,0.5);color:white;width:50%;">Add notice</h2>
                        <textarea class="texta" placeholder="enter notice here..." rows="5" cols="30" name="c1" required></textarea>
                        </br> <br><label style="font-size:20px"><b>Add file</b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="file" name="file123" id="file12" onchange="openFile(event)">                                        
                        <br><input type="hidden" id="hide1" name="hide"> 
                        <br><input type="submit" value="submit" id="btn" name="s1">
                        
                     
                    </form>
                </center>
                
            </div>
            
            
            <div class="add">
                <center>
                    <table>
                        <tr><th>Date</th>
                            <th>Notice</th>
                            <th>Attachment</th>
                        </tr>
                        <h1 style="background-color:rgba(0,0,0,0.5);color:white;width:50%;">Notice</h1>   
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection c = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
                            PreparedStatement ps = c.prepareStatement("select * from notice");
                            ResultSet RS = ps.executeQuery();
                            while (RS.next()) {
                            out.println("<tr><td>"+RS.getString(2)+"</td>");
                            out.println("<td>"+RS.getString(3)+"</td>");
                            out.println("<td><a href='notice_att.jsp?data="+RS.getString(1)+"'><button id='att'>view</button></a></td></tr>");
                            }
                            RS.close();
                            ps.close();
                            c.close();
                        %> 
                    </table>
                </center>
            </div>
        </div>               
    </body>
</html>
