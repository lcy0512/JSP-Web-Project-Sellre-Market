package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.market.dto.AdminProductDto;

public class AdminProductDao {

	DataSource dataSource;
	
	public AdminProductDao() {
		
		try {
			
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/jdbc/sellreMarket");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//제품 전체 검색 
	public ArrayList<AdminProductDto> selectList() {
		ArrayList<AdminProductDto> dtos = new ArrayList<AdminProductDto>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = "select productid, pname, pEngname, nutrition, pinsertdate, expirationdate, status from product";
		
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int productid = rs.getInt("productid");
				String pname = rs.getString("pname");
				String pEngname = rs.getString("pEngname");
				String pinsertdate = rs.getString("pinsertdate");
				String expirationdate = rs.getString("expirationdate");
				String status = rs.getString("status");
				
				AdminProductDto dto = new AdminProductDto(productid, pname, pEngname, pEngname, pinsertdate, expirationdate, status);
				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
}
//<Resource
//name = "jdbc/sellreMarket"
//auth = "Container"
//type ="javax.sql.DataSource"
//maxTotal = "8"
//maxIdle = "30"
//maxWaitMillis ="-1"
//username = "root"
//password = "qwer1234"
//driverClassName = "com.mysql.cj.jdbc.Driver"
//url = "jdbc:mysql://192.168.50.4:3306/selreMarket?serverTimezone=Asia/Seoul&amp;characterEncoding=utf-8&amp;useSSL=false"
///>
