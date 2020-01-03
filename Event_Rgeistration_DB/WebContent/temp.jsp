<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" 
    %>
<%@page import ="java.sql.*" %>
<%@page import ="java.sql.Connection" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>

    body {
  background-color:black;
        background-repeat:no-repeat;
       background-size:cover;
} 
  .fakeimg {
    height: 200px;
    background: #aaa;
  }

  /* Stackoverflow preview fix, please ignore */
    .navbar-nav {
      flex-direction: row;
    }
    
    .nav-link {
      padding-right: .5rem !important;
      padding-left: .5rem !important;
  
    }
    


.navbar {
  width: 100%;
  background-color: #555;
  overflow: auto;
}

.navbar a:hover {
  background-color: #000;
  color:white;
}

 .main-img{
  background-image: url("titleback1.jpg");
  background-color: #cccccc;
  height: 500px;
  background-repeat: no-repeat;
  position: relative;
}
.btn-group button {
  color:white;
  margin:20px;
  padding: 10px 24px; /* Some padding */
  cursor: pointer; /* Pointer/hand icon */
  float: left; /* Float the buttons side by side */
}

/* Clear floats (clearfix hack) */
.btn-group:after {
  content: "";
  clear: both;
  display: table;
}

.btn-group button:not(:last-child) {
  border-right: none; /* Prevent double borders */
}

/* Add a background color on hover */
.btn-group button:hover {
  background-color: black;
  color:white;
}

