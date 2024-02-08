package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.market.dto.LoginDto;

public class LoginDao {
	
	DataSource dataSource;
	
	public LoginDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/sellreMarket");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 아이디 체크, 비밀번호 체크 후 이름 띄우기
	public Map<String, Object> checkLogin(String id, String password) {
		
		Map<String, Object> data = new HashMap<>();
		boolean check = false;
		String name = "";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select name from customer where userid = ? and password = ?";
			
			ps = con.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, password);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				check = true;
				name = rs.getString("name");
				
				System.out.println(name + " insdie dao");
				System.out.println(check + " insdie dao");
				
				data.put("name", name);
				data.put("check", check);
			}
			else {
				// If no data is found, you can still put default values in the map
	            data.put("name", "");   // or null, depending on your requirement
	            data.put("check", false);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (con != null) con.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		return data;
	}
}
