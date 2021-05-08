<%--

                                u=rs.getString(1);
                                p=rs.getString(2); 
                                if(f.equals(u) && type.equals(p))
                                { 
                                 out.println("<script>alert('flat is alerdy registered');window.location.href='register.html'</script>");  
                                }
                                else if(uname.equals(rs.getString(8)))
                                        {
                                            out.print("<script>alert('username is alredy taken');window.location.href='register.html'</script>");
                                        }
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
        String f;
     String mob;
     String mail;
     String vech;
     String uname;
     String pass;
     String dte;
     String oname;
     int members;
     String type;
     String u;
     String p;
         %>
         <% 
             try{
             f=request.getParameter("flat");
             type=request.getParameter("type");
             mob=request.getParameter("mobnum");
             mail=request.getParameter("email");
           //  vech=request.getParameter("vehicle");
             uname=request.getParameter("uname");
             pass=request.getParameter("pass");
             dte=request.getParameter("dte"); 
             oname=request.getParameter("oname");
             members=Integer.parseInt(request.getParameter("member"));
              Class.forName("com.mysql.jdbc.Driver");
                    Connection c=DriverManager.getConnection("jdbc:mysql://localhost/housing","root","");  
                    PreparedStatement ps=c.prepareStatement("insert into owner values(?,?,?,?,?,?,?,?,?)");
                    ps.setString(1,f);
                    ps.setString(2,type);
                    ps.setString(3,oname);
                    ps.setString(4,mob);
                    ps.setString(5,mail);
                    
                    ps.setString(6,dte);
                    ps.setString(7,uname);
                    ps.setString(8,pass);
                    ps.setInt(9,members);
                   // ps.executeUpdate();
                    //checking for flat
                    PreparedStatement ps1=c.prepareStatement("SELECT flat,type FROM owner WHERE flat=? AND type=?");
                    ps1.setString(1,f);
                    ps1.setString(2,type);
                    ResultSet rs=ps1.executeQuery();
                     if(rs.first())
                     {
                        out.println("<script>alert('flat is alerdy registered');window.location.href='register.html'</script>");         
                     }  
                     else{
                         ps.executeUpdate();
                        }             
                    rs.close();
                    ps1.close();
                    
                    ps.close();
                    c.close();
                   
                    out.println("<script>alert('registered sucssfully ready to login');window.location.href='loginn.jsp'</script>");   
                    
                    
             }
             catch(Exception e)
             {   
                 String nul="com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column 'type' cannot be null";
                 String primary="com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry 'nikhil' for key 'PRIMARY'";
                 String ee=e.toString();
                 if(primary.equals(ee))
                 {
                     out.println("<script>alert('username alerdy taken');window.location.href='register.html'</script>");   
                     out.println(ee);
                 }
                if(nul.equals(ee))
                 {
                     out.println("<script>alert('plese select flat type');window.location.href='register.html'</script>");   
                     out.println(ee);
                 }
                 out.println(e);
             
             }
             %>
         
    </body>
</html>