.nav-item{
  padding:0 0px;
}

  @font-face {
  font-family: 'Source Sans Pro';
  font-style: normal;
  font-weight: 200;
  src: local('Source Sans Pro ExtraLight'), local('SourceSansPro-ExtraLight'), url(https://fonts.gstatic.com/s/sourcesanspro/v13/6xKydSBYKcSV-LCoeQqfX1RYOo3i94_wlxdr.ttf) format('truetype');
}
@font-face {
  font-family: 'Source Sans Pro';
  font-style: normal;
  font-weight: 300;
  src: local('Source Sans Pro Light'), local('SourceSansPro-Light'), url(https://fonts.gstatic.com/s/sourcesanspro/v13/6xKydSBYKcSV-LCoeQqfX1RYOo3ik4zwlxdr.ttf) format('truetype');
}
@font-face {
  font-family: 'Source Sans Pro';
  font-style: normal;
  font-weight: 400;
  src: local('Source Sans Pro Regular'), local('SourceSansPro-Regular'), url(https://fonts.gstatic.com/s/sourcesanspro/v13/6xK3dSBYKcSV-LCoeQqfX1RYOo3qOK7g.ttf) format('truetype');
}
@font-face {
  font-family: 'Source Sans Pro';
  font-style: normal;
  font-weight: 600;
  src: local('Source Sans Pro SemiBold'), local('SourceSansPro-SemiBold'), url(https://fonts.gstatic.com/s/sourcesanspro/v13/6xKydSBYKcSV-LCoeQqfX1RYOo3i54rwlxdr.ttf) format('truetype');
}
@font-face {
  font-family: 'Source Sans Pro';
  font-style: normal;
  font-weight: 700;
  src: local('Source Sans Pro Bold'), local('SourceSansPro-Bold'), url(https://fonts.gstatic.com/s/sourcesanspro/v13/6xKydSBYKcSV-LCoeQqfX1RYOo3ig4vwlxdr.ttf) format('truetype');
}
@font-face {
  font-family: 'Source Sans Pro';
  font-style: normal;
  font-weight: 900;
  src: local('Source Sans Pro Black'), local('SourceSansPro-Black'), url(https://fonts.gstatic.com/s/sourcesanspro/v13/6xKydSBYKcSV-LCoeQqfX1RYOo3iu4nwlxdr.ttf) format('truetype');
}

 
a.btn {
  background: #0096a0;
  border-radius: 4px;
  box-shadow: 0 2px 0px 0 rgba(0, 0, 0, 0.25);
  color: #ffffff;
  display: inline-block;
  padding: 6px 30px 8px;
  position: relative;
  text-decoration: none;
  transition: all 0.1s 0s ease-out;
}
.no-touch a.btn:hover {
  background: #00a2ad;
  box-shadow: 0px 8px 2px 0 rgba(0, 0, 0, 0.075);
  -webkit-transform: translateY(-2px);
          transform: translateY(-2px);
  transition: all 0.25s 0s ease-out;
}
.no-touch a.btn:active,
a.btn:active {
  background: #008a93;
  box-shadow: 0 1px 0px 0 rgba(255, 255, 255, 0.25);
  -webkit-transform: translate3d(0, 1px, 0);
          transform: translate3d(0, 1px, 0);
  transition: all 0.025s 0s ease-out;
}
div.cards {
  margin: 50px auto;
  background-color: 
  max-width: 1000px;
  text-align: center;
}
div.card {
 opacity:0.85;
  display: inline-block;
  margin: 8px;
  max-width: 800px;
  -webkit-perspective: 1000;
          perspective: 1000;
  position: relative;
  text-align: left;
  transition: all 0.3s 0s ease-in;
  z-index: 1;

}
div.card img {
  max-width: 300px;
}
div.card div.card-title {
  background: #ffffff;
  padding: 6px 15px 10px;
  position: relative;
  z-index: 0;
}
div.card div.card-title a.toggle-info {
  border-radius: 32px;
  height: 32px;
  padding: 0;
  position: absolute;
  right: 15px;
  top: 10px;
  width: 32px;
}
div.card div.card-title a.toggle-info span {
  background: #ffffff;
  display: block;
  height: 2px;
  position: absolute;
  top: 16px;
  transition: all 0.15s 0s ease-out;
  width: 12px;
}
div.card div.card-title a.toggle-info span.left {
  right: 14px;
  -webkit-transform: rotate(45deg);
          transform: rotate(45deg);
}
div.card div.card-title a.toggle-info span.right {
  left: 14px;
  -webkit-transform: rotate(-45deg);
          transform: rotate(-45deg);
}
div.card div.card-title h2 {
  font-size: 24px;
  font-weight: 700;
  letter-spacing: -0.05em;
  margin: 0;
  padding: 0;
}
div.card div.card-title h2 small {
  display: block;
  font-size: 18px;
  font-weight: 600;
  letter-spacing: -0.025em;
}
div.card div.card-description {
  padding: 0 15px 10px;
  position: relative;
  font-size: 14px;
}
div.card div.card-actions {
  box-shadow: 0 2px 0px 0 rgba(0, 0, 0, 0.075);
  padding: 10px 15px 20px;
  text-align: center;
}
div.card div.card-flap {
  background: #d9d9d9;
  position: absolute;
  width: 100%;
  border:white;
  -webkit-transform-origin: top;
          transform-origin: top;
  -webkit-transform: rotateX(-90deg);
          transform: rotateX(-90deg);
}
div.card div.flap1 {
  transition: all 0.3s 0.3s ease-out;
  z-index: -1;
}
div.card div.flap2 {
  transition: all 0.3s 0s ease-out;
  z-index: -2;
}
div.cards.showing div.card {
  cursor: pointer;
  opacity: 0.6;
  -webkit-transform: scale(0.88);
          transform: scale(0.88);
}
.no-touch div.cards.showing div.card:hover {
  opacity: 0.94;
  -webkit-transform: scale(0.92);
          transform: scale(0.92);
}
div.card.show {
  opacity: 1 !important;
  -webkit-transform: scale(1) !important;
          transform: scale(1) !important;
}
div.card.show div.card-title a.toggle-info {
  background: #ff6666 !important;
}
div.card.show div.card-title a.toggle-info span {
  top: 15px;
}
div.card.show div.card-title a.toggle-info span.left {
  right: 10px;
}
div.card.show div.card-title a.toggle-info span.right {
  left: 10px;
}
div.card.show div.card-flap {
  background: #ffffff;
  -webkit-transform: rotateX(0deg);
          transform: rotateX(0deg);
}
div.card.show div.flap1 {
  transition: all 0.3s 0s ease-out;
}
div.card.show div.flap2 {
  transition: all 0.3s 0.2s ease-out;
}

.hr {
    border-top: 3px solid white;
}
.nav-link{
  color:white;
}

  </style>


</head>

<body data-spy="scroll" data-target=".navbar" data-offset="50">

<div class="main-img">
  <div class="text-right px-3" style="padding:150px;">
    <div style="background-color:black; opacity:0.8; margin:100px 150px auto 900px;color:white; padding:20px;">
       <h1>Book My Event</h1>
  <h5>Turning ideas into action</h5> 
  <div class="hr"></div>
    </div>
 
</div>
</div>



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
         <a class="nav-link" href="register.jsp"><i class="fa fa-calendar" aria-hidden="true"></i>Sign Up</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#section3"><i class="fa fa-users" aria-hidden="true"></i>About Us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#section2"><i class="fa fa-fw fa-user"></i>Events</a>
      </li>    
    </ul>
  </div>  
  </div>
  
</nav>

<div class="container" style="margin-top:30px; opacity:0.8">
 <div id="section1" class="container-fluid " style="padding:1%;background-color: #c5c6c7">
   <div class="btn-group" style="width:100%">
  <button style="width:50%" class="btn btn-dark btn-lg" onclick="location.href='register.jsp'">Sign In as User</button>
  <button style="width:50%" class="btn btn-dark btn-lg" onclick="location.href='org_login.jsp'">Sign In as Admin</button>
</div>
</div>

<div id="section2" class="container-fluid" style="padding:3% 0%; background-image: url("eventback.jpg")" >
  <h1 style="color:white; padding:30px;" class="bg-transparent" align="center">Upcoming Events</h1>
	<div class="hr"></div>
	<div class="cards">
	
	<%
       try{
    	   Class.forName("com.mysql.jdbc.Driver");
    	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_reg", "root", "123456"); // gets a new connection
    	 //Query for event id
    	   PreparedStatement ps = con.prepareStatement("select * from event_tab where start_date > CURDATE();");
    	   ResultSet rs = ps.executeQuery();
    	   
    	   while(rs.next()){
    		   
    		   int eve_id = rs.getInt("event_id");
    		   session.setAttribute("event_id",eve_id);
    	   
     %>
     
<div class="card">
<img class="card__image" src="disp_img.jsp?event_id=<%=rs.getInt("event_id") %>>" alt="wave" />
<div class="card-title">
<a href="#" class="toggle-info btn">
<span class="left"></span>
<span class="right"></span>
</a>
<h2>
<%=rs.getString("event_name") %>
</h2>
</div>
<div class="card-flap flap1">
<div class="card-description">
Category : <%=rs.getString("category") %><br>
Date : <%=rs.getDate("s_date") %>
</div>
<div class="card-flap flap2">
<div class="card-actions">
</div>
</div>
</div>
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


</div>

<div class="jumbotron text-center" style="margin-bottom:0">
  <p>Footer</p>
</div>
<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script id="rendered-js">
      $(document).ready(function () {
  var zindex = 10;

  $("div.card").click(function (e) {
    e.preventDefault();

    var isShowing = false;

    if ($(this).hasClass("show")) {
      isShowing = true;
    }

    if ($("div.cards").hasClass("showing")) {
      // a card is already in view
      $("div.card.show").
      removeClass("show");

      if (isShowing) {
        // this card was showing - reset the grid
        $("div.cards").
        removeClass("showing");
      } else {
        // this card isn't showing - get in with it
        $(this).
        css({ zIndex: zindex }).
        addClass("show");

      }

      zindex++;

    } else {
      // no cards in view
      $("div.cards").
      addClass("showing");
      $(this).
      css({ zIndex: zindex }).
      addClass("show");

      zindex++;
    }

  });
});
      //# sourceURL=pen.js
      
    </script>

</body>
</html>
