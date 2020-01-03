<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import ="java.sql.*" %>
    <%@page import ="java.sql.Connection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Upcoming Events</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="custom.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,200,400,500,600" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  	
<style type="text/css">
	   body {
  		background-image: url("4.jpg");
        background-repeat:no-repeat;
       background-size:cover;
       font-size: 17px;
} 
#myInput {
  background-color: black;
  color:white;
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}
.he{

	background-color: #c5c6c7;
	color:black;
}
.tab {
  overflow: hidden;
  border: 3px solid #ccc;
  background-color: #f1f1f1;
}
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
  color:white;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
  color:black;
}

.main-section{
  width:100%;
  text-align: center;
  
}
.dashbord{
  width:25%;
  display: inline-block;
  background-color:black;
  color:#fff;
  margin: 35px 10px 5px 10px; 
  border:4px solid white;
}

.icon-section i{
  font-size: 35px;
  padding:5px;
  border:1px solid white;
  border-radius:50%;
  margin-top:-25px;
  margin-bottom: 10px;
  background-color:#34495E;
}
.icon-section p{
  margin:5px;
  background-color: black;
  
  font-size: 25px;
  padding-bottom: 10px;

}
.detail-section{
  background-color: white;
  padding: 0px 0px;
  
}
.dashbord .detail-section:hover{
  background-color: black;
  color:white;    
  cursor: pointer;
}
.detail-section a{
  text-decoration: none;
  font-size:20px;
}

.detail-section a:hover{
  color:black;
  text-decoration: none;
  font-size:20px;
}

</style>

</head>
<body>

 <%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expire",0);
	
	if(session.getAttribute("username")==null)
		response.sendRedirect("index.html");
%>

<nav class="navbar navbar-expand-lg bg-dark navbar-dark fixed-top" style="opacity:0.9;">
  <div class="container">

    <a class="navbar-brand" href="index.html">
    <img src="eventurous-logo-design.jpg" alt="Logo" style="width:60px; border:5px solid white;">
     BookMyEvent</a>
    
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item" >
         <a class="nav-link" href="dashboard2.jsp"><i class="fa fa-dashboard" aria-hidden="true"></i>Dashboard</a>
      </li>
      <li class="nav-item" >
         <a class="nav-link" href="add_event.jsp"><i class="fa fa-calendar" aria-hidden="true"></i>Add Event</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="org_profile.jsp"><i class="fa fa-user" aria-hidden="true"></i>Profile</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="logout2.jsp"><i class="fa fa-fw fa-sign-out"></i>Logout</a>
      </li>    
    </ul>
  </div>  
  </div>
</nav>
<div class="container" style="margin-top:7%">
	<div class="main-section" style="background-color: black; opacity: 0.7; margin-top:8%">
    <h1 align="center" style="padding-top:20px; color:white">Dashboard</h1>
      <hr style="color:white; border:1px solid white; margin:2%5%">
        <div class="dashbord">
      <div class="icon-section">
        <i class="fa fa-calendar" aria-hidden="true"></i><br>
        <h3>Upcoming Events</h3>
       <%
				  try{
			    	   int EventNo=0;
			    	   Class.forName("com.mysql.jdbc.Driver");
			    	   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_reg", "root", "123456"); // gets a new connection
			    	 //Query for event id
			    	   PreparedStatement ps1 = conn.prepareStatement("SELECT count(*) FROM event_reg.event_tab where  start_date > CURDATE();");
			    	 ResultSet regs= ps1.executeQuery();
			    	 while(regs.next()){
			    		 %>
			    		 <p><%=regs.getInt("count(*)") %></p>
			    		 <%
			    	 }
			    	  conn.close();
			       }
			      catch(Exception e){
			    	  out.println("Exception :"+e.getMessage());
			    	  e.printStackTrace();
			      }
				  %>

      </div>
      <div class="detail-section">
        <a href="upcom_events2.jsp"  type="button" class="btn btn-block btn-info" >More Info </a>
      </div>
    </div>
    <div class="dashbord dashbord-green">
      <div class="icon-section">
      <i class="fa fa-history" aria-hidden="true"></i>
      
        <h3>Old Events</h3>
       <%
				  try{
			    	   int EventNo=0;
			    	   Class.forName("com.mysql.jdbc.Driver");
			    	   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_reg", "root", "123456"); // gets a new connection
			    	 //Query for event id
			    	   PreparedStatement ps1 = conn.prepareStatement("SELECT count(*) FROM event_reg.event_tab where  end_date < CURDATE();");
			    	 ResultSet regs= ps1.executeQuery();
			    	 while(regs.next()){
			    		 %>
			    		 <p><%=regs.getInt("count(*)") %></p>
			    		 <%
			    	 }
			    	  conn.close();
			       }
			      catch(Exception e){
			    	  out.println("Exception :"+e.getMessage());
			    	  e.printStackTrace();
			      }
				  %>

      </div>
      <div class="detail-section">
        <a href="old_events2.jsp"  type="button" class="btn btn-block btn-info" >More Info </a>
      </div>
    </div>
    <div class="dashbord dashbord-orange">
      <div class="icon-section">
         <i class="fa fa-calendar-o" aria-hidden="true"></i>
        <h3>Current Events</h3>
        <%
				  try{
			    	   int EventNo=0;
			    	   Class.forName("com.mysql.jdbc.Driver");
			    	   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_reg", "root", "123456"); // gets a new connection
			    	 //Query for event id
			    	   PreparedStatement ps1 = conn.prepareStatement("SELECT count(*) FROM event_reg.event_tab where  start_date <= CURDATE() and end_date >= CURDATE();");
			    	 ResultSet regs= ps1.executeQuery();
			    	 while(regs.next()){
			    		 %>
			    		 <p><%=regs.getInt("count(*)") %></p>
			    		 <%
			    	 }
			    	  conn.close();
			       }
			      catch(Exception e){
			    	  out.println("Exception :"+e.getMessage());
			    	  e.printStackTrace();
			      }
				  %>

      </div>
      <div class="detail-section">
       <a href="curr_event2.jsp"  type="button" class="btn btn-block btn-info" >More Info </a>
      </div>
    </div>
    <div class="dashbord dashbord-blue">
      <div class="icon-section">
        <i class="fa fa-tasks" aria-hidden="true"></i><br>
        <h3>Event Bookings</h3>
      <p>&nbsp;&nbsp;<br></p>

      </div>
      <div class="detail-section">
        <a href="RegsList.jsp"  type="button" class="btn btn-block btn-info" >More Info </a>
      </div>
    </div>
    <div class="dashbord dashbord-red">
      <div class="icon-section">
       <i class="fa fa-th" aria-hidden="true"></i>
        <h3>Events Capacity</h3>
      <p>&nbsp;&nbsp;</p>
      </div>
      <div class="detail-section">
        <a href="CapacityStatus.jsp"  type="button" class="btn btn-block btn-info" >More Info </a>
      </div>
    </div>

  </div>
</div>

<script>

</script>

</body>
</html>