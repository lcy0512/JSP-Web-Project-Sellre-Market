package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.market.dto.InquiryDto;


public class InquiryDao {
	
DataSource dataSource;
	
	public InquiryDao() { 
		try {	
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/sellreMarket");

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<InquiryDto> list(String userid) {
		ArrayList<InquiryDto> dtos = new ArrayList<InquiryDto>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String query = "select intitle, insertdate, status from personal_inquiry where userid = ?";
		System.out.println(query);
		try {
			connection = dataSource.getConnection();
			
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userid);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String title = resultSet.getString("intitle");
				String insertdate = resultSet.getString("insertdate");
				String status = resultSet.getString("status");
				
				// 시,분,초 제외
				insertdate = insertdate.substring(0, 10);
				
				InquiryDto dto = new InquiryDto(title, insertdate, status);
				
				dtos.add(dto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally { 
			// 메모리 정리를 finally에서 함, 정리는 역순으로
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
	} // list()
	
	
	
	
	
	
	
} // End
