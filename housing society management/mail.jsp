<%-- 
    Document   : mail
    Created on : Nov 11, 2020, 10:44:25 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import=" java.io.*,java.util.*,java.util.Random,java.sql.*,javax.mail.*,javax.mail.internet.*,javax.activation.*,java.net.*"%>

        <%  
          String email=request.getParameter("a");
           
          final String username="skyhighsec18@gmail.com";
                final String password="Skyhigh18";
                String smtphost="smtp.gmail.com";
                String compression="smtp info";
                String from="skyhighsec18@gmail.com";
                String to="nikhils272001@gmail.com";
                Random r=new Random(900000);
                int otp=r.nextInt();
                if(otp<0)
                {
                    otp=otp*-1;
                }
                String body="Your OTP is : "+otp;
                Transport myTransport=null;
                try{
                   Properties props=System.getProperties();
                   props.put("mail.smtp.user", username);
    props.put("mail.smtp.host","smtp.gmail.com");
    props.put("mail.smtp.port","465");//465
    props.put("mail.smtp.starttls.enable","true");
    props.put("mail.smtp.debug", "true");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.socketFactory.port","465");
    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    props.put("mail.smtp.socketFactory.fallback", "false");
                    
                // Session mailSession =Session.getDefaultInstance(props,null);
                Session mailSession = Session.getInstance(props,new javax.mail.Authenticator() {
    protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
        return new javax.mail.PasswordAuthentication(username, username);
    }
  });

                 Message msg= new MimeMessage(mailSession);
                 msg.setFrom(new InternetAddress(from));
                 InternetAddress[] address={new InternetAddress(to)};
                 msg.setRecipients(Message.RecipientType.TO,address);
                 msg.setSubject(compression);
                 msg.setText(body);
                 msg.setSentDate(new java.util.Date());
                 
                 
                 myTransport=mailSession.getTransport("smtp");
                 myTransport.connect(smtphost,username,password);
                 msg.saveChanges();
                 myTransport.sendMessage(msg,msg.getAllRecipients());
                    myTransport.close();
            //    out.println("<script>alert('Password Sent!!!!!');window.location.assign('loginn.jsp');</script>");
                out.println(otp);
                }
                    catch(Exception e){
                        e.printStackTrace();
                        out.println(e);
                    }   
        %>