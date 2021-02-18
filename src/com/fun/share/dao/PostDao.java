package com.fun.share.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.fun.share.entities.Category;
import com.fun.share.entities.Post;
public class PostDao {

	 Connection con;
	 
	
	 public PostDao(Connection con) {
		this.con = con;
	}


	public ArrayList<Category> getAllCategories(){
		
		ArrayList<Category> list=new ArrayList<>();
		 try {
			Statement st=con.createStatement();
			 ResultSet rs=st.executeQuery("select * from categories");
			 while(rs.next())
			 {
				 int cid=rs.getInt("cid");
				 String name=rs.getString("name");
				 String des=rs.getString("description");
				 Category c=new Category(cid,name,des);
				 list.add(c);
			 }
		} catch (Exception e) {
		  e.printStackTrace();
		}
		 
		 return list;
		 
	 }
	
	public boolean savePost(Post p){
		
		boolean f=false;
		try {
		
			String q="insert into posts(pTitle,pContent,pPic,catId,userId) values(?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, p.getpTitle());
			ps.setString(2, p.getpContent());
			ps.setString(3, p.getpPic());
			ps.setInt(4, p.getCatId());
			ps.setInt(5, p.getUserId());
			
			ps.executeUpdate();
			f=true;
		} catch (Exception e) {
		e.printStackTrace();
		}
		
		
		
		return f;
	}

	
	public List<Post> getAllPosts(){
		
		List<Post> list=new ArrayList<>();
		
		try {
			
			PreparedStatement ps=con.prepareStatement("select * from posts order by pid desc");
			ResultSet set=ps.executeQuery();
			
			while(set.next()){
				
				int pid=set.getInt("pid");
				String pTitle=set.getString("pTitle");
				String pContent=set.getString("pContent");
				String pPic=set.getString("pPic");
				Timestamp pDate=set.getTimestamp("pDate");
				int catId=set.getInt("catId");
				int userId=set.getInt("userId");
				
				Post p=new Post(pid, pTitle, pContent, pPic, pDate, catId, userId);
				
				list.add(p);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public List<Post> getPostByCatId(int catId){
		
		List<Post> list=new ArrayList<>();
		
	try {
			
			PreparedStatement ps=con.prepareStatement("select * from posts where catId=?");
            ps.setInt(1, catId);
			ResultSet set=ps.executeQuery();
			
			while(set.next()){
				
				int pid=set.getInt("pid");
				String pTitle=set.getString("pTitle");
				String pContent=set.getString("pContent");
				String pPic=set.getString("pPic");
				Timestamp pDate=set.getTimestamp("pDate");
			
				int userId=set.getInt("userId");
				
				Post p=new Post(pid, pTitle, pContent, pPic, pDate, catId, userId);
				
				list.add(p);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
}
