package com.fun.share.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

	private static Connection con=null;
	
	public static Connection getConnection() {
		
		try{
		
			if(con==null){
		 Class.forName("com.mysql.jdbc.Driver");
	     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/FunShare","root","gitish1577");
	
			}
	     
		
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return con;
	}
	
}
