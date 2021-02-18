<%@page import="com.fun.share.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fun.share.helper.ConnectionProvider"%>
<%@page import="com.fun.share.dao.PostDao"%>
<%@page import="com.fun.share.entities.Message"%>
<%@page import="com.fun.share.entities.User"%>
<%@page errorPage="error_page.jsp"%>


<%
	User user = (User) session.getAttribute("currentUser");
	if (user == null) {
		response.sendRedirect("login_page.jsp");
	}
%>
 


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile Page</title>
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css" />

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>


<!-- NAVBAR -->
     
<nav class="navbar navbar-expand-lg navbar-dark navbar-fixed-top primary-background">
  <a class="navbar-brand " href="index.jsp"> <b>FUN SHARE</b></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto ">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="modal" data-target="#add-post-modal">Add Post <span class="sr-only">(current)</span></a>
      </li>
      
       </ul>
       
       <ul class="navbar-nav ml-auto ">
      
      <li class="nav-item">
        <a class="nav-link" data-toggle="modal" data-target="#profile-modal" ><span class="fa fa-user-circle"></span> <%= user.getName() %></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="logoutServlet">LOGOUT</a>
      </li>
   </ul>
    
  </div>
</nav>

<!-- NAVBAR ENDSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS -->



<body>

<!--  MESSSSSSAGEEEEEEE -->
   
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


<!-- MAIN BODY OF THE PAGEEEEEEEEEEEEEEEEEE -->


<div class="container">
<div class="row mt-4">

<div class="col-md-4">

<!-- CATEGORIESSSSSSSSSSSSSSSSSSSS -->

<div class="list-group">
  <a href="#" onclick="getPosts(0,this)" class="cat-link list-group-item list-group-item-action active">
    All Posts
  </a>
  
  <%
  PostDao dao=new PostDao(ConnectionProvider.getConnection());
  ArrayList<Category> list1=dao.getAllCategories();
  for(Category cc : list1)
  {

	  %>
	  <a href="#" onclick="getPosts(<%= cc.getCid() %>,this)" class="cat-link list-group-item list-group-item-action"> <%= cc.getName() %> </a>

<%
	  
  }
  %>
  
  
 </div>

</div>

<div class="col-md-8">

<!-- POSTSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS -->

<div class="container text-center" id="loader">
<i class="fa fa-refresh fa-4x fa-spin"></i>
<h3 class="mt-2">Loading...</h3>
</div>

<div class="cobtainer-fluid" id="post-container">

</div>

</div>

</div>
</div>









<!-- END OF MAIN BODYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY -->




<!-- MODAL startssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss-->



<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
        
        	<h5 class="modal-title text-center" >FUN SHARE</h5>
        
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
     
       <img src="pics/<%=user.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width:150px;">
        <br>
        <h5 class="modal-title text-center mt-3" id="exampleModalLabel"> <%=user.getName() %> </h5>
       
       <!-- DETAILSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS -->
       
       
       <div id="profile-details">
       <table class="table">
  
  <tbody>
    <tr>
      <th scope="row">ID :</th>
      <td> <%= user.getId() %>  </td>
    </tr>
    <tr>
      <th scope="row">EMAIL :</th>
      <td> <%= user.getEmail() %>  </td>
    </tr>
    <tr>
      <th scope="row">GENDER :</th>
      <td> <%= user.getGender() %>  </td>
    </tr>
    <tr>
      <th scope="row">ABOUT :</th>
      <td> <%= user.getAbout() %>  </td>
    </tr>
    <tr>
      <th scope="row">Registered on :</th>
      <td> <%= user.getDateTime().toString() %>  </td>
    </tr>   
  </tbody>
