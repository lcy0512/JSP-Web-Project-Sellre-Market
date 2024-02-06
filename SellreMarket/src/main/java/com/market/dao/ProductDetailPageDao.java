package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProductDetailPageDao {
	
	DataSource dataSource;
	
	public ProductDetailPageDao() {
		try {
			Context context = new InitialContext();
			 dataSource = (DataSource) context.lookup("java:comp/env/jdbc/myDB");
			 dataSource = (DataSource) context.lookup("java:comp/env/jdbc/2jo");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String ProductInfo(String id) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String name = null;
		
		try {
			conn = dataSource.getConnection();
			
            String query = "select pname "
            					+ "from product "
            					+ "where product.productid ='" + id +"'";
            ps = conn.prepareStatement(query);
            
            rs = ps.executeQuery();
            
            if (rs.next()) {
            	name = rs.getString("pname");
            	System.out.println("다오에서 이름 출력" + name);
            }		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		
		return name;
		
		
	}

}
