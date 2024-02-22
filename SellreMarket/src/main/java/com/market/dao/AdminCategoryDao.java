package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.market.dto.AdminCategoryDto;

public class AdminCategoryDao {

	DataSource dataSource;
	
	/************************************************************************************************
	 * Function : context.xml에 설정한 db이름을 가져온다. 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	public AdminCategoryDao() {
		try {
			
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/sellreMarket");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/************************************************************************************************
	 * Function : 상품의 전체 갯수 조회 => 페이징처리 위해
	 * @param 	: null
	 * @return 	: int
	************************************************************************************************/
	public int getProductCnt() {
		int productCnt = 0;
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = "select count(catetoryid) from catetory where status = 1";
		
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				productCnt = rs.getInt(1);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productCnt;
	}
	
	/************************************************************************************************
	 * Function : 현재페이지에 해당하는 리스트 조회
	 * @param 	: PageInfo에 있는 페이징 정보
	 * @return 	: ArrayList
	************************************************************************************************/
	public ArrayList<AdminCategoryDto> selectList(int index_no) {
		
		ArrayList<AdminCategoryDto> list = new ArrayList<AdminCategoryDto>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = 
							"""
							select type, subtype from catetory 
							where status = 1
							group by type, subtype
							limit ?, 15
				
					"""; //limit 시작번호, 출력갯수
			

			ps = conn.prepareStatement(query);
			
			ps.setInt(1, index_no);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminCategoryDto cate = new AdminCategoryDto();
				cate.setCatetoryid(rs.getInt(1));
				cate.setType(rs.getString(2));
				cate.setSubtype(rs.getString(3));
				
				list.add(cate);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	/************************************************************************************************
	 * Function : 카테고리 등록
	 * @param 	: 입력한 대분류, 중분류 
	 * @return 	: int
	************************************************************************************************/
	public int insertCategory(String type, String subtype) {
		
		int num = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();	
			String query = """
						insert into catetory (
							   type,
							   subtype,
							   status
							) values (?,?,'1')

							""";
			ps = conn.prepareStatement(query);
			ps.setString(1, type);
			ps.setString(2, subtype);
			
			ps.executeUpdate();
			num++;
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			return num;
		}
		return num;
	}
	
	
	/************************************************************************************************
	 * Function : 카테고리 상세
	 * @param 	: 카테고리 id  
	 * @return 	: ArrayList
	************************************************************************************************/
	public ArrayList<AdminCategoryDto> categoryDetail(int id) {
		
		ArrayList<AdminCategoryDto> list = new ArrayList<AdminCategoryDto>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = 
							"""
							select catetoryid, type, subtype from catetory where catetoryid = ? and status = 1
					"""; 
			

			ps = conn.prepareStatement(query);
			
			ps.setInt(1, id);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminCategoryDto cate = new AdminCategoryDto();
				cate.setCatetoryid(rs.getInt(1));
				cate.setType(rs.getString(2));
				cate.setSubtype(rs.getString(3));
				
				list.add(cate);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/************************************************************************************************
	 * Function : 카테고리 수정
	 * @param 	: 입력한 대분류, 중분류 
	 * @return 	: int
	************************************************************************************************/
	public int updateCategory(String type, String subtype, int catetoryid) {
		
		int num = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();	
			String query = """
							update catetory set 
							type = ?, subtype =?
							where catetoryid = ?

							""";
			ps = conn.prepareStatement(query);
			ps.setString(1, type);
			ps.setString(2, subtype);
			ps.setInt(3, catetoryid);
			
			ps.executeUpdate();
			num++;
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			return num;
		}
		return num;
	}
	
	/************************************************************************************************
	 * Function : 카테고리 삭제
	 * @param 	: categoryid 
	 * @return 	: int
	************************************************************************************************/
	public int deleteCategory(int catetoryid) {
		
		int num = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();	
			String query = """
							update catetory set 
							status = 0
							where catetoryid = ?
							
							""";
			ps = conn.prepareStatement(query);
			ps.setInt(1, catetoryid);
			
			ps.executeUpdate();
			num++;
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			return num;
		}
		return num;
	}
	
}
