<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">


<title>Events</title>
<style>
 body {
  background-image: url("4.jpg");
        background-repeat:no-repeat;
       background-size:cover;
} 



/*navbar

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: right;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}*/

nav.navbar {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
ul {
  width: 100%;
  height:60px;
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  /*background-color: ;*/
}

li {
  float: left;
}

li a {
  display: block;
  color: #000;
  text-align: center;
  text-decoration: none;
  letter-spacing: 1px;
  font-weight: bold;
  vertical-align:middle;
  text-align:center;
  margin-top: 13px;
  margin-bottom:10px;
  margin-right:20px;
  padding-left:10px;
  padding-right:10px;
}

li a:hover {
  background-color: ;
}

.menu {
  float:right;
  font-size: 17px;
}


  </style>
<script>
  window.console = window.console || function(t) {};
</script>
<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>
</head>
<body translate="no">

<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expire",0);
	
	if(session.getAttribute("username")==null)
		response.sendRedirect("org_login.jsp");
%>

<nav class="navbar">
      <ul>
        <li><a href="events.jsp" style="font-size: 25px; color:#fff; margin-right: 23; font-weight: bold;">EVENT MASTER</a></li>
        <li class="menu"><a href="logout2.jsp">Logout</a></li>
        <li class="menu"><a href="org_profile.jsp">My Profile</a></li>
       
         <li class="menu"><a href="slot_status.jsp">Slot Status</a></li>
      </ul>
    </nav>


</body>
</html>
