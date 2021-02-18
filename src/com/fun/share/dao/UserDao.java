package com.fun.share.dao;
import java.sql.*;

import com.fun.share.entities.User;

public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	
	//method to save user
	
	public boolean saveUser(User user)

	{
		boolean f=false;
		try {
			
			
			PreparedStatement ps=con.prepareStatement("insert into user(name,email,password,gender,about) values(?,?,?,?,?)");
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getAbout());
			
			ps.executeUpdate();
				f=true;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public User getUserByEmailAndPassword(String email,String password)
	{
		User user=null;
		
		try {
			
		PreparedStatement ps=con.prepareStatement("select * from user where email=? and password=?");
		ps.setString(1, email);
		ps.setString(2, password);
		
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			user=new User();
			user.setId(rs.getInt("id"));
			user.setName(rs.getString("name"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setGender(rs.getString("gender"));
			user.setAbout(rs.getString("about"));
			user.setDateTime(rs.getTimestamp("rdate"));
			user.setProfile(rs.getString("profile"));
		}
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return user;
	}

	
	public boolean updateUser(User user){
		
		boolean f=false;
		try {
			
			String q="update user set name=?,email=?,password=?,gender=?,about=?,profile=? where id=?";
			PreparedStatement p=con.prepareStatement(q);
			p.setString(1, user.getName());
			p.setString(2, user.getEmail());
			p.setString(3, user.getPassword());
			p.setString(4, user.getGender());
			p.setString(5, user.getAbout());
			p.setString(6, user.getProfile());
			p.setInt(7, user.getId());
			p.executeUpdate();
			f=true;
			
		} catch (Exception e) {
		e.printStackTrace();
		}
		return f;
	}
	
	
}
