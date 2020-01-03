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
<title>Event-Participations</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
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
  </style>
</head>

<body>
<div class="containter" style="background-color:black; color:white; margin:30px; padding:70px; opacity:0.7">
<h3 style="text-align:center; margin:20px;" > Event Slots Status</h3>
	<div class="tab" style="background-color:black; ">
  <button class="tablinks" onclick="openCity(event, 'CodeBuddy')" id="defaultOpen">CodeBuddy</button>
  <button class="tablinks" onclick="openCity(event, 'BugOff')">BugOff</button>
  <button class="tablinks" onclick="openCity(event, 'JustCoding')">Just Coding</button>
  <button class="tablinks" onclick="openCity(event, 'WebAppdev')">Web App dev</button>
  <button class="tablinks" onclick="openCity(event, 'DataQuest')">Data Quest</button>
  <button class="tablinks" onclick="openCity(event, 'Dextrous')">Dextrous</button>
  <button class="tablinks" onclick="openCity(event, 'PhotoshopRoyale')">Photoshop Royale</button>
  <button class="tablinks" onclick="openCity(event, 'Insights')">Insights</button>
</div>
<!--  codebuddy -->
<div id="CodeBuddy" class="tabcontent">
  
  <table class="table table-striped " >
    <thead class="thead-light">
      <tr>
        <th>Slot No.</th>
        <th>Slot Date</th>
        <th>Slot Time</th>
        <th>Occupied</th>
        <th>Capacity</th>
      </tr>
    </thead>
    <tbody>
     <%
       try{
    	   int EventId=0;
    	   Class.forName("com.mysql.jdbc.Driver");
    	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "123456"); // gets a new connection
    	 //Query for event id
    	   PreparedStatement ps = con.prepareStatement("SELECT event_id FROM event_management.event_tab where event_name=?;");
    	   ps.setString(1, "CodeBuddy");
    	   ResultSet rs1 = ps.executeQuery();
    	   if(rs1.next()){
    		    EventId = rs1.getInt("event_id");
    	   }
    	  
    	   ps.close();
    	   //Query for info
    	   PreparedStatement ps1 = con.prepareStatement("SELECT * FROM event_management.slot where event_id=?;");
    	   ps1.setInt(1, EventId);
    	   ResultSet rs= ps1.executeQuery();
    	   int i=1;
    	   while(rs.next()){
    		   %>
    		   <tr style="background-color:black; color:white;">
    		     <td><%=i++%></td>
    		    <td><%=rs.getDate("event_date") %></td>
        		<td><%=rs.getTime("start_time") %> - <%=rs.getTime("end_time") %></td>
        		<td><%=rs.getInt("occupied") %></td>
        		<td><%=rs.getInt("capacity") %></td>
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

<!-- Bugoff -->
<div id="BugOff" class="tabcontent">

  <table class="table table-striped " >
    <thead class="thead-light">
      <tr>
        <th>Slot No.</th>
        <th>Slot Date</th>
        <th>Slot Time</th>
        <th>Occupied</th>
        <th>Capacity</th>
      </tr>
    </thead>
    <tbody>
     
    
      <%
      try{
   	   int EventId=0;
   	   Class.forName("com.mysql.jdbc.Driver");
   	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "123456"); // gets a new connection
   	 //Query for event id
   	   PreparedStatement ps = con.prepareStatement("SELECT event_id FROM event_management.event_tab where event_name=?;");
   	   ps.setString(1, "BugOff");
   	   ResultSet rs1 = ps.executeQuery();
   	   if(rs1.next()){
   		    EventId = rs1.getInt("event_id");
   	    	  System.out.println(rs1.getInt("event_id"));
   	   }
   	  
   	   ps.close();
   	   //Query for info
   	   PreparedStatement ps1 = con.prepareStatement("SELECT * FROM event_management.slot where event_id=?;");
   	   ps1.setInt(1, EventId);
   	   ResultSet rs= ps1.executeQuery();
   	   int i=1;
   	   while(rs.next()){
   		   %>
   		   <tr style="background-color:black; color:white;">
   		     <td><%=i++%></td>
   		    <td><%=rs.getDate("event_date") %></td>
        	<td><%=rs.getTime("start_time") %> - <%=rs.getTime("end_time") %></td>
       		<td><%=rs.getInt("occupied") %></td>
       		<td><%=rs.getInt("capacity") %></td>
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

<!--  just coding -->
<div id="JustCoding" class="tabcontent">
 
  <table class="table table-striped " >
    <thead class="thead-light">
      <tr>
        <th>Slot No.</th>
        <th>Slot Date</th>
        <th>Slot Time</th>
        <th>Occupied</th>
        <th>Capacity</th>
      </tr>
    </thead>
    <tbody>
     <%
      try{
   	   int EventId=0;
   	   Class.forName("com.mysql.jdbc.Driver");
   	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "123456"); // gets a new connection
   	 //Query for event id
   	   PreparedStatement ps = con.prepareStatement("SELECT event_id FROM event_management.event_tab where event_name=?;");
   	   ps.setString(1, "JustCoding");
   	   ResultSet rs1 = ps.executeQuery();
   	   if(rs1.next()){
   		    EventId = rs1.getInt("event_id");
   	    	  System.out.println(rs1.getInt("event_id"));
   	   }
   	  
   	   ps.close();
   	   //Query for info
   	   PreparedStatement ps1 = con.prepareStatement("SELECT * FROM event_management.slot where event_id=?;");
   	   ps1.setInt(1, EventId);
   	   ResultSet rs= ps1.executeQuery();
   	   int i=1;
   	   while(rs.next()){
   		   %>
   		   <tr style="background-color:black; color:white;">
   		     <td><%=i++%></td>
   		     <td><%=rs.getDate("event_date") %></td>
        	 <td><%=rs.getTime("start_time") %> - <%=rs.getTime("end_time") %></td>
       		<td><%=rs.getInt("occupied") %></td>
       		<td><%=rs.getInt("capacity") %></td>
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



<!--  web app dev -->
<div id="WebAppdev" class="tabcontent">
  
  <table class="table table-striped " >
    <thead class="thead-light">
      <tr>
        <th>Slot No.</th>
        <th>Slot Date</th>
        <th>Slot Time</th>
        <th>Occupied</th>
        <th>Capacity</th>
      </tr>
    </thead>
    <tbody>
     <%
       try{
    	   int EventId=0;
    	   Class.forName("com.mysql.jdbc.Driver");
    	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "123456"); // gets a new connection
    	 //Query for event id
    	   PreparedStatement ps = con.prepareStatement("SELECT event_id FROM event_management.event_tab where event_name=?;");
    	   ps.setString(1, "WebAppDev");
    	   ResultSet rs1 = ps.executeQuery();
    	   if(rs1.next()){
    		    EventId = rs1.getInt("event_id");
    	    	  System.out.println(rs1.getInt("event_id"));
    	   }
    	  
    	   ps.close();
    	   //Query for info
    	   PreparedStatement ps1 = con.prepareStatement("SELECT * FROM event_management.slot where event_id=?;");
    	   ps1.setInt(1, EventId);
    	   ResultSet rs= ps1.executeQuery();
    	   int i=1;
    	   while(rs.next()){
    		   %>
    		   <tr style="background-color:black; color:white;">
    		     <td><%=i++%></td>
    		    <td><%=rs.getDate("event_date") %></td>
        		<td><%=rs.getTime("start_time") %> - <%=rs.getTime("end_time") %></td>
        		<td><%=rs.getInt("occupied") %></td>
        		<td><%=rs.getInt("capacity") %></td>
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
<!--  data quest -->
<div id="DataQuest" class="tabcontent">
  
  <table class="table table-striped " >
    <thead class="thead-light">
      <tr>
        <th>Slot No.</th>
        <th>Slot Date</th>
        <th>Slot Time</th>
        <th>Occupied</th>
        <th>Capacity</th>
      </tr>
    </thead>
    <tbody>
     <%
       try{
    	   int EventId=0;
    	   Class.forName("com.mysql.jdbc.Driver");
    	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "123456"); // gets a new connection
    	 //Query for event id
    	   PreparedStatement ps = con.prepareStatement("SELECT event_id FROM event_management.event_tab where event_name=?;");
    	   ps.setString(1, "DataQuest");
    	   ResultSet rs1 = ps.executeQuery();
    	   if(rs1.next()){
    		    EventId = rs1.getInt("event_id");
    	    	  System.out.println(rs1.getInt("event_id"));
    	   }
    	  
    	   ps.close();
    	   //Query for info
    	   PreparedStatement ps1 = con.prepareStatement("SELECT * FROM event_management.slot where event_id=?;");
    	   ps1.setInt(1, EventId);
    	   ResultSet rs= ps1.executeQuery();
    	   int i=1;
    	   while(rs.next()){
    		   %>
    		   <tr style="background-color:black; color:white;">
    		     <td><%=i++%></td>
    		    <td><%=rs.getDate("event_date") %></td>
        		<td><%=rs.getTime("start_time") %> - <%=rs.getTime("end_time") %></td>
        		<td><%=rs.getInt("occupied") %></td>
        		<td><%=rs.getInt("capacity") %></td>
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

<!--  dextrous -->
<div id="Dextrous" class="tabcontent">
  
  <table class="table table-striped " >
    <thead class="thead-light">
      <tr>
        <th>Slot No.</th>
        <th>Slot Date</th>
        <th>Slot Time</th>
        <th>Occupied</th>
        <th>Capacity</th>
      </tr>
    </thead>
    <tbody>
     <%
       try{
    	   int EventId=0;
    	   Class.forName("com.mysql.jdbc.Driver");
    	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "123456"); // gets a new connection
    	 //Query for event id
    	   PreparedStatement ps = con.prepareStatement("SELECT event_id FROM event_management.event_tab where event_name=?;");
    	   ps.setString(1, "Dextrous");
    	   ResultSet rs1 = ps.executeQuery();
    	   if(rs1.next()){
    		    EventId = rs1.getInt("event_id");
    	    	  System.out.println(rs1.getInt("event_id"));
    	   }
    	  
    	   ps.close();
    	   //Query for info
    	   PreparedStatement ps1 = con.prepareStatement("SELECT * FROM event_management.slot where event_id=?;");
    	   ps1.setInt(1, EventId);
    	   ResultSet rs= ps1.executeQuery();
    	   int i=1;
    	   while(rs.next()){
    		   %>
    		   <tr style="background-color:black; color:white;">
    		     <td><%=i++%></td>
    		    <td><%=rs.getDate("event_date") %></td>
        		<td><%=rs.getTime("start_time") %> - <%=rs.getTime("end_time") %></td>
        		<td><%=rs.getInt("occupied") %></td>
        		<td><%=rs.getInt("capacity") %></td>
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
<!--  photoshop royale -->
<div id="PhotoshopRoyale" class="tabcontent">
 
  <table class="table table-striped " >
    <thead class="thead-light">
      <tr>
        <th>Slot No.</th>
        <th>Slot Date</th>
        <th>Slot Time</th>
        <th>Occupied</th>
        <th>Capacity</th>
      </tr>
    </thead>
    <tbody>
     <%
       try{
    	   int EventId=0;
    	   Class.forName("com.mysql.jdbc.Driver");
    	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "123456"); // gets a new connection
    	 //Query for event id
    	   PreparedStatement ps = con.prepareStatement("SELECT event_id FROM event_management.event_tab where event_name=?;");
    	   ps.setString(1, "PhotoshopRoyale");
    	   ResultSet rs1 = ps.executeQuery();
    	   if(rs1.next()){
    		    EventId = rs1.getInt("event_id");
    	    	  System.out.println(rs1.getInt("event_id"));
    	   }
    	  
    	   ps.close();
    	   //Query for info
    	   PreparedStatement ps1 = con.prepareStatement("SELECT * FROM event_management.slot where event_id=?;");
    	   ps1.setInt(1, EventId);
    	   ResultSet rs= ps1.executeQuery();
    	   int i=1;
    	   while(rs.next()){
    		   %>
    		   <tr style="background-color:black; color:white;">
    		     <td><%=i++%></td>
    		    <td><%=rs.getDate("event_date") %></td>
        		<td><%=rs.getTime("start_time") %> - <%=rs.getTime("end_time") %></td>
        		<td><%=rs.getInt("occupied") %></td>
        		<td><%=rs.getInt("capacity") %></td>
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
<!--  insights -->
<div id="Insights" class="tabcontent">
 
  <table class="table table-striped " >
    <thead class="thead-light">
      <tr>
        <th>Slot No.</th>
        <th>Slot Date</th>
        <th>Slot Time</th>
        <th>Occupied</th>
        <th>Capacity</th>
      </tr>
    </thead>
    <tbody>
      <%
       try{
    	   int EventId=0;
    	   Class.forName("com.mysql.jdbc.Driver");
    	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "123456"); // gets a new connection
    	 //Query for event id
    	   PreparedStatement ps = con.prepareStatement("SELECT event_id FROM event_management.event_tab where event_name=?;");
    	   ps.setString(1, "Insight");
    	   ResultSet rs1 = ps.executeQuery();
    	   if(rs1.next()){
    		    EventId = rs1.getInt("event_id");
    	    	  System.out.println(rs1.getInt("event_id"));
    	   }
    	  
    	   ps.close();
    	   //Query for info
    	   PreparedStatement ps1 = con.prepareStatement("SELECT * FROM event_management.slot where event_id=?;");
    	   ps1.setInt(1, EventId);
    	   ResultSet rs= ps1.executeQuery();
    	   int i=1;
    	   while(rs.next()){
    		   %>
    		   <tr style="background-color:black; color:white;">
    		     <td><%=i++%></td>
    		    <td><%=rs.getDate("event_date") %></td>
        		<td><%=rs.getTime("start_time") %> - <%=rs.getTime("end_time") %></td>
        		<td><%=rs.getInt("occupied") %></td>
        		<td><%=rs.getInt("capacity") %></td>
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
