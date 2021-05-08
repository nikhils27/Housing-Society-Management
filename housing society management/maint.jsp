<%--


--%>


<%@page contentType="text/html" import="java.sql.*" import="java.time.*" pageEncoding="UTF-8"%>
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
            table{
                width:70%;
            }
            tr:nth-child-(even){
                background-color:#f2f2f2;
            }
            th{
                font-size:17px;
                padding:5px;
            }
            th,tr,td{
                border:1px solid black;
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
            .update{
                width:69%;
                float:left;
                display:none;
            }
            label{
                font-size:20px;
            }
            
        </style>

        <script>
            $(document).ready(function () {
                $("#b1").click(function () {
                    $(".side").show();
                    $(".add").hide();
                    $(".update").hide();
                });
                $("#b2").click(function () {
                    $(".add").show();
                    $(".side").hide();
                    $(".down").hide();
                    $(".update").hide();
                    
                });
                $("#b3").click(function () {
                    $(".add").hide();
                    $(".side").hide();
                    $(".down").show();
                    $(".update").show();
                    
                });

            });

        </script>
    </head>
    <body>
        <%
            if (session.getAttribute("flat") == null) {
                response.sendRedirect("loginn.jsp");
            }
            
        %>
        <jsp:include page="header.html"/>

        <div class="contain">
            <div class="btn-group">
                <button id="b1">current month maintenance</button>
                <button id="b3">search maintenance bills</button>
                <button id="b2">previous months maintenance</button>


            </div>    
            <div class="side">
                <center><h2 style="background-color:rgba(0,0,0,0.5);width:50%;color:white">current maintenance</h2></center>
                <center>
                    <%                                try {
                            String flat = session.getAttribute("flat").toString();
                            LocalDate dte = LocalDate.now();
                            int month = dte.getMonthValue();
                            int currentYear = dte.getYear();
                            String year = Integer.toString(currentYear);
                            String mn = Integer.toString(month);
                            String bill = flat + mn + year;
                            Month mnt = dte.getMonth();
                            String mntt = mnt.toString();

                            Class.forName("com.mysql.jdbc.Driver");
                            Connection c = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
                            PreparedStatement ps = c.prepareStatement("SELECT * FROM maint WHERE bill_no=?");
                            ps.setString(1, bill);
                            ResultSet RS = ps.executeQuery();
                            if (RS.first()) {
                                out.println("<table cellspacing='5px' cellpadding='10px'>");
                                out.println("<tr><th>bill no</th><td>" + RS.getString(1) + "</td></tr>");
                                out.println("<tr><th>flat</th><td>" + RS.getString(2) + "</td></tr>");
                                out.println("<tr><th>month</th><td>" + mntt + "</td></tr>");
                                out.println("<tr><th>year</th><td>" + RS.getString(4) + "</td></tr>");
                                out.println("<tr><th>due date</th><td>" + RS.getString(5) + "</td></tr>");
                                out.println("<tr><th>service charge</th><td>" + RS.getString(6) + "</td></tr>");
                                out.println("<tr><th>parking charge</th><td>" + RS.getString(7) + "</td></tr>");
                                out.println("<tr><th>other funds</th><td>" + RS.getString(8) + "</td></tr>");
                                out.println("<tr><th>pending</th><td>" + RS.getString(9) + "</td></tr>");
                                out.println("<tr><th>total</th><td><b>" + RS.getString(11) + "</b></td></tr>");
                                out.println("<tr><th>paid</th><td>" + RS.getString(12) + "</td></tr>");
                                out.println("</table>");
                                out.println("<a href='maint_print.jsp?bill="+RS.getString(1)+"&flat="+RS.getString(2)+"&month="+mntt+"&due="+RS.getString(5)+"&service="+RS.getString(6)+"&park="+RS.getString(7)+"&other="+RS.getString(8)+"&total="+ RS.getString(11)+"&pending="+RS.getString(9)+"'><button id='btn'>print</button></a>");
                            } 
                            else {
                                out.println("maintenance not added for current month");
                            }
                            RS.close();
                            ps.close();
                            c.close();
                        } catch (Exception e) {
                            out.println(e);
                        }
                    %>     

                </center>
            </div>
                    
            <div class="add">

                <center>
                    </br></br>
                    <table id="1">
                        <tr>
                            <th style="background-color:#333;color:white">bill no</th>
                            <th style="background-color:#333;color:white">flat</th>
                            <th style="background-color:#333;color:white">month</th>
                            <th style="background-color:#333;color:white">year</th>
                            <th style="background-color:#333;color:white">due date</th>
                            <th style="background-color:#333;color:white">service charge</th>
                            <th style="background-color:#333;color:white">parking charge</th>
                            <th style="background-color:#333;color:white">other funds</th>                            
                            <th style="background-color:#333;color:white">pending</th>
                            <th style="background-color:#333;color:white">total</th>
                            <th style="background-color:#333;color:white">paid</th>
                        </tr>

                        <%
                            try {
                                String flat = session.getAttribute("flat").toString();
                                
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection c = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
                                PreparedStatement ps = c.prepareStatement("SELECT * FROM maint WHERE flat=?");
                                ps.setString(1, flat);
                                String i;
                                ResultSet RS = ps.executeQuery();
                                while(RS.next()){
                                 
                                    out.println("<tr><td>" + RS.getString(1) + "</td>");
                                    out.println("<td>" + RS.getString(2) + "</td>");   
                                String arr[]={"0","jan","feb","march","april","may","jun","july","aug","sept","oct","nov","dec"};
                                for(int x=0;x<=12;x++){
                                    String X1=Integer.toString(x);
                                    if(RS.getString(3).equals(X1)){
                                     i=arr[x];  
                                     out.println("<td>"+i+"</td>");
                                    }
                                    }
                                    out.println("<td>" + RS.getString(4) + "</td>");
                                    out.println("<td>" + RS.getString(5) + "</td>");
                                    out.println("<td>" + RS.getString(6) + "</td>");
                                    out.println("<td>" + RS.getString(7) + "</td>");
                                    out.println("<td>" + RS.getString(8) + "</td>");
                                    out.println("<td>" + RS.getString(9) + "</td>");
                                    out.println("<td>" + RS.getString(11) + "</td>");
                                    out.println("<td>" + RS.getString(12) + "</td></tr>"); 
                                }
                                RS.close();
                                ps.close();
                                c.close();
                            } 
                            catch (Exception e) {
                                out.println(e);
                            }
                        %>    
                    </table>    
                </center>
</div>
                       
                    
                    
                    <div class="update">
                <center>
                    <form action="maint_update.jsp" method="post"> 
                 <h2 style="background-color:rgba(0,0,0,0.5);width:50%;color:white">search maintenance bills</h2>
                 
                 <table>       
                 <tr><td><label>select flat</label></td><td><select style="width:130px;height:30px;background:rgba(0,0,0,0.5);color:white" name="flat" id="flat">
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
                        </select></td></tr>
                       <tr><td> <label>select month</label></td><td><select style="width:130px;height:30px;background:rgba(0,0,0,0.5);color:white;" name="month" id="flat">
                            <option value="1">Jan</option>
                            <option value="2">Feb</option>
                            <option value="3">Mar</option>
                            <option value="4">Apr</option>
                            <option value="5">May</option>
                            <option value="6">Jun</option>
                            <option value="7">Jul</option>
                            <option value="8">Aug</option>
                            <option value="9">Sept</option>
                            <option value="10">Oct</option>
                            <option value="11">Nov</option>
                            <option value="12">Dec</option>
                        </select></td></tr> 
                      <tr><td>  <label>select year </label></td><td><select style="width:130px;height:30px;background:rgba(0,0,0,0.5);color:white;" name="year" id="flat">
                            <option value="2020">2020</option>
                            <option value="2021">2021</option>
                            <option value="2022">2022</option>
                            <option value="2023">2023</option>
                            <option value="2024">2024</option>
                            <option value="2025">2025</option>
                            <option value="2026">2026</option>
                            <option value="2027">2027</option>
                            <option value="2028">2028</option>
                            <option value="2029">2029</option>
                            <option value="2030">2030</option>
                            <option value="2031">2031</option>
                        </select> </td></tr>
                      </table></br>
                        <input type="submit" id="btn" value="next" name="s1">                 
                
                        </form>
                </center> 
            </div>     
                    
                    
                    
                    
        </div>
        </br>
        </br></br></br></br></br></br></br></br></br></br></br></br>
        </br></br></br></br></br>
        </br></br></br></br></br></br></br></br> </br></br>
        <div class="down">    
            <jsp:include page="footer.html"/>
        </div>   
    </body>

</html>