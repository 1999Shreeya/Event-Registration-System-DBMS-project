<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Participant Register</title>
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
  min-height:850px;
  position:relative;
  background-color: black;

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
.sign-up-htm .group input[type="text"] {
  height: 10px;
}
.sign-up-htm .group input[type="password"] {
  height: 10px;
}

.hr{
  height:2px;
  margin:60px 0 50px 0;
  background:rgba(255,255,255,.2);
}
.foot-lnk{
  text-align:center;
  color:#fff;
}

input:focus {
  border-color: red;
}

input:valid {
  border-color: green;
}

</style>

</head>
<body>



<div class="container">
<div class="login-wrap">
  <div class="login-html">
    <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
    <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
    <div class="login-form">
    <form name="2" action="LoginControllerPart" method="post">
      <div class="sign-in-htm">
        <div class="group">
          <label for="username" class="label">Username</label>
          <input name="username" type="text" class="input">
        </div>
        <div class="group">
          <label for="pass" class="label">Password</label>
          <input name="pass" type="password" class="input" data-type="password">
        </div>
        <div style="color: #FF0000;">${error_msg}</div><br>
        <div class="group">
          <input id="check" type="checkbox" class="check" checked>
          <label for="check"><span class="icon"></span> Keep me Signed in</label>
        </div>
        <div class="group">
          <input type="submit" class="button" value="Sign In">
        </div>
        <div class="hr"></div>
        <div class="foot-lnk">
          Not registered yet? <a href="register.jsp#tab-2">Sign Up</a>
        </div>
      </div>
      </form>
      <form name ="1" action="RegistrationController" method="post">
      <div class="sign-up-htm">
        <div class="group">
          <label for="name" class="label">Name</label>
          <input name="name" type="text" class="input" value="xyz" pattern="[a-zA-Z ]{3,}" autocomplete="off" required>
        </div>
        <div class="group">
          <label for="email" class="label">Email Address</label>
          <input name="email" type="text" class="input" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" autocomplete="off" required>
        </div>
        <div class="group">
          <label for="mobile" class="label">Mobile No.</label>
          <input name="mobile" type="text" class="input" pattern="[0-9]{10}" maxlength="10" autocomplete="off" required>
        </div>
        <div class="group">
          <label for="username" class="label">Username</label>
          <input name="username" type="text" class="input" pattern="[a-zA-Z0-9]{8,15}" autocomplete="off" required>
        </div>
        <div class="group">
          <label for="pass" class="label">Password</label>
          <input name="pass" type="password" class="input" data-type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" autocomplete="off" required>
        </div>
        <div class="group">
          <label for="category" class="label">Category <br><br>
          <input class="cat" type="radio" name="category" value="junior" checked> Junior &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input class="cat" type="radio" name="category" value="senior" required> Senior
          </label>
        </div>
        <div style="color: #FF0000;">${error_msg}</div><br>
        <div class="group">
          <input type="submit" class="button" value="Sign Up">
        </div>
        <div class="hr"></div>
          <div class="foot-lnk">
          	Already registered? <a href="register.jsp#tab-1">Sign In</a>
          </div>
      	</div>
      </form>
    </div>
  </div>
</div>
</div>
</body>
</html>
