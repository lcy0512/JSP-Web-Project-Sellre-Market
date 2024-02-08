package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.market.dto.AdminProductInputDto;

public class AdminProductInputDao {

	
	DataSource dataSource;
	
	/************************************************************************************************
	 * Function : context.xml에 설정한 db이름을 가져온다. 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	public AdminProductInputDao() {
		try {
			
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/sellreMarket");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/************************************************************************************************
	 * Function : product 테이블에 insert하기 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	public int insertProduct(String bname, String pname, String pEngname, String allery, String nutrition, int pstock, String origin, String expirationdate, String description) {
		
		int num = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		AdminProductInputDto product = new AdminProductInputDto();
		
		try {
			conn = dataSource.getConnection();	
			String query = """
							insert into product (
													pname, 
													pEngname, 
													allery, 
													nutrition, 
													pstock, 
													pinsertdate, 
													origin, 
													expirationdate, 
													description, 
													status 
												) values (?,?,?,?,?,sysdate(),?,?,?,?)
							""";
		
			ps = conn.prepareStatement(query);
			ps.setString(1, product.getPname());
			ps.setString(2, product.getpEngname());
			ps.setString(3, product.getAllery());
			ps.setString(4, product.getNutrition());
			ps.setInt(5, product.getPstock());
			ps.setString(7, product.getOrigin());
			ps.setString(8, product.getExpirationdate());
			ps.setString(9, product.getDescription());
			ps.setString(10, product.getStatus());
			
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
	 * Function : image 테이블에 insert하기 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
		
	public int insertImage(String image) {
		
		int num = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();	
			String query = """
							insert into 
							product_image (
												image, 
												productid
										  ) values (?, (select max(productid) from product))
							""";
		
			ps = conn.prepareStatement(query);
			ps.setString(1, image);
			
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
	 * Function : price 테이블에 insert하기 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
		
	public int insertPrice(int price) {
		
		int num = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();	
			String query = """
							insert into 
							price (
										price, 
										productid
								  ) values (?, (select max(productid) from product))
							""";
		
			ps = conn.prepareStatement(query);
			ps.setInt(1, price);
			
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
	 * Function : category 테이블에 insert하기 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	public int insertCategory(String type, String subType) {
		
		int num = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();	
			String query = """
							insert into 
							catetory (
										type, 
										subtype,
										productid
								  ) values (?, ?, (select max(productid) from product))
							""";
		
			ps = conn.prepareStatement(query);
			ps.setString(1, type);
			ps.setString(2, subType);
			
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
	 * Function : packing 테이블에 insert하기 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	public int insertPacking(String packType, String packKind) {
		
		int num = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();	
			String query = """
							insert into 
							packing (
										packtype, 
										packkind,
										productid
								  ) values (?, ?, (select max(productid) from product))
							""";
		
			ps = conn.prepareStatement(query);
			ps.setString(1, packType);
			ps.setString(2, packKind);
			
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
	 * Function : packing 테이블에 insert하기 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	
	public int insertUnit(String utype, String ugram) {
		
		int num = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		AdminProductInputDto product = new AdminProductInputDto();
		
		try {
			conn = dataSource.getConnection();	
			String query = """
							insert into 
							saleunit (
										utype, 
										ugram,
										productid
								  ) values (?, ?, (select max(productid) from product))
							""";
		
			ps = conn.prepareStatement(query);
			ps.setString(1, utype);
			ps.setString(2, ugram);
			
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
