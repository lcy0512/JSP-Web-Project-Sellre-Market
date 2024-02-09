package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserInfoDao {
	
DataSource dataSource;
	
	public UserInfoDao() { 
		try {	
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/sellreMarket");

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean checkUserInput(String userid, String password) { // id 중복확인
		boolean result = false;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		String query = "select userid, password from customer where userid = ? and password = ?";
		try {
			connection = dataSource.getConnection();
			
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userid);
			preparedStatement.setString(2, password);
			resultset = preparedStatement.executeQuery();
			
			if(resultset.next()) {
				result = true;
				
				System.out.println("USERINFO ID : " + resultset.getString("userid"));
				System.out.println("USERINFO PW : " + resultset.getString("password"));
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
	} // checkDuplicatedId
	
	
	
	
}// End
