package com.fun.share.servlets;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.fun.share.dao.UserDao;
import com.fun.share.entities.Message;
import com.fun.share.entities.User;
import com.fun.share.helper.ConnectionProvider;
import com.fun.share.helper.Helper;

@MultipartConfig
@WebServlet("/editServlet")
public class editServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	     String userEmail=request.getParameter("user_email");
	     String userName=request.getParameter("user_name");
	     String userPassword=request.getParameter("user_password");
	     String userAbout=request.getParameter("user_about");
	     Part part=request.getPart("image");
	     String imageName=part.getSubmittedFileName();
		
		HttpSession s=request.getSession();
		User user=(User) s.getAttribute("currentUser");
		user.setEmail(userEmail);
		user.setName(userName);
		user.setPassword(userPassword);
		user.setAbout(userAbout);
		String oldFile=user.getProfile();
		user.setProfile(imageName);
		//UPDATE IN DATABASESSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
		
		UserDao d=new UserDao(ConnectionProvider.getConnection());
		boolean ans=d.updateUser(user);
	
		if(ans){
			String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
			String OldFilePath=request.getRealPath("/")+"pics"+File.separator+oldFile;
			
			if(!oldFile.equals("default.png")){
				Helper.deleteFile(OldFilePath);
				}
			
			
				Helper.saveFile(part.getInputStream(), path);
			
			
					Message msg=new Message("Profile details updated!","success","alert-success");
					s.setAttribute("msg", msg);
				   
					
			
			
			
		}else{
		
			Message msg=new Message("Something went wrong!","error","alert-danger");
			s.setAttribute("msg", msg);
		
			
		}
	    response.sendRedirect("profile.jsp");
		
	
	}

}
