package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FindUserInfo {
	
	DataSource dataSource;
	
	public FindUserInfo() { 
		try {	
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/sellreMarket");

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String findID(String name, String email) {
		String result = "";
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		String query = "select userid from customer where name=? and email=?";
		try {
			connection = dataSource.getConnection();
			
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, email);
			resultset = preparedStatement.executeQuery();
			
			if(resultset.next()) {
				result = resultset.getString("userid");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally { 
			// 메모리정리
			try {
				if(resultset != null) resultset.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		} // finally
		
		return result;
	}
	
	public boolean findPW(String userid, String name, String email) {
		boolean result = false;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		String query = "select userid, name, email from customer where userid=? and name=? and email=?;";
		try {
			connection = dataSource.getConnection();
			
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userid);
			preparedStatement.setString(2, name);
			preparedStatement.setString(3, email);
			resultset = preparedStatement.executeQuery();
			
			if(resultset.next()) {
				result = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally { 
			// 메모리정리
			try {
				if(resultset != null) resultset.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		} // finally
		
		return result;
	}
	
	
} // End