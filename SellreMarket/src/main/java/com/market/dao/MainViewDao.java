package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.market.dto.MainViewDto;


public class MainViewDao {
	
/*
	1. Date : 2024.02.02
	2. Author : Woody Jo
	3. Version : v1.0.0
	4. Description : 메인 body 페이지 Dto 
*/
	
	DataSource dataSource;
	
	
	public MainViewDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/sellreMarket");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// Create
	public void insertCart(int qty, int productId) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "insert into cart (qty, userid, productid) values (?, admin, ?)";
			
			ps = con.prepareStatement(query);
			
			ps.setInt(1, qty);
			ps.setInt(2, productId);
			
			ps.executeUpdate();
				
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if (ps != null) ps.close();
				if (con != null) con.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	// 제품 정보 불러오기 for 메인 화면 출력
	public List<MainViewDto> productView(int limitFrom, int eachPageCount) {
		List<MainViewDto> dtos = new ArrayList<MainViewDto>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select y.yname, y.ysrc, y.ytitle, format(i.price, 0) price, likecount, ry.recipeid, p.productid "
					+ "					from youtuber y "
					+ "					join recipeofYoutuber ry on y.youtubeid = ry.youtubeid "
					+ "					left join recipelike rl on ry.recipeid = rl.recipeid "
					+ "					join productOfRecipe pr on ry.recipeid = pr.recipeid "
					+ "					join product p on p.productid = pr.productid "
					+ "					join price i on i.productid = p.productid "
					+ "                    order by y.youtubeid desc "
					+ "					limit ?, ?";
			
			ps = con.prepareStatement(query);
			ps.setInt(1, limitFrom);
			ps.setInt(2, eachPageCount);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String yname = rs.getString("yname");
				String ysrc = rs.getString("ysrc");
				String ytitle = rs.getString("ytitle");
				String price = rs.getString("price");
				int like = rs.getInt("likecount");
				int recipeid = rs.getInt("recipeid");
				int productid = rs.getInt("productid");
				
				MainViewDto dto = new MainViewDto(yname, ysrc, ytitle, price, like, recipeid, productid);
				
				dtos.add(dto);
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
		return dtos;
	}
	
	// 할인 이벤트 이미지들 저장
	public List<MainViewDto> getEventImgs() {
		List<MainViewDto> dtos = new ArrayList<MainViewDto>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select img from event";
			
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String img = rs.getString("img");
				
				MainViewDto dto = new MainViewDto(img);
				
				dtos.add(dto);
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
		return dtos;
	}
	
	// paging을 위한 count 세기
	public int totalpageCount() {
		int amount = 0;
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select count(*) count "
					+ "					from youtuber y "
					+ "					join recipeofYoutuber ry on y.youtubeid = ry.youtubeid "
					+ "					left join recipelike rl on ry.recipeid = rl.recipeid "
					+ "					join productOfRecipe pr on ry.recipeid = pr.recipeid "
					+ "					join product p on p.productid = pr.productid "
					+ "					join price i on i.productid = p.productid "
					+ "					order by y.youtubeid desc";
			
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				amount = rs.getInt(1);
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
		return amount;
	}
	
	public int clickCart(String rContent) {
		
		int recipeId = 0;
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		try {
			con = dataSource.getConnection();
			
			String query = "select recipeid from recipeOfYoutuber where rcontent = ?";
			
			ps = con.prepareStatement(query);
			
			ps.setString(1, rContent);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				recipeId = rs.getInt("recipeid");
			}
			System.out.println(rContent + " inside dao");
			System.out.println(recipeId + " inside dao");
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
		return recipeId;
		
	}
	
}