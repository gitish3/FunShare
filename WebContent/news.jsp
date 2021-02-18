<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="Pojos.Articles"%>
<%@page import="Pojos.News"%>


<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.ProtocolException"%>
<%@page import="java.net.MalformedURLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.net.HttpURLConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>News Area</title>
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css" />

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>


<!--  navbar -->
<%@include file="navbar.jsp" %>

<body style="background: linear-gradient(to right, #ff6e7f, #bfe9ff);">


<div class="container text-center py-5">
<h1 style="margin-top:140px;">We keep you updated with Latest News!</h1>
<hr>
</div>

<%!
private static HttpURLConnection connection;
BufferedReader reader;
String line="";

Object o;

int q=1;

%>


<%

try{

URL url=new URL("http://newsapi.org/v2/top-headlines?country=in&apiKey=1201bb04f8bb4f0db894f7b8349d08dd");

connection=(HttpURLConnection)url.openConnection();
System.out.println(connection);
System.out.println("qwertyqwerty");


int status = connection.getResponseCode();
System.out.println(status);


StringBuffer responseContent = new StringBuffer();
System.out.println("11111111111111111");
if(status == HttpURLConnection.HTTP_OK){

	System.out.println("222222222222222");
	reader=new BufferedReader(new InputStreamReader(connection.getInputStream()));
	System.out.println("3333333333333333");
	while((line=reader.readLine()) != null){
		responseContent.append(line);
		System.out.println("while");
		
	}
	reader.close();
	
	System.out.println("4444444444444");
}else{
	/* reader=new BufferedReader(new InputStreamReader(connection.getInputStream()));
	while((line=reader.readLine()) != null){
		
		responseContent=responseContent+line;
	}
	reader.close(); */
	System.out.println("NOT WORKEDDDDDDDDDDD");		
}

	System.out.println("heyheyheyheyeheyeheyeheyeheyehey");
	System.out.println(responseContent);


//Gson son=new Gson();
Gson son=new GsonBuilder().setLenient().create();


News obj=son.fromJson(responseContent.toString(), News.class);


System.out.println(obj.getStatus());

final Articles Arti[];

Arti=obj.getArticles();

	 for(Articles obb : Arti){
		 
		 
		  %>
<div class="container text-center mt-5">

<div class="card">
    <div class="card-header">
     <img src=<%=  obb.getUrlToImage() %> alt="IMAGE" style="height:300px;width:600px;" class="img-fluid">
      <h2 class="mb-0">
        <button class="btn btn-outline-danger btn-block text-center mt-3" type="button">
    <b>BREAKING NEWS <%=q %> : </b>     <%= obb.getTitle() %> 
     
        </button>
      </h2>
    </div>

     <div class="card-body">
      
     <%= obb.getContent()%><a href="<%=obb.getUrl() %>" target="_blank">   Read More Here...</a>
  
        </div>
    <p class="text-right text-muted">Published at : <%= obb.getPublishedAt() %></p>
  </div>
</div>


<%

q++;        

}

	 connection.disconnect();
}catch(Exception e){e.printStackTrace();}
%>

</body> 
</html>