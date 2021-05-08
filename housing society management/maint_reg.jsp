<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8" import="java.time.*" %>
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
                width:100%;
                float:left;                
            }

            tr:nth-child-(even){
                background-color:#f2f2f2;
            }
            th{
                font-size:15px;
                padding:3px;
            }
            th,tr,td{
                
            }
            td{
                font-size:15px;
                padding:3px;
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
                   
            }
            #fname{
                width:100%;
                padding: 12px 12px;
                margin: 5px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            label{
                font-size:17px;
            }
            
        </style>
    </head>
    <body>
        <jsp:include page="header.html"/>
        <div class="contain">
           <center>   
            <div class="side">
                <h1 style="width:30%;color:white;background-color:rgba(0,0,0,0.5)">Generate Bill</h1>
                    <form action="maint_reg1.jsp" method="post">
                        <table>
                    <tr><td><label>service charge:</label></td><td><input type="text" name="service" id="fname" required></td></tr>
                    <tr><td> <label>other funds:</label></td><td><input type="text" name="other" id="fname" required></td></tr>
                    <%
                        int flat=Integer.parseInt(request.getParameter("flat")); 
                        int month=Integer.parseInt(request.getParameter("month"));
                        session.setAttribute("mon",month);
                        LocalDate dt=LocalDate.now();
                        int year=dt.getYear();
                        //checking month
                        if(month==1)
                        {
                           month=12;
                           year=year-1;
                        }
                        else{
                          month=month-1;   
                        }
                        
                        String date=request.getParameter("date");
                        session.setAttribute("fl",flat);
                        
                        session.setAttribute("dt",date);
                        int pending=0;
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
                        PreparedStatement ps = c.prepareStatement("SELECT * FROM maint WHERE flat='"+flat+"' AND month='"+month+"' AND year='"+year+"' ");
                        ResultSet RS = ps.executeQuery();
                        while(RS.next()){ 
                              if(RS.getString(12).equals("no"))
                              {
                               pending=Integer.parseInt(RS.getString(11));
                              } 
                            out.println("<tr><td><label>pending</label></td><td><input type='text' name='pending' id='fname' value='"+pending+"'></td></tr>");
                            
                        }
                        //parking charges
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
                        PreparedStatement ps1 = c1.prepareStatement("SELECT * FROM vechile WHERE flat=? ");
                        ps1.setInt(1,flat);
                        ResultSet RS1 = ps1.executeQuery();
                        int charge=0;
                        while(RS1.next())
                        {
                            if(RS1.getString(3).equals("2-wheeler"))
                            {
                                charge+=100;
                            }
                            else{
                                charge+=200;
                            }
                        } 
                        
                        out.println("<tr><td><label>parking charge</label></td><td><input type='text' name='park' id='fname' value='"+charge+"'></td></tr>"); 
                    %>
                        </table>                  
                    <input type="submit" id="btn" value="save" name="s1">
                    </form>
                    
            </div>
           </center>
        </div> 
          
    </body>
</html>

