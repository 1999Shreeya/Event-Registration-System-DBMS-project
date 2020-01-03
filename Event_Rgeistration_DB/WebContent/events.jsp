<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">


<title>Events</title>
<style>
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

 body {
  background-image: url("4.jpg");
        background-repeat:no-repeat;
       background-size:cover;
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
  max-width: 960px;
  text-align: center;
}
div.card {
 opacity:0.85;
  display: inline-block;
  margin: 8px;
  max-width: 300px;
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
		response.sendRedirect("register.jsp");
%>

<nav class="navbar">
      <ul>
        <li><a href="events.jsp" style="font-size: 25px; color:#fff; margin-right: 23; font-weight: bold;">EVENT MASTER</a></li>
        <li class="menu"><a href="logout.jsp">Logout</a></li>
        <li class="menu"><a href="part_profile.jsp">My Profile</a></li>
        <li class="menu"><a href="registrations.jsp">Registrations</a></li>
      </ul>
    </nav>

<div class="cards">
<div class="card">
<img class="card__image" src="events\codebuddy.jpg" alt="wave" />
<div class="card-title">
<a href="#" class="toggle-info btn">
<span class="left"></span>
<span class="right"></span>
</a>
<h2>
Code Buddy

</h2>
</div>
<div class="card-flap flap1">
<div class="card-description">
This grid is an attempt to make something nice that works on touch devices. Ignoring hover states when they're not available etc.
</div>
<div class="card-flap flap2">
<div class="card-actions">
<a href="event_reg.jsp" class="btn" >Register</a>
</div>
</div>
</div>
</div>
<div class="card">
<img class="card__image" src="events\bugoff.jpg" alt="beach" />
<div class="card-title">
<a href="#" class="toggle-info btn">
<span class="left"></span>
<span class="right"></span>
</a>
<h2>
Bug off

</h2>
</div>
<div class="card-flap flap1">
<div class="card-description">
This grid is an attempt to make something nice that works on touch devices. Ignoring hover states when they're not available etc.
</div>
<div class="card-flap flap2">
<div class="card-actions">
<a href="event_reg.jsp" class="btn">Register</a>
</div>
</div>
</div>
</div>
<div class="card">
<img class="card__image" src="events\justcoding.jpg" />
<div class="card-title">
<a href="#" class="toggle-info btn">
<span class="left"></span>
<span class="right"></span>
</a>
<h2>
Just Coding

</h2>
</div>
<div class="card-flap flap1">
<div class="card-description">
This grid is an attempt to make something nice that works on touch devices. Ignoring hover states when they're not available etc.
</div>
<div class="card-flap flap2">
<div class="card-actions">
<a href="event_reg.jsp" class="btn">Register</a>
</div>
</div>
</div>
</div>
<div class="card">
<img class="card__image" src="events\webapp.jpg" alt="field" />
<div class="card-title">
<a href="#" class="toggle-info btn">
<span class="left"></span>
<span class="right"></span>
</a>
<h2>
Web App Dev

</h2>
</div>
<div class="card-flap flap1">
<div class="card-description">
This grid is an attempt to make something nice that works on touch devices. Ignoring hover states when they're not available etc.
</div>
<div class="card-flap flap2">
<div class="card-actions">
<a href="event_reg.jsp" class="btn">Register</a>
</div>
</div>
</div>
</div>
<div class="card">
<img class="card__image" src="events\dataquest.jpg" alt="water" />
<div class="card-title">
<a href="#" class="toggle-info btn">
<span class="left"></span>
<span class="right"></span>
</a>
<h2>
Data Quest

</h2>
</div>
<div class="card-flap flap1">
<div class="card-description">
This grid is an attempt to make something nice that works on touch devices. Ignoring hover states when they're not available etc.
</div>
<div class="card-flap flap2">
<div class="card-actions">
<a href="event_reg.jsp" class="btn">Register</a>
</div>
</div>
</div>
</div>
<div class="card">
<img class="card__image" src="events\dextrous.jpg" alt="river" />
<div class="card-title">
<a href="#" class="toggle-info btn">
<span class="left"></span>
<span class="right"></span>
</a>
<h2>
Dextrous

</h2>
</div>
<div class="card-flap flap1">
<div class="card-description">
This grid is an attempt to make something nice that works on touch devices. Ignoring hover states when they're not available etc.
</div>
<div class="card-flap flap2">
<div class="card-actions">
<a href="event_reg.jsp" class="btn">Register</a>
</div>
</div>
</div>
</div>
<div class="card">
<img class="card__image" src="events\codebuddy.jpg" alt="kite" />
<div class="card-title">
<a href="#" class="toggle-info btn">
<span class="left"></span>
<span class="right"></span>
</a>
<h2>
Photoshop Royale
</h2>
</div>
<div class="card-flap flap1">
<div class="card-description">
This grid is an attempt to make something nice that works on touch devices. Ignoring hover states when they're not available etc.
</div>
<div class="card-flap flap2">
<div class="card-actions">
<a href="event_reg.jsp" class="btn">Register</a>
</div>
</div>
</div>
</div>
<div class="card">
<img class="card__image" src="events\codebuddy.jpg" alt="underwater" />
<div class="card-title">
<a href="#" class="toggle-info btn">
<span class="left"></span>
<span class="right"></span>
</a>
<h2>
Insight

</h2>
</div>
<div class="card-flap flap1">
<div class="card-description">
This grid is an attempt to make something nice that works on touch devices. Ignoring hover states when they're not available etc.
</div>
<div class="card-flap flap2">
<div class="card-actions">
<a href="event_reg.jsp" class="btn">Register</a>
</div>
</div>
</div>
</div>

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

<script type="text/javascript" src="event_reg.js"></script>
</body>
</html>
