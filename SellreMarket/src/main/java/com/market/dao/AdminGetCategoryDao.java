package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.market.dto.AdminGetCategoryDto;
import com.market.dto.AdminProductDto;

public class AdminGetCategoryDao {
	
	DataSource dataSource;
	
	/************************************************************************************************
	 * Function : context.xml에 설정한 db이름을 가져온다. 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	public AdminGetCategoryDao() {
		try {
			
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/sellreMarket");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	/************************************************************************************************
	 * Function : 카테고리 대분류 리스트를 가져온다. 
	 * @param 	: null
	 * @return 	: ArrayList
	************************************************************************************************/
	public ArrayList<AdminGetCategoryDto> selectCategory() {
		ArrayList<AdminGetCategoryDto> dtos = new ArrayList<AdminGetCategoryDto>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = "SELECT type FROM selreMarket.catetory group by type";
		
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminGetCategoryDto category = new AdminGetCategoryDto();
				category.setType(rs.getString(1));
				dtos.add(category);
			}
			
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	
	/************************************************************************************************
	 * Function : 카테고리 중분류 리스트를 가져온다. 
	 * @param 	: null
	 * @return 	: ArrayList
	************************************************************************************************/
	public ArrayList<AdminGetCategoryDto> selectCategorySubType(String type) {
		ArrayList<AdminGetCategoryDto> dtos = new ArrayList<AdminGetCategoryDto>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		System.out.println("중분류 가져오기");
		try {
			
			conn = dataSource.getConnection();
			String query = "SELECT subtype FROM selreMarket.catetory where type=? group by subtype;";
		
			ps = conn.prepareStatement(query);
			ps.setString(1, type);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminGetCategoryDto category = new AdminGetCategoryDto();
				category.setType(rs.getString(1));
				dtos.add(category);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	
	
}
