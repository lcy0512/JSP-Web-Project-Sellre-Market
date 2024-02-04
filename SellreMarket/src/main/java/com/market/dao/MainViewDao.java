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
	
	// 제품 정보 불러오기 for 메인 화면 출력
	public List<MainViewDto> productView() {
		List<MainViewDto> dtos = new ArrayList<MainViewDto>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select y.yname, y.ysrc, ry.rcontent, format(i.price, 0) price, likecount "
					+ "					from youtuber y "
					+ "					join recipeofYoutuber ry on y.youtubeid = ry.youtubeid "
					+ "                    join recipelike rl on ry.recipeid = rl.recipeid "
					+ "					join productOfRecipe pr on ry.recipeid = pr.recipeid "
					+ "					join product p on p.productid = pr.productid "
					+ "					join price i on i.productid = p.productid";
			
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String yname = rs.getString("yname");
				String ysrc = rs.getString("ysrc");
				String rcontent = rs.getString("rcontent");
				String price = rs.getString("price");
				int like = rs.getInt("likecount");
				
				MainViewDto dto = new MainViewDto(yname, ysrc, rcontent, price, like);
				
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
}
