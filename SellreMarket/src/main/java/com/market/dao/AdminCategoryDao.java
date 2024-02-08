package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.market.dto.AdminCategoryDto;
import com.market.dto.AdminProductDto;
import com.market.dto.AdminProductInputDto;

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
			String query = "select count(catetoryid) from catetory;";
		
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
							select type, subtype from catetory order by catetoryid desc
							limit ?, 15
				
					"""; //limit 시작번호, 출력갯수
			

			ps = conn.prepareStatement(query);
			
			ps.setInt(1, index_no);
			
			System.out.println("admincategorydao[selectList] : "+index_no);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminCategoryDto cate = new AdminCategoryDto();
				cate.setType(rs.getString(1));
				cate.setSubtype(rs.getString(2));
				
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
		System.out.println("ddd : "+type);
		System.out.println("eee : "+subtype);
		
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
	
}
