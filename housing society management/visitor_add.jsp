
<%-- 
    Document   : add_visitor
    Created on : Oct 29, 2020, 10:59:43 PM
    Author     : Admin
if(session.getAttribute("flat")==null)
            {
                response.sendRedirect("login.html");
            }
            %>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <style>
        .text{
                width:100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
        .time{
                width:18%;
                padding: 10px 10px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                
            }
            label{
                font-size:18px;
            }
            .add{
                margin-left:32%;
                border:1px solid black;
                width:350px;
                padding:20px;
                background:#ddd;
            }
            #btn{
                     width:100%;     
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
        </style>
        </head>
    <body>
        
            
        <jsp:include page="header.html"/>
        <center> <h1>add new visitor</h1></center>
        <div class="add">
            <form method="post" action="vis_ser.jsp">
        <label>Select Flat No:</label>&nbsp;&nbsp;<select  style="width:100px;height:35px;background:rgba(0,0,0,0.5);color:white" name="flat" id="flat">
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
        </select></br>
       <input type="text" class="text" name="name" placeholder="enter visitor name"></br>
       <input type="text" class="text" name="phone" placeholder="visitor phone number"></br>
       <input type="text" class="text" name="pur" placeholder="purpose"></br>
       <label>in time</label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="time" name="in_hrs" placeholder="hrs">: <input type="text" class="time" name="in_min" placeholder="min"></br>       
     <label>out time</label>&nbsp;&nbsp;<input type="text" class="time" name="out_hrs" placeholder="hrs">: <input type="text" name="out_min" class="time" placeholder="min"></br>
     <input type="submit" id="btn" value="save" name="s1">
      </form>  
  </div>     
    </body>
</html>
