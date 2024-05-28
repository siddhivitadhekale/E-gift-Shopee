package com.smartshop.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyConnection {

	public static Connection getConnectionObj()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver loaded");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping","root","root");
			System.out.println("Connection Established");
			
			return conn;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
}