</table>
       </div>
       
       
       <!-- EDITTTTTTT DETAILSSSSSSSSSSSSSSSSSSSS -->
           <div id="profile-edit" style="display:none;">
       <h3 class="mt-3">Please Edit Carefully</h3>
      <form action="editServlet" method="post" enctype="multipart/form-data">
      
      <table class="table">
      <tr>
      <td>ID :</td>
      <td><%= user.getId() %></td>
      </tr>
      <tr>
      <td>Email :</td>
      <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"></td>
      </tr>
      <tr>
      <td>Name:</td>
      <td><input type="text" class="form-control" name="user_name" value="<%= user.getName() %>"></td>
      </tr>
      <tr>
      <td>Password :</td>
      <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>"></td>
      </tr>
      <tr>
      <td>Gender :</td>
      <td><%= user.getGender().toUpperCase() %></td>
      </tr>
      <tr>
      <td>About :</td>
   <td> <textarea class="form-control" name="user_about">
    <%=user.getAbout() %>
    </textarea></td>
     </tr>
     
     <tr>
	<td>Profile picture :</td>
	<td><input type="file" class="form-control" name="image"></td>
	</tr>
     
      </table>
      
      	<div class="container">
   				<button type="submit" class="btn btn-outline-primary">Save</button>
       </div>
      </form> 
       
           </div>
         
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="profile-edit-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>

<!-- ADD POSTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT MODALLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL -->


<!-- Modal -->

<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
        <h5 class="modal-title" id="exampleModalLabel">Post Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
   
   <form id="add-post-form" action="AddPostServlet" method="post">
   
   <div class="form-group">
       <select class="form-control" name="cid">
           <option selected disabled>---Select Category---</option>
         <%
         PostDao pdao=new PostDao(ConnectionProvider.getConnection());
       ArrayList<Category> list = pdao.getAllCategories();
       
       for(Category c:list){  
         %>
         
           <option value="<%= c.getCid() %>"><%= c.getName() %></option>
         
         <%
       }
         
         %>
         
       </select>
   
   </div>
   
      <div class="form-group">
       <input type="text" name="pTitle" placeholder="Enter Post Title" class="form-control">
      </div>
   
   
     <div class="form-group">
       <textarea name="pContent" rows="5" class="form-control" placeholder="Enter Post Content"></textarea>
     </div>
   
      <div class="form-group">
         <label>Select your Pic :</label><br>
         <input type="file" name="pic">
      </div>
   <div class="container text-center" >
   <button type="submit" class="btn btn-outline-primary mt-3                               ">POST</button>
   
   </div>
   
   </form>
   
      </div>
     
    </div>
  </div>
</div>



<!-- END OF ADD POSTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT MODALLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL -->



<!-- jQuery and javaScript --> 
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src= "https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" ></script>
<script src="js/myjs.js" type="text/javascript"></script>

<script>

$(document).ready(function(){
	let editStatus=false;
	
	$('#profile-edit-button').click(function(){
		
		if(editStatus==false){
	    
			$("#profile-details").hide()
			$("#profile-edit").show()
			$("#profile-edit-button").text("Back")
			editStatus=true;
			
		}else{
			
			$("#profile-details").show()
			$("#profile-edit").hide()
			$("#profile-edit-button").text("Edit")
			editStatus=false;
		}
		
	})
	
	
})

</script>

<!-- ADD_POST_SCRIPTTTTTTTTTTTTTTTTTTTTTTT -->

<script>
$(document).ready(function(e){
    
	$("#add-post-form").on("submit",function(event){
		
	event.preventDefault();
	console.log("SUBMIT BUTTON CLICKEDDD!!1")
	let form=new FormData(this)
	
	$.ajax({
		
		url: "AddPostServlet",
		type: 'POST',
		data: form,
		success: function(data, textStatus, jqXHR){
			console.log(data)
			if(data.trim() == 'DONE!!!'){
			swal("Posted Successfully !","DONE" , "success");
			}else{
				swal("Error !","Something went wrong" , "error");
			}
			
		},
		error: function(jqXHR, textStatus, errorThrown){
			swal("Error !","Something went wrong" , "error");
			
		},
		processData: false,
		contentType: false
	})
	
	})

})

</script>


<script>
<!-- LOADING POSTSSSSSSSSS FROM LOAD_POSTS.JSP -->
function getPosts(catId, temp){
	
	$("#loader").show();
	$("#post-container").hide();
	
	$(".cat-link").removeClass('active')
	
	$.ajax({
		url: "load_posts.jsp",
		data: {cid: catId},
		success: function(data, textStatus, jqXHR){
			console.log(data);

			$("#loader").hide();
			$("#post-container").show(),
			$("#post-container").html(data),
			$(temp).addClass('active')
		}
	})
}


$(document).ready(function(e){
	
	let allPostRef=$('.cat-link')[0]
	getPosts(0,allPostRef)
	
})
</script>

</body>
</html>