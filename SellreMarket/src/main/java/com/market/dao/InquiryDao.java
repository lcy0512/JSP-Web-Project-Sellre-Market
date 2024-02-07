package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.market.dto.InquiryDto;
import com.oreilly.servlet.MultipartRequest;


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
	
	// 1:1 문의내역 불러오기
	public ArrayList<InquiryDto> list(String userid) {
		ArrayList<InquiryDto> dtos = new ArrayList<InquiryDto>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String query = "select i.inquiryid , i.intitle, i.insertdate, i.status, q.qname "
					 + "from personal_inquiry i, questcode q "
					 + "where q.questid = i.questid and userid = ?";
		System.out.println(query);
		try {
			connection = dataSource.getConnection();
			
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userid);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String inquiryid = resultSet.getString("i.inquiryid");
				String title = resultSet.getString("i.intitle");
				String insertdate = resultSet.getString("i.insertdate");
				String status = resultSet.getString("i.status");
				String questid = resultSet.getString("q.qname");
				
				// 시,분,초 제외
				insertdate = insertdate.substring(0, 10);
				
				InquiryDto dto = new InquiryDto(inquiryid, title, insertdate, status, questid);
				
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
	
	// 1:1 문의 추가
	public void insertInquiry(String intitle, String incontent, String inimage, String questid, String userid) { // 사용자가 상품등록 form에 입력한 값 DB에 추가 
					
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			String query = "insert into personal_inquiry (intitle,incontent,inimage,insertdate,status,questid,userid) values (?,?,?,now(),'진행중',?,?)";
			try {
				connection = dataSource.getConnection();
				
				preparedStatement = connection.prepareStatement(query);
				
				// 브랜드 영문명,한글명
				preparedStatement.setString(1, intitle);
				preparedStatement.setString(2, incontent);
				preparedStatement.setString(3, inimage);
				preparedStatement.setString(4, questid);
				preparedStatement.setString(5, userid);
				
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
	
	
	public ArrayList<InquiryDto> detailInquiry(String userid, String inquiryid) {
		ArrayList<InquiryDto> details = new ArrayList<InquiryDto>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String query = "select i.intitle, i.incontent, i.inimage, i.answer, i.insertdate, i.answerdate, i.status, q.qname "
					 + "from personal_inquiry i, questcode q "
					 + "where q.questid = i.questid and userid = ? and i.inquiryid = ?";
		
		System.out.println(query);
		try {
			connection = dataSource.getConnection();
			
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, userid);
			preparedStatement.setString(2, inquiryid);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String title = resultSet.getString("i.intitle");
				String content = resultSet.getString("i.incontent");
				String image = resultSet.getString("i.inimage");
				String answer = resultSet.getString("i.answer");
				String insertdate = resultSet.getString("i.insertdate");
				String answerdate = resultSet.getString("i.answerdate");
				String status = resultSet.getString("i.status");
				String questid = resultSet.getString("q.qname");
				
				// 시,분,초 제외
				insertdate = insertdate.substring(0, 10);
				try {
					answerdate = answerdate.substring(0, 10);
				}catch(Exception l) {
					
				}
				
				System.out.println("답변 : " + answer);
				System.out.println("답변시각 : " + answerdate);
				
				InquiryDto detail = new InquiryDto(title, content, image, answer, insertdate, answerdate, status, questid);
				
				details.add(detail);
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
		
		return details;
	}
	
	
	
	
} // End
