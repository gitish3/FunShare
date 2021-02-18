<%@page import="com.fun.share.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.fun.share.helper.ConnectionProvider"%>
<%@page import="com.fun.share.dao.PostDao"%>

<div class="row">


<%
Thread.sleep(1000);
PostDao d=new PostDao(ConnectionProvider.getConnection());

int cid=Integer.parseInt(request.getParameter("cid"));

List<Post> posts=null;

if(cid == 0){
posts=d.getAllPosts();
}else{
	posts=d.getPostByCatId(cid);
}

if(posts.size() == 0)
{
	out.println("<h4 class='display-3 text-center'>No post in this category!</h4>");
	return;
}



for(Post p : posts){
	
%>

<div class="col-md-6 mt-2">
<div class="card">
   <img class="card-img-top" src="post_pics/<%= p.getpPic() %>" alt="Card-pic">

<div class="card-body">
<b><%= p.getpTitle() %></b>
<p><%= p.getpContent() %></p>
</div>

</div>
</div>

<%
}
%>
</div>