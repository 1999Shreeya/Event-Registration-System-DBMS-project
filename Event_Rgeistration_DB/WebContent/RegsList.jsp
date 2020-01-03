<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
%>
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

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Event Bookings</title>
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
  border: 0px solid #ccc;
  border-top: none;
} 
  </style>
</head>

<body>

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

<div class="containter" style="background-color:black; color:white; margin:30px; margin-top:7%; padding:70px; opacity:0.7">
<h3 style="text-align:center; margin:20px;" >Event Registrations</h3>
	<div class="tab" style="background-color:black; ">
	<%
       try{
    	   int EventId=0;
    	   Class.forName("com.mysql.jdbc.Driver");
    	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_reg", "root", "123456"); // gets a new connection
    	 //Query for event id
    	   PreparedStatement ps = con.prepareStatement("SELECT event_name FROM event_reg.event_tab;");
    	   ResultSet event_list = ps.executeQuery();
    	
    	    int i=1;
    	   while(event_list.next()){
    		   %>
    <button class="tablinks" onclick="openCity(event, '<%=event_list.getString("event_name") %>')"><%=event_list.getString("event_name") %></button>
    		   <%
    	   }
    	   con.close();
       }
      catch(Exception e){
    	  out.println("Exception :"+e.getMessage());
    	  e.printStackTrace();
      }
      
      %>
</div>

	<%
       try{
    	   int EventId=0;
    	   Class.forName("com.mysql.jdbc.Driver");
    	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_reg", "root", "123456"); // gets a new connection
    	 //Query for event id
    	   PreparedStatement ps = con.prepareStatement("SELECT event_name FROM event_reg.event_tab;");
    	   ResultSet event_list = ps.executeQuery();
    	
    	    int i=1;
    	   while(event_list.next()){
    		   %>
    
               <!--  registrations table -->
				<div id="<%=event_list.getString("event_name") %>" class="tabcontent">
				   <table class="table table-striped " style="color:white;">
				    <thead class="thead-light">
				        <tr>
				        <th>#</th>
				        <th>Registration No.</th>
				        <th>Name</th>
				        <th>Event Date</th>
				        <th>Amount Paid</th>
				        <th></th>
				        
				      </tr>
				    </thead>
				    <tbody>
				 
				  <%
				  try{
			    	   int EventNo=0;
			    	   int no=1;
			    	   Class.forName("com.mysql.jdbc.Driver");
			    	   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_reg", "root", "123456"); // gets a new connection
			    	 //Query for event id
			    	   PreparedStatement ps1 = conn.prepareStatement("select r.reg_id ,s1.person_name, s2.start_date,s2.end_date,s2.price from registration r, person s1, event_tab s2  where r.person_id = s1.person_id and r.event_id = s2.event_id and s2.event_name = ?  order by s2.start_date;");
			    	  ps1.setString(1,event_list.getString("event_name"));
			    	 ResultSet regs= ps1.executeQuery();
			    	 while(regs.next()){
			    		 %>
			    		  <tr>
			    		  <td><%=no++ %></td>
			    		  <td><%=regs.getInt("reg_id") %></td>
			    		   <td><%=regs.getString("person_name") %></td>
			    		  <td><%=regs.getDate("start_date") %>&nbsp &nbsp To &nbsp &nbsp<%=regs.getString("end_date") %></td>
			    		     <td><%=regs.getString("price") %></td>
			    		     </tr>
			    		 <%
			    	 }
			    	  conn.close();
			       }
			      catch(Exception e){
			    	  out.println("Exception :"+e.getMessage());
			    	  e.printStackTrace();
			      }
				  %>
				  </tbody>
				  </table>
				</div>
				               
    
          <%
    	   }
    	   con.close();
       }
      catch(Exception e){
    	  out.println("Exception :"+e.getMessage());
    	  e.printStackTrace();
      }
      
      %>

</div>
<script>
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
   

</body>
</html>
