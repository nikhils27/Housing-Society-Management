<%-- 
    Document   : loginn
    Created on : Nov 9, 2020, 7:05:06 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

.header{
width:100%;
background:rgba(0,0,0,0.5);
font-size:45px;
color:white;

text-transform:uppercase;
text-shadow:2px 2px 2px black;
}
.add{
font-size:20px;
text-align:center;
background:rgba(0,0,0,0.5);
color:white;
margin:20px 0;
}
.login-b
{
width:280px;
background:#ddd;
color:black;
border:1px solid black;
padding:10px;
//float:left;
}
.login-b h1{
font-size:30px;
border-bottom:6px solid;
padding:13px 0;
text-align:center;
}
.textbox{
width:100%;
overflow:hidden;
padding:8px 0;
margin:8px 0;
border-bottom:1px solid;
}
.textbox input{
border: none;
background: none;
font-size:18px;
color:black;
}
#btn
{
width:100%;
height:40px;
background:black;
border:3px solid;
color:white;
padding: 5px;
cursor:pointer;
}
#btn :hover{
    background:rgba(0,0,0,0.5);
    color:white;
}

.ig img{
    height:330px;
    width: 360px;
    //float:left;
}
#btn1
{
width:100%;
height:35px;
background:white;
border:3px solid;
color:black;
padding: 5px;
cursor:pointer;
}
#btn1 :hover{
    background:pink;
    color:white;
}
.forgot{
    display:none;
    width:50%;
}
#email{
    width:80%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
}
#next,#cancel{
    width:38%;
                color:white;
                padding: 10px 15px;
                margin: 8px;
                background-color: black;
                display: inline-block;
                border: 1px solid black;
                border-radius: 4px;
                box-sizing: border-box;
                cursor: pointer;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
        </script>
        <script>
            $(document).ready(function () {
                $("#open").click(function () { 
                     $(".login").hide();
                     $(".forgot").show();
                });
                $("#next").click(function () {
                    var x=document.getElementById("email").value;
                    window.location.href="forgot_mail.jsp?email="+x;
                    
                });
                $("#cancel").click(function () {
                    $(".forgot").hide();
                   $(".login").show();
                });
                });
        
        </script>
    </head>
<body>
      
<jsp:include page="header1.html"/>
</br></br></br>
<div class="login">
<table style="width:100%;margin-left:100px;"> 
    <tr><td>
<div class="ig">
<img src="image/new hsg.png">
</div></td><td>
<div class="login-b"> 
<h1>login</h1>
 <form  action="login.jsp" method="post">
<div class="textbox">
<input type="text" placeholder="username" name="username"><br>
</div>
<div class="textbox">
<input type="password" placeholder="password" name="password">
</div>
     <label id="open" style="float:right;color: blue;border-bottom:1px solid blue;cursor: pointer;">forgot password?</label></br>
</br><input id="btn" type="submit" value="login" name="log">
</br>
</form>
</br>
<hr>

<a href="register.html"><button id="btn1">or register here</button></a>
</div></td>
 </tr>
</table>
    </div>
<center>
<div class="forgot">
<b style="float:left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enter username to continue</b></br>
<input type="text" id="email" name="email" required></br>
<input type="button" id="next" value="next">
<input type="button" id="cancel" value="cancel">
</div>
</center>
</br></br></br></br>
<jsp:include page="footer.html"/>      
  
</body>
</html>

















