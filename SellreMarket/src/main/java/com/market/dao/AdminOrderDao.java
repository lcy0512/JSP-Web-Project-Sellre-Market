package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.market.dto.AdminProductDto;

public class AdminOrderDao {


	DataSource dataSource;
	
	/************************************************************************************************
	 * Function : context.xml에 설정한 db이름을 가져온다. 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	public AdminOrderDao() {
		try {
			
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/sellreMarket");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/************************************************************************************************
	 * Function : 해당id의 제품명과 id가져오기
	 * @param 	: 해당 productid
	 * @return 	: ArrayList
	************************************************************************************************/
	public ArrayList<AdminProductDto> orderDetail(int productid) {
		
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
							p.pname
						FROM product p
				    
				    WHERE productid = ? 
				
					"""; //limit 시작번호, 출력갯수
			

			ps = conn.prepareStatement(query);
			
			ps.setInt(1, productid);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminProductDto product = new AdminProductDto();
				product.setProductid(rs.getInt(1));
				product.setPname(rs.getString(2));

				list.add(product);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	/************************************************************************************************
	 * Function : 입고요청하기
	 * @param 	: 해당 productid, 수량
	 * @return 	: int
	************************************************************************************************/	
	public int updateStock(int count, int productid) {
		int num = 0;
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = "update product set pstock =(pstock+ ?) where productid = ?";
		
			ps = conn.prepareStatement(query);
			ps.setInt(1, count);
			ps.setInt(2, productid);
			num++;
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			return num;
		}
		return num;
	}
	
	/************************************************************************************************
	 * Function : 입고요청하기
	 * @param 	: 해당 productid, 수량
	 * @return 	: int
	************************************************************************************************/	
	public int inputOrder(int count, int productid, String content) {
		int num = 0;
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = """
						insert into request (
						rcount, rcomment, rdate, productid
						) values (?,?,sysdate(),?)
					""";
		
			ps = conn.prepareStatement(query);
			ps.setInt(1, count);
			ps.setString(2, content);
			ps.setInt(3, productid);
			num++;
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			return num;
		}
		return num;
	}
}
