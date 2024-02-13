package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SignUpDao {
	
	DataSource dataSource;
	
	public SignUpDao() { 
		try {	
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/sellreMarket");

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void customerSignUp(String userid, String password, String tel, String name, String email, String address, String detailAddress, String gender, String birthdate) { 
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String query = "insert into customer (userid, password, tel_no, name, email, address, gender, birthdate, status, insertdate, updatedate) "
					 + "values (?,?,?,?,?,?,?,?,?,1,now(),now())";
		try {
			connection = dataSource.getConnection();
			
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, userid);
			preparedStatement.setString(2, password);
			preparedStatement.setString(3, tel);
			preparedStatement.setString(4, name);
			preparedStatement.setString(5, email);
			preparedStatement.setString(6, address);	
			preparedStatement.setString(7, detailAddress);	
			preparedStatement.setString(8, gender);	
			preparedStatement.setString(9, birthdate);	
			
			preparedStatement.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally { 
			// 메모리정리
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		} // finally
} // customerSignUp
	
	public void deliveryInfo(String address, String detailAddress, int defaultset, String userid) { 
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String query = "insert into addresslist (address,detailaddress,defaultset,userid) values (?,?,?,?)";
		try {
			connection = dataSource.getConnection();
			
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, address);
			preparedStatement.setString(2, detailAddress);
			preparedStatement.setInt(3, defaultset);
			preparedStatement.setString(4, userid);
			
			preparedStatement.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally { 
			// 메모리정리
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		} // finally
	} // deliveryInfo
	
	public boolean checkDuplicatedId(String userid) { // id 중복확인
		boolean result = true;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		String query = "select userid from customer where userid = ?";
		try {
			connection = dataSource.getConnection();
			
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userid);
			resultset = preparedStatement.executeQuery();
			
			if(resultset.next()) {
				result = false;
				
				System.out.println("중복된 id : "+ resultset.getString("userid"));
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
	
	public boolean checkDuplicatedemail(String email) { // id 중복확인
		boolean result = true;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		String query = "select email from customer where email = ?";
		try {
			connection = dataSource.getConnection();
			
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, email);
			resultset = preparedStatement.executeQuery();
			
			if(resultset.next()) {
				result = false;
				
				System.out.println("중복된 email : "+ resultset.getString("email"));
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
	
	
	
} // END
