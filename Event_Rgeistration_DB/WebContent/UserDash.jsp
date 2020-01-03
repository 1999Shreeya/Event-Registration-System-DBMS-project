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
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="custom.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,200,400,500,600" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    <style type="text/css">
    body {
  background-image: url("4.jpg");
        background-repeat:no-repeat;
       background-size:cover;
} 
.main-section{
  width:100%;
  text-align: center;
  margin-top:10%;
}
.dashbord{
  width:30%;
  display: inline-block;
  background-color:black;
  color:#fff;
  margin: 35px 10px; 
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
<div class="container">
	<div class="main-section" style="background-color: black; opacity: 0.7; ">
    <h1 align="center" style="padding-top:20px; color:white">Dashboard</h1>
      <hr style="color:white; border:1px solid white;">
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
        <a href="#"  type="button" class="btn btn-block btn-info" >More Info </a>
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
        <a href="#"  type="button" class="btn btn-block btn-info" >More Info </a>
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
       <a href="#"  type="button" class="btn btn-block btn-info" >More Info </a>
      </div>
    </div>
    
    

  </div>
</div>
  
</body>
</html>