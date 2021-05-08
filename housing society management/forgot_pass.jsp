<%-- 
    Document   : forgot_pass
    Created on : Jan 29, 2021, 12:17:46 AM
    Author     : Admin
 // String email=session.getAttribute("emailid").toString();
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
          #b1{
                width:100%;
                color:white;
                padding: 12px 20px;
                
                background-color: black;
                display: inline-block;
                border: 1px solid black;
                border-radius: 4px;
                box-sizing: border-box;
                cursor: pointer;
            }  
            input[type=text]{
                width:100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            .pass{
               width:45%; 
            }
            b{
                float:left;
                
            }
            #l1{
                color:red;
                
            }
            </style>
        <script>
           
        function match2(){
            var pass1=document.getElementById("p1").value;
            var pass2=document.getElementById("p2").value;
           
            if(p1==p2){
                document.getElementById("l1").innerHTML="";
            }
            else{
                document.getElementById("l1").innerHTML="password not matching";
            }
        }
        
        
        
            </script>
    </head>
    <body>
           
           <jsp:include page="header.html"/>
           </br></br>
                <center>
                 <div class="pass">   
                <form action="forgot_pass_ser.jsp" method="post">
               <b> Enter New Password</b> </br><input type="password" name="pass1"  id="p1" required>
               </br><b> Retype Password </b></br><input type="password" name="pass2" id="p2" oninput="match2()" required>
                </br><label id="l1"></label></br></br>
                <input type="submit" value="update" id="b1" name="newpass">
                </form>
                     </div>
                    </center>
                </br></br></br>
                <jsp:include page="footer.html"/> 
    </body>
</html>
