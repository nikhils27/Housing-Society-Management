<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
        String u;
        String p;
        %>
        <%
            String un=request.getParameter("username");
            String pa=request.getParameter("password");
             Class.forName("com.mysql.jdbc.Driver");
                    Connection c=DriverManager.getConnection("jdbc:mysql://localhost/housing","root","");
                    PreparedStatement ps=c.prepareStatement("select * from owner where username=? and password=? ");
                    ps.setString(1,un);
                    ps.setString(2,pa);
                    ResultSet RS= ps.executeQuery();
                    
                    if (RS.first())
                    {
                                  session.setAttribute("username",un);
                                  session.setAttribute("flat",RS.getString(1));
                                  response.sendRedirect("homepage.html");
                    } 
                    PreparedStatement ps1=c.prepareStatement("select * from admin");
                    ResultSet RS1= ps1.executeQuery();
                    while(RS1.next()){                   
                                u=RS1.getString(1);
                                p=RS1.getString(2);
                                if(un.equals(u) && pa.equals(p))
                                { 
                                  session.setAttribute("admin",un);
                                  //session.setAttribute("flat",RS.getString(1));
                                  response.sendRedirect("admin_home.jsp");
                                  break;
                                }
                        
                    }
                    
                    
                    PreparedStatement ps2=c.prepareStatement("select * from sec");
                    ResultSet RS2= ps2.executeQuery();
                    while(RS2.next()){                   
                                u=RS2.getString(1);
                                p=RS2.getString(2);
                                if(un.equals(u) && pa.equals(p))
                                { 
                                  session.setAttribute("sec",un);
                                  //session.setAttribute("flat",RS.getString(1));
                                  response.sendRedirect("visitor_add.jsp");
                                  break;
                                }
                        
                    }
                    out.println("<script>alert('invalid username and password');window.location.href='loginn.jsp';</script>");         
                    RS.close();
                    ps.close();
                    RS1.close();
                    ps1.close();
                    RS2.close();
                    ps2.close();
                    c.close();
            %>
    </body>
</html>
