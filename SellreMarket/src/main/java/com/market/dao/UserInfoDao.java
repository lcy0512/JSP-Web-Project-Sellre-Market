package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.market.dto.MyPageDetailDto;

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
	} // checkUserInput
	
	public MyPageDetailDto userDetail(String id) {
		MyPageDetailDto dto = new MyPageDetailDto();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		String query = "select userid,password,tel_no,name,email,address,detailaddress,gender,birthdate "
				 	 + "from customer "
					 + "where userid = ?";
		 
		try {
			connection = dataSource.getConnection();
			
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, id);
			resultset = preparedStatement.executeQuery();
			
			if(resultset.next()) {
				
				String userid = resultset.getString("userid");
				String password = resultset.getString("password");
				String tel_no = resultset.getString("tel_no");
				String name = resultset.getString("name");
				String email = resultset.getString("email");
				String address = resultset.getString("address");
				String detailaddress = resultset.getString("detailaddress");
				String gender = resultset.getString("gender");
				String birthdate = resultset.getString("birthdate");
				
				dto = new MyPageDetailDto(userid, password, tel_no, name, email, address, detailaddress, gender, birthdate);
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
		
		return dto;
	}
	
public void updateUserInfo(String userid, String password, String tel, String name, String email, String address, String detailaddress, String gender, String birthdate) { 
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String query = "update customer set password=?, tel_no=?, name=?, email=?, address=?, detailaddress=?, gender=?, birthdate=?, updatedate=now() "
					 + "where userid=?";
		try {
			connection = dataSource.getConnection();
			
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, password);
			preparedStatement.setString(2, tel);
			preparedStatement.setString(3, name);
			preparedStatement.setString(4, email);
			preparedStatement.setString(5, address);	
			preparedStatement.setString(6, detailaddress);	
			preparedStatement.setString(7, gender);	
			preparedStatement.setString(8, birthdate);	
			preparedStatement.setString(9, userid);
			
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
	
	public void deleteUserInfo(String userid) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String query = "update customer set status = 0 where userid = ?";
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, userid);
			
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
	}
	
	public void updatePassword(String userid, String password) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String query = "update customer set password = ? where userid = ?";
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(query);
			
			preparedStatement.setString(1, password);
			preparedStatement.setString(2, userid);
			
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
	}
	
}// End
