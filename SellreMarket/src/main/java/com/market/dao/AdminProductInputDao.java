package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.market.dto.AdminProductDto;
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
	public int insertProduct(String pname, String pEngname, String allery, String nutrition, int pstock, String origin, String description) {
		
		int num = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();	
			String query = """
						insert into product (
							    pname, 
							    pEngname, 
							    allery, 
							    nutrition, 
							    pstock, 
							    origin, 
							    description, 
							    status,
							    pinsertdate
							) values (?,?,?,?,?,?,?,?,now())

							""";
			ps = conn.prepareStatement(query);
			ps.setString(1, pname);
			ps.setString(2, pEngname);
			ps.setString(3, allery);
			ps.setString(4, nutrition);
			ps.setInt(5, pstock);
			ps.setString(6, origin);
			ps.setString(7, description);
			ps.setString(8, "1");
			
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
		
		System.out.println("insertImage : "+image);
		
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
		
		System.out.println("price : "+price);
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
		
		System.out.println("type : "+type);
	
		
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
		
		
		System.out.println("packType : "+packType);
		
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
	
	
	/************************************************************************************************
	 * Function : input한 제품의 productid 가져오기
	 * @param 	: PageInfo에 있는 페이징 정보
	 * @return 	: ArrayList
	************************************************************************************************/
	public int selectInputProductId (String pname, String pEngname, int pstock, String origin) {
		
		int num = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = 
							"""
					select productid from product
					where pname =? and pEngname = ? and  pstock =? and origin =?
					
					"""; 
			

			ps = conn.prepareStatement(query);

			ps.setString(1, pname);
			ps.setString(2, pEngname);
			ps.setInt(3, pstock);
			ps.setString(4, origin);
			
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	
	/************************************************************************************************
	 * Function : packing 테이블에 insert하기 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	
	public int insertPrice(int price, int productid) {
		
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
								  ) values (?, ?)
							""";
		
			ps = conn.prepareStatement(query);
			ps.setInt(1, price);
			ps.setInt(2, productid);
			
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
	
	public int insertBrand(String bname, int productid) {
		
		int num = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();	
			String query = """
							insert into 
							brand (
										bname, 
										productid
								  ) values (?, ?)
							""";
		
			ps = conn.prepareStatement(query);
			ps.setString(1, bname);
			ps.setInt(2, productid);
			
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
	 * Function : 카테고리 제품과 연결 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	
	public int insertCategory (String type, String subtype, int productid) {
		
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
								  ) values (?, ?, ?)
							""";
		
			ps = conn.prepareStatement(query);
			ps.setString(1, type);
			ps.setString(2, subtype);
			ps.setInt(3, productid);
			
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
	 * Function : 포장타입 제품과 연결 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	
	public int insertPack (String packType, String packKind, int productid) {
		
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
								  ) values (?, ?, ?)
							""";
		
			ps = conn.prepareStatement(query);
			ps.setString(1, packType);
			ps.setString(2, packKind);
			ps.setInt(3, productid);
			
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
	 * Function : 중량 제품과 연결 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	
	public int insertUnit(String utype, String ugram, int productid) {
		
		int num = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();	
			String query = """
							insert into 
							saleunit (
										utype,
										ugram, 
										productid
								  ) values (?, ?, ?)
							""";
		
			ps = conn.prepareStatement(query);
			ps.setString(1, utype);
			ps.setString(2, ugram);
			ps.setInt(3, productid);
			
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
