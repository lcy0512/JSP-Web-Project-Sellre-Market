package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.market.dto.EventDto;
import com.market.dto.MyPageDetailDto;

public class EventListDao {

DataSource dataSource;
	
	public EventListDao() { 
		try {	
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/sellreMarket");

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<EventDto> eventList(int startIndex) {
		ArrayList<EventDto> dtos = new ArrayList<EventDto>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		String query = "select eventid,ename,inputdate,category,status from event order by inputdate desc limit ?,10";
		 
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, startIndex);
			
			resultset = preparedStatement.executeQuery();
			
			while(resultset.next()) {
				String eventid = resultset.getString("eventid");
				String ename = resultset.getString("ename");
				String inputdate = resultset.getString("inputdate");
				String category = resultset.getString("category");
				String status = resultset.getString("status");
				
				inputdate = inputdate.substring(0, 10);
				
				EventDto dto = new EventDto(eventid, ename, inputdate, category, status);
				
				dtos.add(dto);
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
		
		return dtos;
	}
	
	public EventDto eventDetail(String eventid) {
		EventDto dto = new EventDto();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		String query = "select e.eventid,e.ename,e.econtent,e.inputdate,e.startdate,e.enddate,e.salerate,e.productid,p.pname,e.img,e.category,e.status "
					 + "from event e, product p "
					 + "where e.productid = p.productid and e.eventid = ?";
		
		try {
			connection = dataSource.getConnection();
			
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, eventid);
			
			resultset = preparedStatement.executeQuery();
			
			if(resultset.next()) {
				String event_id = resultset.getString("e.eventid");
				String ename = resultset.getString("e.ename");
				String econtent = resultset.getString("e.econtent");
				String inputdate = resultset.getString("e.inputdate");
				String startdate = resultset.getString("e.startdate");
				String enddate = resultset.getString("e.enddate");
				String productid = resultset.getString("e.productid");
				String pname = resultset.getString("p.pname");
				String img = resultset.getString("p.img");
				String category = resultset.getString("e.category");
				String status = resultset.getString("status");
				
				inputdate = inputdate.substring(0, 10);
				startdate = inputdate.substring(0, 10);
				enddate = inputdate.substring(0, 10);
				
				dto = new EventDto(event_id, ename, econtent, inputdate, startdate, enddate, productid, pname, img, category, status);
				
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
	
	public int totalRowCount() {
		int result = 0;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		String query = "select COUNT(eventid) as count from event";
		 
		try {
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(query);
			
			resultset = preparedStatement.executeQuery();
			
			if(resultset.next()) {
				result = resultset.getInt("count");
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
