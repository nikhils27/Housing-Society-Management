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

            }

            tr:nth-child-(even){
                background-color:#f2f2f2;
            }
            th{
                font-size:25px;
                padding:5px;
            }
            td{
                font-size:25px;
                padding:5px;
            }
            table{
                font-size:20px;
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
            .side{
                float:left;
                width:69%;
                display:none;

            }
            .update{
                float:left;
                width:69%;
                display:none;
            }
            .view{
               float:left;
                width:69%;
                display:none; 
            }
            .fname{
                width:100%;
                padding: 10px 10px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            label{
                font-size: 20px;
            }
        </style> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>   
        <script>
            $(document).ready(function () {
                $(".b1").click(function () {
                    $(".side").show();
                    $(".update").hide();
                    $(".view").hide();
                    
                });
                $(".b2").click(function () {
                    $(".side").hide();
                    $(".update").show();
                    $(".view").hide();
                });
                 $(".b3").click(function () {
                    $(".side").hide();
                    $(".update").hide();
                    $(".view").show();
                });
            });

        </script>
    </head>
    <body>
        <jsp:include page="admin_header.html"/>
        <div class="contain">
            <div class="btn-group">
                <button class="b1">generate maintenance bill</button>
                <button class="b2">update maintenance</button> 
                <button class="b3">search maintenance bills</button> 
            </div>    
            <div class="side">
                <center>
                    <form action="maint_reg.jsp" method="post">    
                        <h2 style="background-color:rgba(0,0,0,0.5);width:60%;color:white">Generate Maintenance Bills</h2>
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
                         <tr><td><label>select month </label></td><td><select style="width:130px;height:30px;background:rgba(0,0,0,0.5);color:white;" name="month" id="flat">
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
                        </select></br></td></tr>
                        <tr><td> <label>due date</label></td><td><input type="date" name="date" class="fname"></td></tr>
                        
                        </table>
                        <input type="submit" id="btn" value="next" name="s1">
                        </form>
                </center>
            </div>
            <div class="update">
                <center>
                    <form action="maint_update.jsp" method="post"> 
                        <h2 style="background-color:rgba(0,0,0,0.5);width:60%;color:white">Update Maintenance</h2>
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
                      <tr><td>  <label>select month </label></td><td><select style="width:130px;height:30px;background:rgba(0,0,0,0.5);color:white;" name="year" id="flat">
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
                      </table> </br>
                        <input type="submit" id="btn" value="next" name="s2">                 
                    </form>
                </center> 
            </div> 
            
            
            
                    <div class="view">
                <center>
                    <form action="maint_update.jsp" method="post"> 
                 <h2 style="background-color:rgba(0,0,0,0.5);width:60%;color:white">Search Maintenance Bills</h2>
                 
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
                      <tr><td>  <label>select month </label></td><td><select style="width:130px;height:30px;background:rgba(0,0,0,0.5);color:white;" name="year" id="flat">
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
    </body>
</html>

