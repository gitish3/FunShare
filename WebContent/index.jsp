<%@page import="com.fun.share.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css" />

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<!--  navbar -->
<%@include file="navbar.jsp" %>


<body style="font-family: 'Nunito', sans-serif;">


<!-- header -->
<header class="header" style="background:url(img/wall.jpg); background-size: cover; background-position: fixed">
<div class="container h-100">
<div class="row h-100 align-items-center">
<div class="col-md-6 offset-md-3 text-center">
<h1>Welcome to FUN SHARE</h1>
<h4>Hope you'll <i>ENJOY</i> with us</h4>
<h3><i>" Our whole thing is to entertain, make people laugh and to forget about the real world for awhile. "</i></h3>
<br><br>
<a href="register_page.jsp" class="btn btn-outline-danger text-white btn-lg py-3"><b>SIGNUP</b></a>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<a href="login_page.jsp" class="btn btn-outline-danger text-white btn-lg py-3"><b>LOGIN</b></a>
</div>
</div>
</div>

</header>


<!-- Message section -->

<section class="message" id="message_sec">
<div class="container text-center py-5">
<h1>About</h1>
<h1>"All work and no play makes Jack a dull boy"</h1>
<h3>We've got what you need.</h3>
<p>Entertainment is a form of activity that holds the attention and interest of an audience or gives pleasure and delight. It can be an idea or a task, but is more likely to be one of the activities or events that have developed over thousands of years specifically for the purpose of keeping an audience's attention.</p>
</div>

</section>


<!-- services section -->
<section class="services" id="services_sec">
<div class="container text-center py-5">
<h1>Our Services</h1>

<div class="row">
<div class="col-md-4">

<div class="card">
<div class="card-body">
<i class="fa fa-gamepad" style="font-size:60px;"></i><br>
<h1 class="py-3">GAMES</h1>
<p>Games is an ancient form of entertainment that has influenced almost all other forms. It is "not only entertainment, it is also thinking through human conflicts and contradictions". They are also presented as entertainment.</p>
<a href="games.jsp" class="btn btn-danger">Play Games</a>
</div>
</div>

</div>    

<div class="col-md-4">

<div class="card">
<div class="card-body">
<i class="fa fa-comments-o" style="font-size:60px;"></i><br>
<h1 class="py-3">Social Media</h1>
<p>Social Media facilitates the sharing of ideas, thoughts, and information through the building of virtual networks and communities. It helps us to find people with like interests, and share our thought, feelings, insight, and emotions.</p>
<a href="profile.jsp" class="btn btn-danger">Social Media</a>
</div>
</div>

</div>

<div class="col-md-4">

<div class="card">
<div class="card-body">
<i class="fa fa-newspaper-o" style="font-size:60px;"></i><br>
<h1 class="py-3">NEWS</h1>
<p>News is information about current events. This may be provided through many different media: word of mouth, printing, postal systems, broadcasting, electronic communication, or through the testimony of observers and witnesses to events.</p>
<a href="news.jsp" class="btn btn-danger">Read News</a>
</div>
</div>
</div>


</div>
</div>
</section>

<section class="contact" id="contact_sec">
<div class="container text-center py-5">
<h1>Let's Get in Touch !</h1>
<p>
Would you like to know more about our services or our teams? Are you curious about our policies and procedures? Would you like to touch base and have your needs analysed by one of our experts?
</p>
<i class="fa fa-phone text-warning" style="font-size:60px;"></i>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<i class="fa fa-heart text-danger" style="font-size:60px;"></i>
<br><br>
<p>+91 8054067823</p>
<p>gitishbhusri@gmail.com</p>
</div>

</section>

<!--  LINKS -->
<section class="py-5" id="links_sec">
<div class="container text-center">
<h1>Our Handles</h1>
<h3>Social Media</h3>
<div class="row">
<div class="col md-6">
<h3>Facebook</h3>

<h3>Instagram</h3>

<h3>Google</h3>
</div>

<div class="col md-6">
<h3>LinkedIn</h3>
<h3>GitHub</h3>
<h3>Twitter</h3>
</div>

</div>

</div>

</section>



<!-- FOOTER -->

<section class="footer bg-dark">
<div class="container py-5 text-white text-center">
<h5>Copyright * 2020 - GITISH BHUSRI</h5>
</div>

</section>

<!-- jQuery and javaScript --> 
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>

</body>
</html>