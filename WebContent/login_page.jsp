<%@page import="com.fun.share.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LOGIN PAGE</title>
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css" />

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<!--  navbar -->
<%@include file="navbar.jsp" %>

<body class="grad" >



<div class="container">
<div class="card" style="background-image: linear-gradient(to right, #b8cbb8 0%, #b8cbb8 0%, #b465da 0%, #cf6cc9 33%, #ee609c 66%, #ee609c 100%);">
<div class="card-body mx-auto" style="margin-top:200px;">
<h4 class="card-title mt-3 text-center">LOGIN</h4>
<p class="text-center">Welcome to <i>FUN SHARE</i></p>

<%
     
      Message m=(Message)session.getAttribute("msg");
      if(m!=null){
    	  
      %>
      <div class="alert <%=m.getCssClass() %>" role="alert">
      <%= m.getContent() %>
      </div>
      
      <%
      session.removeAttribute("msg");
      
      }
      
      
 



%>



<hr>
<form action="loginServlet" method="post">

<!-- EMAIL -->

<div class="form-group input-group">
 
 <div class="input-group-prepend">
 <span class="input-group-text"><i class="fa fa-envelope"></i></span>
 </div>
 <input type="email" required="required" class="form-control" name="uemail" placeholder="Enter Email" />
 
 </div>
 
 <!-- Password -->
<div class="form-group input-group">
 
 <div class="input-group-prepend">
 <span class="input-group-text"><i class="fa fa-lock"></i></span>
 </div>
 <input type="password" required="required" class="form-control" name="upass" placeholder="Enter Password" />
 
 </div>
 
<button type="submit" class="btn btn-block btn-success">LOGIN</button>
<p class="text-center mt-3">New to Fun Share ? <a href="register_page.jsp">SignUp</a></p>


</form>




</div>
</div>
</div>



<!-- jQuery and javaScript --> 
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>

</body>
</html>