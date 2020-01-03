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
	<title> Events</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="utf-8">
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
        <a class="nav-link" href="part_profile.jsp"><i class="fa fa-user" aria-hidden="true"></i>Edit profile</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="logout.jsp"><i class="fa fa-fw fa-sign-out"></i>Logout</a>
      </li>    
    </ul>
  </div>  
  </div>
</nav>

<div class="container" style="background-color:black; margin: 3%12%; margin-top:10%; padding:3%; opacity:0.7" >
         <h2 style="text-align:center; margin:20px; color:white;" >Current Events</h2>
         
  <input type="text" id="myInput" class="input-group" onkeyup="SearchEvent()" placeholder="Search for Event names.." title="Type in a name">
	
     <%
       try{
    	   Class.forName("com.mysql.jdbc.Driver");
    	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_reg", "root", "123456"); // gets a new connection
    	 //Query for event id
    	   PreparedStatement ps = con.prepareStatement("select * from event_tab where CURDATE() between start_date and end_date;");
    	   ResultSet rs = ps.executeQuery();
    	   
     %>
     
     <table class="table" id="myTable" style="color:white">
    	<thead class="thead-light he">
    	  <tr>
	        <th>Event Name</th>
	        <th>Date</th>
	        <th>Category</th>
	        <th>Details</th>
	      </tr>
	    </thead>
	    <tbody>
	    
	  <%
    	   while(rs.next()){
    		   
    		   int eve_id = rs.getInt("event_id");
    		   session.setAttribute("event_id",eve_id);
    		   %>
    		   <tr>
    		    <td><%=rs.getString("event_name") %></td>
        		<td>
        			<%=rs.getDate("start_date") %><br>
        			<span style="margin-left:18%;">to</span><br>
        			<%=rs.getDate("end_date") %>
        		</td>
        		<td><%=rs.getString("category") %></td>
        		<td>
        			<button class="tab" style="background-color:black; color:white;" onclick="location.href='event_details.jsp?event_id=<%=rs.getInt("event_id")%>'">View details</button>
        		</td>
        		</tr>
    		   <%
    	   }
    	   con.close();
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
    td = tr[i].getElementsByTagName("td")[0];
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