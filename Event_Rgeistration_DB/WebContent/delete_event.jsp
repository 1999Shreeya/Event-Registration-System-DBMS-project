<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.sql.Connection" %>
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
<title></title>
</head>
<body>
<%
	int event_id = Integer.parseInt(request.getParameter("event_id"));
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_reg", "root", "123456"); // gets a new connection
    
    String query2 = "call delete_rec(?);";
    CallableStatement cs = con.prepareCall(query2);
    cs.setInt(1, event_id);
    
    cs.executeQuery();
    cs.close();
    
    String query = "delete from event_tab where event_id = ?";
    PreparedStatement ps = con.prepareStatement(query);
  	ps.setInt(1, event_id);
    
  	ps.executeUpdate();
  	
  	ps.close();
  	con.close();
  	response.sendRedirect("dashboard2.jsp");
%>
</body>
</html>