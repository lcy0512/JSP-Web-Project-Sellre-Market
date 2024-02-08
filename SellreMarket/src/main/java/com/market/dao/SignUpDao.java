package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
	
	public void customerSignUp(String userid, String password, String tel, String name, String email, String address, String gender, String birthdate) { // 사용자가 상품등록 form에 입력한 값 DB에 추가 
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String query = "insert into customer (userid, password, tel_no, name, email, address, gender, birthdate, status, insertdate, updatedate) "
					 + "values (?,?,?,?,?,?,?,?,1,now(),now())";
		try {
			connection = dataSource.getConnection();
			
			preparedStatement = connection.prepareStatement(query);
			
			// 브랜드 영문명,한글명
			preparedStatement.setString(1, userid);
			preparedStatement.setString(2, password);
			preparedStatement.setString(3, tel);
			preparedStatement.setString(4, name);
			preparedStatement.setString(5, email);
			preparedStatement.setString(6, address);	
			preparedStatement.setString(7, gender);	
			preparedStatement.setString(8, birthdate);	
			
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
} // insertInquiry
	
	
	
} // END
