<%-- 
    Document   : maint_print
    Created on : Mar 4, 2021, 4:02:28 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            p{
                background-color: black;
                color: white;
                width:100%;
                height:10%;
                font-size:40px;
                letter-spacing: 0.5em;
                padding: 15px;
            }
            address{
                font-size: 18px;
            }
            .build{
                margin-left: 20%;
            }
            #t1{
                border:2px solid black;
                width:60%;
                font-size: 18px;
            }
            #t2 th{ 
                 background-color: black;
                 color:white;
                 font-size: 25px;
                 text-align: center;
            }
            #t2{
                border:2px solid black;
                width:60%;
                font-size: 18px;
            }
            </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function print1(){
                window.print();
            }
            </script>
    </head>
    <body onload="window.print()">
        <div class="header">
            <center>
        <p>Maintenance</p>
         </center></div>
        <div class="build">
         <h1>skyhigh chs</h1>
                 <address>
                     plot-25/26, </br>sector-18,kamothe,</br>panvel-410209
                 </address>        
         </div>   
        <center>
            
            </br></br>
            <%
                String bill=request.getParameter("bill");
                String flat=request.getParameter("flat");
                String month=request.getParameter("month");
                String due=request.getParameter("due");
                String service=request.getParameter("service");
                String park=request.getParameter("park");
                String other=request.getParameter("other");
                String pending=request.getParameter("pending");
                String total=request.getParameter("total");
                 out.println("<table id='t1' cellspacing='20px'>");
                                out.println("<tr><td>bill no:" + bill + "</td>");
                                out.println("<td style='text-align:right;'>flat:" + flat + "</td></tr>");
                                out.println("<tr><td>month:" + month + "</td>");
                                out.println("<td style='text-align:right;'>due date:" + due + "</td></tr>");
                                out.println("</table>");
                                out.println("<br>");
                                out.println("<table id='t2'cellspacing='20px' >");
                                out.println("<tr><td>service charge :" + service+ "</td>");
                                out.println("<td style='text-align:right;'>parking charge :" + park + "</td></tr>");
                                out.println("<tr><td>other funds :" + other + "</td>");
                                out.println("<td style='text-align:right;'>pending :" + pending + "</td></tr>");
                                out.println("<tr><th colspan='2'>total :" + total + "</th></tr>");
                               
                                out.println("</table>");
                
                
                
            %>               
           
            
            
            
            
            
        </center>
    
        
        
    </body>
</html>
