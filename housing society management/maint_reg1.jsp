<%-- 
    Document   : maint_reg1
    Created on : Nov 1, 2020, 6:56:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" import="java.sql.*" import="java.time.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            
            Class.forName("com.mysql.jdbc.Driver");
                        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/housing", "root", "");
            if(request.getParameter("s1")!=null){
            try{
            String flat=session.getAttribute("fl").toString();
            String date=session.getAttribute("dt").toString();
            String month=session.getAttribute("mon").toString();
            int service=Integer.parseInt(request.getParameter("service"));
            int park=Integer.parseInt(request.getParameter("park"));
            int other=Integer.parseInt(request.getParameter("other"));
            int pending=Integer.parseInt(request.getParameter("pending"));
            LocalDate dt=LocalDate.now();
            String year=Integer.toString(dt.getYear());
            int total=service+park+other+pending;
            String paid="no";
            String bill=flat+month+year;
            
                        PreparedStatement ps = c.prepareStatement("insert into maint values(?,?,?,?,?,?,?,?,?,?,?,?)");
                        ps.setString(1,bill);
                        ps.setString(2,flat);
                        ps.setString(3,month);
                        ps.setString(4,year);
                        ps.setString(5,date);
                        ps.setInt(6,service);
                        ps.setInt(7,park);
                        ps.setInt(8,other);
                        ps.setInt(9,pending);
                        ps.setString(10,"0");
                        ps.setInt(11,total);
                        ps.setString(12,paid);
                        
                        ps.executeUpdate();
                        ps.close();
                        c.close();
                        out.println("<script>alert('bill generated');window.location.href='admin_maint.jsp'</script>");
        }catch(Exception e)
        {
            out.println(e);
        }
        }    
          //update  form admin_maint.jsp
          if(request.getParameter("s2")!=null){
             try{
            String flat=request.getParameter("flat");
            String month=request.getParameter("month");
            String year=request.getParameter("year");
            String due=request.getParameter("due");
            int service=Integer.parseInt(request.getParameter("service"));
            int park=Integer.parseInt(request.getParameter("park"));
            int other=Integer.parseInt(request.getParameter("other"));
            int pending=Integer.parseInt(request.getParameter("pending"));
            int total=service+park+other+pending;
            String bill=flat+month+year;
            String paid=request.getParameter("paid");
            PreparedStatement ps1 = c.prepareStatement("UPDATE maint SET flat=?,month=?,due=?,service_c=?,parking_c=?,other_f=?,pending=?,total=?,paid=? WHERE flat=? AND month=? AND year=?");
            ps1.setString(1,flat);
            ps1.setString(2,month);
            ps1.setString(3,due);
            ps1.setInt(4,service);
            ps1.setInt(5,park);
            ps1.setInt(6,other);
            ps1.setInt(7,pending);
            ps1.setInt(8,total);
            ps1.setString(9,paid);
            ps1.setString(10,flat);
            ps1.setString(11,month);
            ps1.setString(12,year);
            
            ps1.executeUpdate();
            ps1.close();
            c.close();
            out.println("<script>alert('bill updated');window.location.href='admin_maint.jsp'</script>");
             }catch(Exception e){
                 out.println(e);
             }
          }   
            %>
    </body>
</html>
