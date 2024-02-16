package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.market.dto.AdminDeliverDto;

public class AdminDeliveryDao {

	DataSource dataSource;
	
	/************************************************************************************************
	 * Function : context.xml에 설정한 db이름을 가져온다. 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	public AdminDeliveryDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/sellreMarket");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/************************************************************************************************
	 * Function : 포장종류 조회
	 * @param 	: null
	 * @return 	: ArrayList
	************************************************************************************************/		
	
	public ArrayList<AdminDeliverDto> seletList() {
		ArrayList<AdminDeliverDto> dtos = new ArrayList<AdminDeliverDto>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = "select dname from delivery_type group by dname order by dname asc";
		
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminDeliverDto deli = new AdminDeliverDto();
				deli.setDname(rs.getString(1));
				dtos.add(deli);
			}
			
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}	
}
