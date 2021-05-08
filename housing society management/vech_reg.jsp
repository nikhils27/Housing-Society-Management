<%-- 
    Document   : vech_reg
    Created on : Aug 15, 2020, 7:43:39 PM
    Author     : Admin
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getParameter("btn") != null) {
                String f;
                if (session.getAttribute("flat") != null) {
                    f = session.getAttribute("flat").toString();
                } else {
                    f = request.getParameter("flat");
                }
                try {
                    String p_place = request.getParameter("park_id");
                    String type = request.getParameter("vehicle");
                    String o_name = request.getParameter("vech_own_name");
                    String v_name = request.getParameter("vech_name");
                    String v_no = request.getParameter("vech_no");
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection c = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
                    PreparedStatement ps = c.prepareStatement("insert into vechile values(?,?,?,?,?,?)");
                    ps.setString(1, f);
                    ps.setString(2, p_place);
                    ps.setString(3, type);
                    ps.setString(4, o_name);
                    ps.setString(5, v_name);
                    ps.setString(6, v_no);
                    ps.executeUpdate();
                    ps.close();
                    c.close();

                    if (session.getAttribute("flat") != null) {
                        out.println("<script>alert('vehicle registered sucssfully'); window.location.href='vehicle.jsp'</script>");
                    } else {
                        out.println("<script>alert('vehicle registered sucssfully'); window.location.href='login.html'</script>");
                    }
                } catch (Exception e) {
                    out.println(e);
                }

            }
            if(request.getParameter("s1") != null)
            {
                     try{
                            String no=request.getParameter("no");
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection c1 = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
                            PreparedStatement ps1 = c1.prepareStatement("delete from vechile where vech_no='" + no + "'");
                            ps1.executeUpdate();                            
                         //   out.println("<script>alert('vehicle removed successfully');window.location.href='vehicle.jsp'</script>");       
                            c1.close();
                            ps1.close(); 
                      } 
                          catch(Exception E){
                          out.println(E);
                          out.println("<script>alert('vehicle not found');window.location.href='vehicle.jsp'</script>");
                      
                      }
         
                    
            }
        %>
    </body>
</html>
