<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    %>
    <%@page import ="java.sql.*" %>
    <%@page import ="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Event-Participations</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
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
}
/* Style the tab */
.tab {
  overflow: hidden;
  border: 3px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
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

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
  color:black;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
} 

.coupon {
  border: 5px dotted #bbb;
  border-radius: 15px;
  margin: 0 auto;
}

.promo {
  background: #ccc;
  padding: 3px;
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
         <a class="nav-link" href="dashboard.jsp"><i class="fa fa-dashboard" aria-hidden="true"></i>Dashboard</a>
      </li>
      <li class="nav-item" >
         <a class="nav-link" href="part_reg.jsp"><i class="fa fa-calendar" aria-hidden="true"></i>My Bookings</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="part_profile.jsp"><i class="fa fa-user" aria-hidden="true"></i>Profile</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="logout.jsp"><i class="fa fa-fw fa-sign-out"></i>Logout</a>
      </li>    
    </ul>
  </div>  
  </div>
</nav>

<div class="containter" style="background-color:black; color:white; margin:20%; margin-top:10%; padding:70px 10px; opacity:0.7">
	<h3 style="text-align:center; ,margin-bottom:20px;s" > My Logs</h3>
 
     <%
       try{
    	   int person_id = 0;
    	   if(session.getAttribute("username") != null)
    	   {
    	   	person_id = (int)session.getAttribute("person_id");
    	   }

    	   Class.forName("com.mysql.jdbc.Driver");
    	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_reg", "root", "123456"); // gets a new connection
    	 //Query for event id
    	   String query = "select r.reg_id, e.event_name, e.start_date ,e.end_date, e.price from registration r,participant s,event_tab e where r.person_id = s.person_id and e.event_id = r.event_id and s.person_id = ?";
    	
    	   PreparedStatement ps = con.prepareStatement(query);
    	   ps.setInt(1, person_id);
    	   ResultSet rs = ps.executeQuery();
    	   
    	   while(rs.next()){
    		  		int reg_id = rs.getInt("reg_id");
    		   		session.setAttribute("reg_id",reg_id);
    	%>
    <div class="container">
    <div class="row">
    	<div class="coupon  col-xs-5" style="background-color:white; color:black; opacity:1.0;">
		  <div class="container-fluid">
		    <h3>Registration No. : <%=reg_id %></h3>
		  </div>
		  
		  <div class="container-fluid" style="background-color:white">
		    <h2><b><%=rs.getString("event_name") %><br></b></h2> 
		    <p>Note : This is a temporary generated receipt. Kindly present this on the event day in order not to face difficulties </p>
		  </div>
		  <div class="container-fluid">
		    <p>Event Date : <span class="promo"><%=rs.getDate("start_date") %></span></p>
		    <p class="expire">Amount left : <%=rs.getInt("price") %><br></p>
		  </div>
		</div>
	</div>
	</div><br>
    <%
    	   }
    	   ps.close();
    	   con.close();
       } catch(Exception e){
    	  out.println("Exception :"+e.getMessage());
    	  e.printStackTrace();
       }
      
     %>
</div>
   
</body>
</html>
