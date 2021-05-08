<%-- 
    Document   : admin_home
    Created on : Nov 6, 2020, 12:39:03 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            .btn-group{
                width:30%; 
                float:left;
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
            <a href="admin_member.jsp"><button>user's</button></a>
            <a href="admin_vech.jsp"><button>view vehicles</button></a>
            <a href="admin_maint.jsp"><button>add maintenance</button></a>
            <a href="admin_comp.jsp"><button>view complaint</button></a>
            <a href="admin_notice.jsp"><button>notice board</button></a>
            <a href="admin_visitor.jsp"><button>visitors</button></a>
        </div>    
        <div class="side">
            </br></br></br></br>
        <center><h1>Admin site</h1></center>
        </div>        
        </div>
        </br></br></br></br>
        </br></br></br></br></br></br></br></br></br></br></br></br>
        </br></br></br></br></br>
     <jsp:include page="footer.html"/>
    </body>
</html>
