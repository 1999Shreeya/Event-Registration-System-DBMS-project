<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
  <title>Event Registration</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <style>
body {
  background-image: url("1.png");
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

.hr{
  height:2px;
  margin:60px 0 50px 0;
  background:rgba(255,255,255,.2);
}
.foot-lnk{
  text-align:center;
}



/*Styling Selectbox*/
.dropdown {

  display: block;
  background-color: #fff;
  border-radius: 5px;
  box-shadow: 0 0 2px rgb(204, 204, 204);
  transition: all .5s ease;
  position: relative;
  font-size: 14px;
  /*color: #474747;*/
  height: 100%;
  text-align: left
}
.dropdown .select {
    cursor: pointer;
    display: block;
    padding: 10px
}
.dropdown .select > i {
    font-size: 13px;
    color: #888;
    cursor: pointer;
    transition: all .3s ease-in-out;
    float: right;
    line-height: 15px
}
.dropdown:hover {
    box-shadow: 0 0 4px rgb(204, 204, 204)
}
.dropdown:active {
    background-color: #f8f8f8
}
.dropdown.active:hover,
.dropdown.active {
    box-shadow: 0 0 4px rgb(204, 204, 204);
    border-radius: 5px 5px 0 0;
    background-color: #f8f8f8
}
.dropdown.active .select > i {
    transform: rotate(-90deg)
}
.dropdown .dropdown-menu {
    position: absolute;
    background-color: #fff;
    width: 100%;
    left: 0;
    margin-top: 1px;
    box-shadow: 0 1px 2px rgb(204, 204, 204);
    border-radius: 0 1px 5px 5px;
    overflow: hidden;
    display: none;
    max-height: 130px;
    overflow-y: auto;
    z-index: 9
}
.dropdown .dropdown-menu li {
    padding: 10px;
    transition: all .2s ease-in-out;
    cursor: pointer
} 
.dropdown .dropdown-menu {
    padding: 0;
    list-style: none
}
.dropdown .dropdown-menu li:hover {
    background-color: #f2f2f2
}
.dropdown .dropdown-menu li:active {
    background-color: #e2e2e2
}


</style>

</head>
<body>




<div class="container">
<div class="login-wrap">
   <h3 style="color:white">EVENT REGISTRATION</h3>
   <hr>
   <form action="EventRegistration" method="post">
    <div class="login-form">
      <div class="sign-in-htm">
        <!-- event name -->
         <div class="group">
        <label for="event_name" class="label">Event Name</label>
        <select id="event_name" class="form-control" name="event_name" onchange="setCost()">
          <option value="CodeBuddy">Code Buddy</option>
          <option value="BugOff">Bug Off</option>
          <option value="CodeBuddy">Just Coding</option>
          <option value="WebAppDev">Web App Development</option>
          <option value="DataQuest">Data Quest</option>
          <option value="Dextrous">Dextrous</option>
          <option value="PhotoshopRoyale">PhotoShop Royale</option>
          <option value="Insight">Insight</option>
        </select>
      </div>
        </div>
        
       <div class="group">
       	<label for="price" class="label">Cost</label>
       	<input id="price" class="form-control" type="text" name="price" value="100" disabled>
       </div>
         
    <!-- slot 1 -->
     <div class="group">
        <label for="sel1" class="label">Date : 20/10/2019</label>
      	<select class="form-control" id="sel1" name="sellist1">
       		<option disabled selected value=""> -- select time slot -- </option>
       		<option value=""></option>
        	<option value="03:00:00">3 PM - 4 PM</option>
        	<option value="04:00:00">4 PM - 5 PM</option>
      	</select>
    </div>
    
    <!-- slot 2 -->
    <div class="group">
    	<h4 style="margin:20px 0px; text-align:center;color:white">OR</h4>
     	<label for="sel2" class="label">Date : 21/10/2019</label>
      	<select class="form-control" id="sel2" name="sellist2">
         	<option disabled selected value=""> -- select time slot -- </option>
         	<option value=""></option>
        	<option value="11:00:00">11 AM - 12 PM</option>
        	<option value="12:00:00">12 PM - 1 PM</option>
      	</select>
    </div>
    <div style="color: #FF0000;">${error_msg}</div><br>
        <div class="group">
          <input type="submit" style="margin-top:30px;"class="button" value="Register" onclick="slotcheck()">
        </div>
        <div class="hr"></div>
      </div>
</div>
</form>


<script type="text/javascript">
  /*Dropdown Menu*/
$('.dropdown').click(function () {
        $(this).attr('tabindex', 1).focus();
        $(this).toggleClass('active');
        $(this).find('.dropdown-menu').slideToggle(300);
    });
    $('.dropdown').focusout(function () {
        $(this).removeClass('active');
        $(this).find('.dropdown-menu').slideUp(300);
    });
    $('.dropdown .dropdown-menu li').click(function () {
        $(this).parents('.dropdown').find('span').text($(this).text());
        $(this).parents('.dropdown').find('input').attr('value', $(this).attr('id'));
    });
/*End Dropdown Menu*/


$('.dropdown-menu li').click(function () {
  var input = '<strong>' + $(this).parents('.dropdown').find('input').val() + '</strong>',
      msg = '<span class="msg">Hidden input value: ';
  $('.msg').html(msg + input + '</span>');
}); 

function setCost() {
	var x = document.getElementById("event_name").value;
	
	if ((x == "PhotoshopRoyale" ) || (x == "Insight")) {
		document.getElementById("price").value = "50";
	}
	else if((x == "Dextrous") || (x == "DataQuest")) {
		document.getElementById("price").value = "150";
	}
	else {
		document.getElementById("price").value = "100";
	}
}

function slotcheck(){

    var slot1 = document.getElementById("sel1").value;
    var slot2 = document.getElementById("sel2").value;
    
  if((slot1 == "" && slot2== "") || (slot1 != "" && slot2!="") ){

   
    window.alert("Please select only ONE timeslot.")
  }
}

</script>


<script type="text/javascript" src="event_reg.js"></script>

</body>
</html>
