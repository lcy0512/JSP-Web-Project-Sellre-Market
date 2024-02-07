package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.market.dto.AdminGetCategoryDto;
import com.market.dto.AdminGetPackTypeDto;

public class AdminGetPackTypeDao {

	DataSource dataSource;
		
	/************************************************************************************************
	 * Function : context.xml에 설정한 db이름을 가져온다. 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	public AdminGetPackTypeDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/sellreMarket");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	/************************************************************************************************
	 * Function : 포장타입 조회
	 * @param 	: null
	 * @return 	: ArrayList
	************************************************************************************************/	
	
	public ArrayList<AdminGetPackTypeDto> selectPackType() {
		ArrayList<AdminGetPackTypeDto> dtos = new ArrayList<AdminGetPackTypeDto>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = "SELECT packtype FROM packing group by packtype";
		
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminGetPackTypeDto pack = new AdminGetPackTypeDto();
				pack.setPacktype(rs.getString(1));
				dtos.add(pack);
			}
			
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	
	/************************************************************************************************
	 * Function : 포장종류 조회
	 * @param 	: null
	 * @return 	: ArrayList
	************************************************************************************************/		
	
	public ArrayList<AdminGetPackTypeDto> selectPackKind() {
		ArrayList<AdminGetPackTypeDto> dtos = new ArrayList<AdminGetPackTypeDto>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = "SELECT packkind FROM packing group by packkind";
		
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminGetPackTypeDto pack = new AdminGetPackTypeDto();
				pack.setPackkind(rs.getString(1));
				dtos.add(pack);
			}
			
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	
	
}
