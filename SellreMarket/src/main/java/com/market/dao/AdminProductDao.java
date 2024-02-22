package com.market.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.market.dto.AdminCategoryDto;
import com.market.dto.AdminProductDto;
import com.market.dto.PageInfo;
import com.oreilly.servlet.MultipartRequest;
public class AdminProductDao {

	DataSource dataSource;
	
	/************************************************************************************************
	 * Function : context.xml에 설정한 db이름을 가져온다. 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	public AdminProductDao() {
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
			String query = "SELECT count(productid) FROM product ";
		
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
	public ArrayList<AdminProductDto> selectList(int index_no) {
		
		ArrayList<AdminProductDto> list = new ArrayList<AdminProductDto>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = 
							"""
					SELECT 
							p.productid, 
							p.pname, 
							IFNULL(p.pstock, 0 ),
				            (SELECT COALESCE(SUM(pur.amount), 0) FROM purchase pur WHERE p.productid = pur.productid) AS amount,
							CASE p.status
								WHEN '0' THEN '판매종료'
								WHEN '1' THEN '판매중'
							ELSE '' END AS status 
							
						FROM product p
				        LEFT OUTER JOIN purchase pur ON p.productid = pur.productid
				        GROUP BY productid
				        ORDER BY productid DESC
						LIMIT ?, 15; 
				
					"""; //limit 시작번호, 출력갯수
			

			ps = conn.prepareStatement(query);
			
			ps.setInt(1, index_no);
			
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminProductDto product = new AdminProductDto();
				product.setProductid(rs.getInt(1));
				product.setPname(rs.getString(2));
				product.setPstock(rs.getInt(3));
				product.setStock(rs.getInt(4));
				product.setStatus(rs.getString(5));
				
				list.add(product);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/************************************************************************************************
	 * Function : 재고가 100이하인 제품의 수
	 * @param 	: null
	 * @return 	: int
	************************************************************************************************/	
	
	public int productNum() {
		int productNum = 0;
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = """
					 select count(amount) from (     
								
						SELECT 
								
							(p.pstock - 
								(SELECT COALESCE(SUM(pur.amount), 0) FROM purchase pur WHERE p.productid = pur.productid)) AS amount
							
						FROM product p
						LEFT OUTER JOIN purchase pur ON p.productid = pur.productid
						GROUP BY p.productid
						ORDER BY p.productid DESC)t where t.amount <= 100
					""";
		
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				productNum = rs.getInt(1);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productNum;
	}
	
	/************************************************************************************************
	 * Function : 재고가 100이하인 제품 리스트
	 * @param 	: index_no
	 * @return 	: ArrayList
	************************************************************************************************/	
	public ArrayList<AdminProductDto> stockList(int index_no) {
		
		ArrayList<AdminProductDto> list = new ArrayList<AdminProductDto>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = 
							"""
					select t.productid, t.pname, t.amount, t.status from (     		
						SELECT 
								p.productid, 
								p.pname, 
								(p.pstock - 
									(SELECT COALESCE(SUM(pur.amount), 0) FROM purchase pur WHERE p.productid = pur.productid)) AS amount,
								CASE p.status
									WHEN '0' THEN '판매종료'
									WHEN '1' THEN '판매중'
								ELSE '' END AS status 
							FROM product p
							LEFT OUTER JOIN purchase pur ON p.productid = pur.productid
							GROUP BY p.productid
							ORDER BY p.productid DESC LIMIT ?, 15 )t where t.amount <= 100
				
					"""; //limit 시작번호, 출력갯수
			

			ps = conn.prepareStatement(query);
			
			ps.setInt(1, index_no);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminProductDto product = new AdminProductDto();
				product.setProductid(rs.getInt(1));
				product.setPname(rs.getString(2));
				product.setPstock(rs.getInt(3));
				product.setStatus(rs.getString(4));
				
				list.add(product);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	/************************************************************************************************
	 * Function : 제품 상세
	 * @param 	: 제품 id  
	 * @return 	: ArrayList
	************************************************************************************************/
	public ArrayList<AdminProductDto> productDetail(int id) {
		
		ArrayList<AdminProductDto> list = new ArrayList<AdminProductDto>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = 
							"""
							select p.productid, pname, pEngname, allery, nutrition, pstock, origin, description, status, image
							from product p
							left join product_image i on i.productid = p.productid
							where p.productid = ?
							
							"""; 
			
			ps = conn.prepareStatement(query);
			
			ps.setInt(1, id);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminProductDto product = new AdminProductDto();
				product.setProductid(rs.getInt(1));
				product.setPname(rs.getString(2));
				product.setpEngname(rs.getString(3));
				product.setAllery(rs.getString(4));
				product.setNutrition(rs.getString(5));
				product.setPstock(rs.getInt(6));
				product.setOrigin(rs.getString(7));
				product.setDescription(rs.getString(8));
				product.setStatus(rs.getString(9));
				product.setImage(rs.getString(10));
				
				list.add(product);
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
	public int updateProduct(String pEngname, String allery, String nutrition, String origin, String description, String productid) {
		
		int num = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();	
			String query = """
							update product set 
							pEngname = ?, allery =?, nutrition = ?,  origin = ?,  description = ?
							where productid = ?

						   """;
			ps = conn.prepareStatement(query);
			ps.setString(1, pEngname);
			ps.setString(2, allery);
			ps.setString(3, nutrition);
			ps.setString(4, origin);
			ps.setString(5, description);
			ps.setInt(6, Integer.parseInt(productid));
			
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
	 * Function : 카테고리 수정
	 * @param 	: 입력한 대분류, 중분류 
	 * @return 	: int
	************************************************************************************************/
	public int updateImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int num = 0;
		
		String fileName = "";
		
		try { 
			//서버경로 
			String path = request.getServletContext().getRealPath("/image");
			int maxSize = 1024 * 1024 * 1;
			System.out.println("서버 경로 : "+path);
			MultipartRequest multi = null;
			response.setContentType("multipart/form-data"); 
			
			System.out.println("request getContentType : "+request.getContentType());
			multi = new MultipartRequest(request, path, maxSize, "UTF-8");
			

			Enumeration<String> files = multi.getFileNames();
			
			
			// 넘겨받은 form에서 <file> tag가 있는지를 확인
			if (files.hasMoreElements()) {					
			    String name = (String) files.nextElement();			// <file> tag의 name
			    fileName = multi.getOriginalFileName(name);			 // 사용자가 업로드한 file의 이름
			    System.out.println("Original File Name: " + fileName);
			}
			
			int productid = Integer.parseInt(multi.getParameter("productid"));
			
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			String query = """
								update product_image set
									image = ?,
								where productid = ?
						""";
			
			
			try {
				
				connection = dataSource.getConnection();
				
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, fileName);
				preparedStatement.setInt(2, productid);
				
				num++;
				connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}	

	/************************************************************************************************
	 * Function : 제품 삭제
	 * @param 	: productid
	 * @return 	: int
	************************************************************************************************/
	public int deleteProduct(int productid) {
		
		int num = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();	
			String query = """
							update product set 
							status = 0
							where productid = ?
							
							""";
			ps = conn.prepareStatement(query);
			ps.setInt(1, productid);
			
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
