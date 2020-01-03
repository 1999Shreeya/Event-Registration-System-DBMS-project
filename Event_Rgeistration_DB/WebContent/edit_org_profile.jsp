<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Edit Profile</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <style>
body {
  background-image: url("4.jpg");
        background-repeat:no-repeat;
       background-size:cover;
} 

*,:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:inherit;text-decoration:none}

.login-wrap{
  width:100%;
  margin:auto;
  max-width:525px;
  min-height:670px;
  position:relative;
  background-color: black;
  padding:100px  50px;
  box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
}
.login-html{
  width:100%;
  height:100%;
  position:absolute;
  padding:90px 70px 50px 70px;

}
.login-html .sign-in-htm,
.login-html .sign-up-htm{
  top:0;
  left:0;
  right:0;
  bottom:0;
  position:absolute;
  transform:rotateY(180deg);
  backface-visibility:hidden;
  transition:all .4s linear;
}
.login-html .sign-in,
.login-html .sign-up,
.login-form .group .check{
  display:none;
}
.login-html .tab,
.login-form .group .label,
.login-form .group .button{
  text-transform:uppercase;
}
.login-html .tab{
  font-size:22px;
  margin-right:15px;
  padding-bottom:5px;
  margin:0 20px 20px 0;
  display:inline-block;
  color:white;
  border-bottom:2px solid transparent;
}
.login-html .sign-in:checked + .tab,
.login-html .sign-up:checked + .tab{
  color:white;
  border-color:#1161ee;
}
.login-form{
  min-height:345px;
  position:relative;
  perspective:1000px;
  transform-style:preserve-3d;
}
.login-form .group{
  margin-bottom:15px;
}
.login-form .group .label,
.login-form .group .input,
.login-form .group .button{
  width:100%;
  color:#fff;
  display:block;
}
.login-form .group .input,
.login-form .group .button{
  border:none;
  padding:15px 20px;
  border-radius:25px;
  background:rgba(255,255,255,.1);
}
.login-form .group input[data-type="password"]{
  text-security:circle;
  -webkit-text-security:circle;
}
.login-form .group .label{
  color:white;
  font-size:12px;
}
.login-form .group .button{
  background:#1161ee;
}
.login-form .group label .icon{
  width:15px;
  height:15px;
  border-radius:2px;
  position:relative;
  display:inline-block;
  background:rgba(255,255,255,.1);
}
.login-form .group label .icon:before,
.login-form .group label .icon:after{
  content:'';
  width:10px;
  height:2px;
  background:white;
  position:absolute;
  transition:all .2s ease-in-out 0s;
}
.login-form .group label .icon:before{
  left:3px;
  width:5px;
  bottom:6px;
  transform:scale(0) rotate(0);
}
.login-form .group label .icon:after{
  top:6px;
  right:0;
  transform:scale(0) rotate(0);
}
.login-form .group .check:checked + label{
  color:#fff;
}
.login-form .group .check:checked + label .icon{
  background:#1161ee;
}
.login-form .group .check:checked + label .icon:before{
  transform:scale(1) rotate(45deg);
}
.login-form .group .check:checked + label .icon:after{
  transform:scale(1) rotate(-45deg);
}
.login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm{
  transform:rotate(0);
}
.login-html .sign-up:checked + .tab + .login-form .sign-up-htm{
  transform:rotate(0);
}

.group .cat {
text-decoration-color:#fff;
}

.hr{
  height:2px;
  margin:60px 0 30px 0;
  background:rgba(255,255,255,.2);
}
.foot-lnk{
  text-align:center;
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

<%
int id=0;
if(session.getAttribute("username")!=null) {
	id = (int)session.getAttribute("person_id");
}
try{
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_reg", "root", "123456");
	
	PreparedStatement ps = c.prepareStatement("select * from person s,organiser o where s.person_id = ? and s.person_id = o.person_id;");
	ps.setInt(1, id);
	ResultSet rs = ps.executeQuery();
	
	if(rs.next()) {
%>

<div class="container">
<div class="login-wrap">
   <h3 style="color:white">UPDATE PROFILE</h3>
   <hr style="border:2px solid white;">
   <form action="UpdateProfile2" method="post">
    <div class="login-form">
      <div class="sign-in-htm">
      	<div class="group">
          <label for="name" class="label">Name</label>
          <input name="name" type="text" class="input" value="<%=rs.getString("person_name")%>">
        </div>
        <div class="group">
          <label for="username" class="label">Username</label>
          <input name="username" type="text" class="input" value="<%=rs.getString("username")%>">
        </div>
       <div class="group">
          <label for="email" class="label">Email Address</label>
          <input name="email" type="text" class="input" value="<%=rs.getString("email")%>">
        </div>
        <div class="group">
          <label for="mobile" class="label">Mobile</label>
          <input name="mobile" type="text" class="input" value="<%=rs.getString("mobile")%>">
        </div>
        <div class="group">
          <label for="phone" class="label">Designation</label>
          <input name="designation" type="text" class="input" value="<%=rs.getString("role")%>">
        </div>
        <div class="group">
          <input type="submit" class="button" value="Update">
        </div>
        
       <div class="hr"></div>
        <div class="foot-lnk" style="color:white;">
          <a href="org_profile.jsp">Go to Profile page</a>
        </div>
  </div>
</div>
</form>
<% }
	ps.close();
	c.close();
	}catch (ClassNotFoundException | SQLException e) {
	    e.printStackTrace();
	}
%>
</body>
</html>
