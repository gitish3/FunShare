package com.fun.share.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.fun.share.dao.PostDao;
import com.fun.share.entities.Post;
import com.fun.share.entities.User;
import com.fun.share.helper.ConnectionProvider;
import com.fun.share.helper.Helper;


@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out=response.getWriter();
		
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("currentUser");
		
		int cid=Integer.parseInt(request.getParameter("cid"));
		String pTitle=request.getParameter("pTitle");
		String pContent=request.getParameter("pContent");
		Part part=request.getPart("pic");

	Post p=new Post(pTitle, pContent, part.getSubmittedFileName(), null, cid, user.getId());
	PostDao dao=new PostDao(ConnectionProvider.getConnection());
	if(dao.savePost(p))
	{
		String path=request.getRealPath("/")+"post_pics"+File.separator+part.getSubmittedFileName();
		Helper.saveFile(part.getInputStream(), path);
		
	//	out.println(path);
		out.println("DONE!!!");
	}else{
		out.println("ERRRRRRROR!!!");
	}
	
	}

}
