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
              //  width:69%;
               // float:left;
                
            }
            .side h1{
               font-size: 30px;
               background-color: rgba(0,0,0,0.5);
               width:30%;
               color:white;
 
            }
            //tr:nth-child-(even){
            // background-color:#f2f2f2;
            //}
            th{
                font-size:20px;
                padding:8px;
                background-color: #333;
                color:white;
                
            }
            th,tr,td{
              //  border:1px solid black;
            }
            td{
                font-size:15px;
              //  padding:5px;
            }
            table{
                border-collapse: collapse;
            }
            button{
                width:100%;
                background-color:white;
                color: black;
                padding: 5px 5px;
                border-bottom:3px solid blue; 
                margin : 0px 0;
                cursor: pointer;
               }
            button:hover{
                border:3px solid black;
                
            }
            
            </style>
    </head>
    <body>

        <%
            if (session.getAttribute("username") == null) {
               response.sendRedirect("loginn.jsp");
           }
            %>
                <jsp:include page="header.html"/>

<div class="contain">
                     
               <div class="side">
           <center><h1>Notices</h1></center>
            <center><table cellspacing="10px" cellpadding="10px" border="1">
                <tr><th>Date</th>
                    <th>Notice</th>
                    <th>Attachments</th>                 
                 </tr>
            <%
              Class.forName("com.mysql.jdbc.Driver");
                   Connection c=DriverManager.getConnection("jdbc:mysql://localhost/housing","root","");
                   PreparedStatement ps=c.prepareStatement("select * from notice order by id desc");
                    ResultSet RS= ps.executeQuery();
                    
                    while (RS.next())
                            { 
                            out.println("<tr><td>"+RS.getString(2)+"</td>");
                            out.println("<td>"+RS.getString(3)+"</td>");
                            out.println("<td><a href='notice_att.jsp?data="+RS.getString(1)+"'><button>view</button></a></td></tr>");
                            }
                    RS.close();
                    ps.close();
                    c.close(); 
            %>     
                </table>
            </center>
               </div>
          





</div>               
   </br>
                </br></br></br></br></br></br></br></br></br></br></br></br>
                </br></br></br></br></br>
                </br></br></br></br></br>
                <div class="down">    
     <jsp:include page="footer.html"/>
     </div>
    </body>
</html>
