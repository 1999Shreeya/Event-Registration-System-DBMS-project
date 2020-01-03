<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import ="java.sql.*" %>
    <%@page import ="java.sql.Connection" %>
    <%@page import="mail.SendMail" %>
    
    <%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expire",0);
	
	if(session.getAttribute("username")==null)
		response.sendRedirect("index.html");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

 <%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expire",0);
	
	if(session.getAttribute("username")==null)
		response.sendRedirect("index.jsp");
%>
     <%
       try{
    	   Class.forName("com.mysql.jdbc.Driver");
		   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_reg", "root", "123456"); 
		   
		   int person_id = (int)session.getAttribute("person_id");
		   int event_id = Integer.parseInt(request.getParameter("event_id"));
		   
		    
		   String query = "insert into registration(person_id,event_id) values(?,?)";
		    
		   PreparedStatement ps = con.prepareStatement(query);
		   ps.setInt(1, person_id);
		   ps.setInt(2, event_id);
		    
		   int rows = ps.executeUpdate();
		   
		    if(rows == 1) {   
		    		out.println(person_id);
		    		String query1 = "select email from person where person_id = ?";
			    
				    PreparedStatement ps1 = con.prepareStatement(query1);
				    ps1.setInt(1, person_id);
				    ResultSet rs = ps1.executeQuery();
				    
				    if(rs.next()) {
				    	SendMail sp = new SendMail();
				    	String to = rs.getString("email");
				    	String msg = "You have successfully registered for your event on http://www.bookmyevent.com. For more info regarding registrations please visit out website. Thank you!";
				    	String sub = "Event Registration Confirmation";
				    	sp.send(to,sub,msg);
				    }
		%>
			    <script>
			    	alert("Registration Successful");
			    	window.location.replace("part_reg.jsp");;
			    </script>
			    
			<%
				//response.sendRedirect("part_reg.jsp");
		    }
		    ps.close();
		    con.close();
		    
		}  catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			
			 %>
		 		<script>
			    	alert("Slot not available!!");
			    	window.location.replace("dashboard.jsp");
			    </script>
		 	 <%
			//response.sendRedirect("event_details.jsp");
		}
      
      %>

       

</body>
</html>