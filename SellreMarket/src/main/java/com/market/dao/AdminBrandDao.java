package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.market.dto.AdminBrandDto;

public class AdminBrandDao {
	
	DataSource dataSource;
	
	/************************************************************************************************
	 * Function : context.xml에 설정한 db이름을 가져온다. 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	public AdminBrandDao() {
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
			String query = "select count(brandid) from brand;";
		
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
	public ArrayList<AdminBrandDto> selectList(int index_no) {
		
		ArrayList<AdminBrandDto> list = new ArrayList<AdminBrandDto>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = 
							"""
							select brandid, bname from brand 
							order by brandid desc
							limit ?, 15
				
					"""; //limit 시작번호, 출력갯수
			

			ps = conn.prepareStatement(query);
			
			ps.setInt(1, index_no);
			
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminBrandDto brand = new AdminBrandDto();
				brand.setBrandid(rs.getInt(1));
				brand.setBname(rs.getString(2));
				
				list.add(brand);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/************************************************************************************************
	 * Function : 브랜드 등록
	 * @param 	: 입력한 브랜드명 
	 * @return 	: int
	************************************************************************************************/
	public int insertBrand(String bname) {
		
		int num = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();	
			String query = """
						insert into brand (
								bname
							) values (?)

							""";
			ps = conn.prepareStatement(query);
			ps.setString(1, bname);
			
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
	 * Function : 브랜드 상세
	 * @param 	: 브랜드 id  
	 * @return 	: ArrayList
	************************************************************************************************/
	public ArrayList<AdminBrandDto> brandDetail(int id) {
		
		ArrayList<AdminBrandDto> list = new ArrayList<AdminBrandDto>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = 
							"""
							select brandid, bname from brand where brandid = ?
							
							"""; 
			

			ps = conn.prepareStatement(query);
			
			ps.setInt(1, id);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminBrandDto brand = new AdminBrandDto();
				brand.setBrandid(rs.getInt(1));
				brand.setBname(rs.getString(2));
				
				list.add(brand);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	/************************************************************************************************
	 * Function : 브랜드 수정
	 * @param 	: 입력한 브랜드명 
	 * @return 	: int
	************************************************************************************************/
	public int updateBrand(String bname, int brandid) {
		
		int num = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();	
			String query = """
							update brand set 
							bname = ?
							where brandid = ?

							""";
			ps = conn.prepareStatement(query);
			ps.setString(1, bname);
			ps.setInt(2, brandid);
			
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
	 * Function : 제품등록을 위한 브랜드 조회하기
	 * @param 	: null
	 * @return 	: ArrayList
	************************************************************************************************/
	public ArrayList<AdminBrandDto> selectBrand() {
		ArrayList<AdminBrandDto> dtos = new ArrayList<AdminBrandDto>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = "select bname from brand order by bname asc";
		
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminBrandDto brand = new AdminBrandDto();
				brand.setBname(rs.getString(1));
				dtos.add(brand);
			}
			
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
		
	
	
}
