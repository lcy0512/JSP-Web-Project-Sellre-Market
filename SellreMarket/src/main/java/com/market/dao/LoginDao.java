package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
	
	// 아이디 체크 
	public boolean checkLoginId(String id) {
		boolean check = false;
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select userid from customer where userid = ?";
			
			ps = con.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				check = true;
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
		
		return check;
	}
	
	// 비밀번호 체크 
	public boolean checkLoginPw(String password) {
		boolean check = false;
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select password from customer where password = ?";
			
			ps = con.prepareStatement(query);
			ps.setString(1, password);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				check = true;
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
		
		return check;
	}
	
}
