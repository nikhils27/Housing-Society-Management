<%@page contentType="text/html" import="java.sql.*"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">  
        </script>
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
            .side h1{
                font-size: 30px;
                background-color: rgba(0,0,0,0.5);
                width:30%;
                color:white;

            }
            tr:nth-child-(even){
                background-color:#f2f2f2;
            }
            th{
                font-size:20px;
                padding:5px;
            }
            th,tr,td{
                border-bottom:1px solid black;
            }
            td{
                font-size:17px;
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

        </style>
        
        
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
                <button id="b1">complaints</button>
                
           </div>    
            <div class="side">
                <center><h1>Complaints</h1></center>
                <center><table>
                        <tr>
                            <th>no</th>
                            <th>Date</th>
                            <th>complaint</th></tr>

                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection c = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
                            PreparedStatement ps = c.prepareStatement("select * from complaint");
                            ResultSet RS = ps.executeQuery();
                            while (RS.next()) {
                                out.println("<tr><td>" + RS.getString(1) + "</td>");
                                out.println("<td>" + RS.getString(2) + "</td>");
                                out.println("<td>" + RS.getString(3) + "</td></tr>");
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
