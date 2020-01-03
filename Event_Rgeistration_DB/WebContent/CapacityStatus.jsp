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

    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Capacity Status</title>
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
  	
</head>

<style type="text/css">
	/*.table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
   background-color: #c5c6c7;
}*/

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


</style>
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

<div class="container" style="background-color:black; margin: 3% 12%; margin-top:8%; padding:3%; opacity:0.7" >
         <h2 style="text-align:center; margin:20px; color:white;" >Capacity Status</h2>
         
  <input type="text" id="myInput" class="input-group" onkeyup="SearchEvent()" placeholder="Search for Event names.." title="Type in a name">

  

  <table class="table" id="myTable" style="color:white" >
    <thead class="thead-light he">
      <tr>
      	<th>Sr No.</th>
        <th>Event id</th>
        <th>Event Name</th>
        <th>Capacity Status</th>
      </tr>
    </thead>
    <tbody>
     	 
				  <%
				  try{
			    	   int i=1;
			    	   Class.forName("com.mysql.jdbc.Driver");
			    	   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_reg", "root", "123456"); // gets a new connection
			    	 //Query for event id
			    	   PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM event_reg.event_tab where  start_date >= CURDATE() order by start_date desc;");
			    	 ResultSet regs= ps1.executeQuery();
			    	 while(regs.next()){
			    		 %>
			    		  <tr>
			    		  <td><%=i++ %></td>
			    		  <td><%=regs.getInt("event_id") %></td>
			    		   <td><%=regs.getString("event_name") %></td>
			    		    <td><%=regs.getInt("occupied") %> / <%=regs.getInt("capacity") %></td>
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


<script>

function SearchEvent() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>

  </body>
  </html>