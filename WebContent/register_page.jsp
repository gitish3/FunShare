<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css" />

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<!--  navbar -->
<%@include file="navbar.jsp" %>

<body style="background-image: linear-gradient(to top, #c71d6f 0%, #d09693 100%);">


<div class="container">
<div class="card" style="background-image: linear-gradient(to right, #92fe9d 0%, #00c9ff 100%);">
<div class="card-body mx-auto" style="margin-top:170px;">
<h4 class="card-title mt-3 text-center">Create Account</h4>
<p class="text-center">Hope you'll <i>ENJOY</i> with us</p>

<a href="#" class="btn btn-block btn-danger"><i class="fa fa-google"></i> SIGN UP by Google</a>
<a href="#" class="btn btn-block btn-primary"><i class="fa fa-facebook"></i> SIGN UP by Facebook</a>
<hr>
<p class="text-center mt-3">OR</p>
<hr>
<!-- FORM -->
<form  id="reg-form" action="registerServlet" method="post">
 
 
 <!-- NAME -->
 <div class="form-group input-group">
 
 <div class="input-group-prepend">
 <span class="input-group-text"><i class="fa fa-user"></i></span>
 </div>
 <input type="text" class="form-control" name="uname" placeholder="Enter Name" />
 
 </div>
 
 <!-- EMAIL -->
 <div class="form-group input-group">
 
 <div class="input-group-prepend">
 <span class="input-group-text"><i class="fa fa-envelope"></i></span>
 </div>
 <input type="email" class="form-control" name="uemail" placeholder="Enter Email" />
 
 </div>


<div class="form-group input-group">
 
 <div class="input-group-prepend">
 <span class="input-group-text"><i class="fa fa-lock"></i></span>
 </div>
 <input type="password" class="form-control" name="upass" placeholder="Enter Password" />
 
 </div>
 
 
 <div class="form-group input-group">
 
 <div class="input-group-prepend">
 <span class="input-group-text"><i class="fa fa-venus"></i></span>
 </div>
<select name="ugender" class="form-control">
<option selected disabled>Gender</option>
<option>Male</option>
<option>Female</option>
<option>Prefer not to say</option>
</select>
</div>


<div class="form-group input-group">
 
 <div class="input-group-prepend">
 <span class="input-group-text"><i class="fa fa-align-right"></i></span>
 </div>
 <textarea rows="3" cols="50" placeholder="Write something about yourself"  name="utext" class="form-control"></textarea>
 
 </div>


<div class="container text-center" id="loader" style="display:none;">
<span class="fa fa-refresh fa-spin fa-4x"></span>
<h4>Please Wait...</h4>
</div>

<button type="submit" class="btn btn-block btn-success" id="sub-btn">SIGNUP</button>
<p class="text-center mt-3">Have an account ? <a href="login_page.jsp">LogIn</a></p>
</form>

</div>
</div>
</div>








<!-- jQuery and javaScript --> 
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<script>

$(document).ready(function(){
	console.log("loaded....!")

    $('#reg-form').on('submit', function(event){
    	event.preventDefault();
    	
    	$("#loader").show();
    	$("#sub-btn").hide();
    	
        
    	let form=new FormData(this);
    	console.log(form)
    	
    	//sending to registerServlet by AJAX
    
    	$.ajax({
    		
    		url: "registerServlet",
    		type:'POST',
    		data: form,
    		success: function(data, textStatus,jqXHR){
    			console.log(data)
    			$("#loader").hide();
    	    	$("#sub-btn").show();
    	    	if(data.trim() === 'DONE'){
    	    	
    	    	swal("Registered Successfully! Redirecting to Login page.")
    	    	.then((value) => {
    	    	 window.location="login_page.jsp"
    	    	});
    	    	}else{
    	    		swal(data)
    	    	}
    		},
    		error: function(jqXHR, textStatus, errorThrown){
    			$("#loader").hide();
    	    	$("#sub-btn").show();
    
    			swal("Something went wrong !")
    	    	
    		},
    		processData: false,
    		contentType: false
    		
    	})
    	
    })
})


</script>



</body>
</html>