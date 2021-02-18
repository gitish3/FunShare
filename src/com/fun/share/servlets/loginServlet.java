package com.fun.share.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fun.share.dao.UserDao;
import com.fun.share.entities.Message;
import com.fun.share.entities.User;
import com.fun.share.helper.ConnectionProvider;


@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		String email=request.getParameter("uemail");
		String password=request.getParameter("upass");
		
		//get User details
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		User user=dao.getUserByEmailAndPassword(email, password);
		
		if(user==null){
			//out.println("Invalid Details! Try again.");
		
			Message msg=new Message("Invalid Details! Try again.","error","alert-danger");
			HttpSession s=request.getSession();
			s.setAttribute("msg", msg);
			 
		  response.sendRedirect("login_page.jsp");
		
		}else{
			HttpSession s=request.getSession();
			s.setAttribute("currentUser", user);
			response.sendRedirect("profile.jsp");
		}
		
		
	}

}
