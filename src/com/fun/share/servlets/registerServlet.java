package com.fun.share.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fun.share.dao.UserDao;
import com.fun.share.entities.User;
import com.fun.share.helper.ConnectionProvider;

@MultipartConfig
@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		String name=request.getParameter("uname");				
		String email=request.getParameter("uemail");
		String pass=request.getParameter("upass");
		String gen=request.getParameter("ugender");
		String about=request.getParameter("utext");
		
//		set data in user object
	User user=new User(name,email,pass,gen,about);
	
//	give this user object to userDAO for saving in database
	
	UserDao dao=new UserDao(ConnectionProvider.getConnection());
	boolean a=dao.saveUser(user);
	
	if(a){
		out.println("DONE");
	}else{
		out.println("ERROR");
	}
	
	}

}
