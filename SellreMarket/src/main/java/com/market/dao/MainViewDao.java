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
	1. Date : 2024.02.12
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
	
	// 장바구니 담기 클릭 시 
	public void clickCartByrecipe(String id, int recipeid) {
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		try {
			con = dataSource.getConnection();
			
			String query = "insert into cart (qty, userid, recipeid) values (1, ? ,?);";
			
			ps = con.prepareStatement(query);
			
			ps.setString(1, id);
			ps.setInt(2, recipeid);
			
			ps.executeUpdate();
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
	}
	
	// 신제품 페이지 카트 클릭 시 insert 
	public void clickCartByproduct(String id, int productid) {
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		try {
			con = dataSource.getConnection();
			
			String query = "insert into cart (qty, userid, productid) values (1, ? ,?);";
			
			ps = con.prepareStatement(query);
			
			ps.setString(1, id);
			ps.setInt(2, productid);
			
			ps.executeUpdate();
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
	}
	
	
	// 제품 정보 불러오기 for recipe 화면 출력
	public List<MainViewDto> productView(int limitFrom, int countPerPage) {
		List<MainViewDto> dtos = new ArrayList<MainViewDto>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select y.yname, y.ysrc, y.ytitle, "
					+ "					( "
					+ "					CASE WHEN p.eventid = e.eventid THEN FORMAT(price - (price * salerate), 0) "
					+ "					ELSE FORMAT(price, 0) "
					+ "					END "
					+ "					) as dPrice, "
					+ "					format(i.price, 0) price, sum(likecount) as likecount, ry.recipeid, format((e.salerate * 100), 0) as salerate "
					+ "					from youtuber y "
					+ "					join recipeofYoutuber ry on y.youtubeid = ry.youtubeid "
					+ "					left join recipelike rl on ry.recipeid = rl.recipeid "
					+ "					join productOfRecipe pr on ry.recipeid = pr.recipeid "
					+ "					join product p on p.productid = pr.productid "
					+ "					left join event e on e.eventid = p.eventid "
					+ "					join price i on i.productid = p.productid "
					+ "					group by y.yname, y.ysrc, y.ytitle, dPrice, price, ry.recipeid, salerate "
					+ "					order by y.youtubeid desc "
					+ "					limit ?, ?";
			
			ps = con.prepareStatement(query);
			ps.setInt(1, limitFrom);
			ps.setInt(2, countPerPage);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String yname = rs.getString("yname");
				String ysrc = rs.getString("ysrc");
				String ytitle = rs.getString("ytitle");
				String price = rs.getString("price");
				String dPrice = rs.getString("dPrice");
				String recipelike = Integer.toString(rs.getInt("likecount"));
				int recipeid = rs.getInt("recipeid");
				String salerate = rs.getString("salerate");
				
				MainViewDto dto = new MainViewDto(yname, ysrc, ytitle, price, dPrice, recipelike, recipeid, salerate);
				
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
	
	// 레시피 낮은 가격순 불러오기 
	public List<MainViewDto> alignRecipeLowPrice(int limitFrom, int countPerPage) {
		List<MainViewDto> dtos = new ArrayList<MainViewDto>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select y.yname, y.ysrc, y.ytitle, "
					+ "( "
					+ "CASE WHEN p.eventid = e.eventid THEN FORMAT(price - (price * salerate), 0) "
					+ "       ELSE FORMAT(price, 0) "
					+ "  END "
					+ ") as dPrice, "
					+ "format(i.price, 0) price, sum(likecount) as likecount, ry.recipeid, format((e.salerate * 100), 0) as salerate "
					+ "from youtuber y "
					+ "join recipeofYoutuber ry on y.youtubeid = ry.youtubeid "
					+ "left join recipelike rl on ry.recipeid = rl.recipeid "
					+ "join productOfRecipe pr on ry.recipeid = pr.recipeid "
					+ "join product p on p.productid = pr.productid "
					+ "left join event e on e.eventid = p.eventid "
					+ "join price i on i.productid = p.productid "
					+ "group by y.yname, y.ysrc, y.ytitle, dPrice, price, ry.recipeid, salerate "
					+ "order by dPrice desc "
					+ "limit ?, ?";
			
			ps = con.prepareStatement(query);
			ps.setInt(1, limitFrom);
			ps.setInt(2, countPerPage);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String yname = rs.getString("yname");
				String ysrc = rs.getString("ysrc");
				String ytitle = rs.getString("ytitle");
				String price = rs.getString("price");
				String dPrice = rs.getString("dPrice");
				String recipelike = Integer.toString(rs.getInt("likecount"));
				int recipeid = rs.getInt("recipeid");
				String salerate = rs.getString("salerate");
				
				MainViewDto dto = new MainViewDto(yname, ysrc, ytitle, price, dPrice, recipelike, recipeid, salerate);
				
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
	
	// 레시피 높은 가격순 불러오기 
	public List<MainViewDto> alignRecipeHighPrice(int limitFrom, int countPerPage) {
		List<MainViewDto> dtos = new ArrayList<MainViewDto>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select y.yname, y.ysrc, y.ytitle, "
					+ "( "
					+ "CASE WHEN p.eventid = e.eventid THEN FORMAT(price - (price * salerate), 0) "
					+ "       ELSE FORMAT(price, 0) "
					+ "  END "
					+ ") as dPrice, "
					+ "format(i.price, 0) price, sum(likecount) as likecount, ry.recipeid, format((e.salerate * 100), 0) as salerate "
					+ "from youtuber y "
					+ "join recipeofYoutuber ry on y.youtubeid = ry.youtubeid "
					+ "left join recipelike rl on ry.recipeid = rl.recipeid "
					+ "join productOfRecipe pr on ry.recipeid = pr.recipeid "
					+ "join product p on p.productid = pr.productid "
					+ "left join event e on e.eventid = p.eventid "
					+ "join price i on i.productid = p.productid "
					+ "group by y.yname, y.ysrc, y.ytitle, dPrice, price, ry.recipeid, salerate "
					+ "order by dPrice "
					+ "limit ?, ?";
			
			ps = con.prepareStatement(query);
			ps.setInt(1, limitFrom);
			ps.setInt(2, countPerPage);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String yname = rs.getString("yname");
				String ysrc = rs.getString("ysrc");
				String ytitle = rs.getString("ytitle");
				String price = rs.getString("price");
				String dPrice = rs.getString("dPrice");
				String recipelike = Integer.toString(rs.getInt("likecount"));
				int recipeid = rs.getInt("recipeid");
				String salerate = rs.getString("salerate");
				
				MainViewDto dto = new MainViewDto(yname, ysrc, ytitle, price, dPrice, recipelike, recipeid, salerate);
				
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
	
	
	// 신제품 정보 불러오기 
	public List<MainViewDto> newProductList(int limitFrom, int countPerPage) {
		List<MainViewDto> dtos = new ArrayList<MainViewDto>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select distinct ( "
					+ "CASE WHEN p.eventid = e.eventid THEN FORMAT(price - (price * salerate), 0) "
					+ "       ELSE FORMAT(price, 0) "
					+ "  END "
					+ ") as dPrice, format(price, 0) as price, p.pname, pi.image, sum(pl.likecount) as likecount, "
					+ "p.productid, format((e.salerate * 100), 0) as salerate "
					+ "					from product p "
					+ "					left join price pr on pr.productid = p.productid "
					+ "					left join product_image pi on pi.productid = p.productid "
					+ "					left join productlike pl on pl.productid = p.productid "
					+ "                 left join event e on e.eventid = p.eventid "
					+ "                 where pinsertdate >= now() - interval 2 week and pinsertdate <= now() "
					+ "					group by dPrice, price, p.pname, pi.image, p.productid "
					+ "					order by p.productid desc "
					+ "					limit ?, ?";
			
			ps = con.prepareStatement(query);
			ps.setInt(1, limitFrom);
			ps.setInt(2, countPerPage);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String pname = rs.getString("pname");
				String price = rs.getString("price");
				String dPrice = rs.getString("dPrice");
				String pimage = rs.getString("image");
				String plikecount = Integer.toString(rs.getInt("likecount"));
				int productid = rs.getInt("productid");
				String salerate = rs.getString("salerate");
				
				MainViewDto dto = new MainViewDto(pname, price, dPrice, pimage, plikecount, productid, salerate);
				
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
	
	// 신제품 낮은 가격순 불러오기 
	public List<MainViewDto> alignNewLowPrice(int limitFrom, int countPerPage) {
		List<MainViewDto> dtos = new ArrayList<MainViewDto>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select distinct ( "
					+ "CASE WHEN p.eventid = e.eventid THEN FORMAT(price - (price * salerate), 0) "
					+ "       ELSE FORMAT(price, 0) "
					+ "  END "
					+ ") as dPrice, format(price, 0) as price, p.pname, pi.image, sum(pl.likecount) as likecount, "
					+ "p.productid, format((e.salerate * 100), 0) as salerate "
					+ "					from product p "
					+ "					left join price pr on pr.productid = p.productid "
					+ "					left join product_image pi on pi.productid = p.productid "
					+ "					left join productlike pl on pl.productid = p.productid "
					+ "                 left join event e on e.eventid = p.eventid "
					+ "                 where pinsertdate >= now() - interval 2 week and pinsertdate <= now() "
					+ "					group by dPrice, price, p.pname, pi.image, p.productid "
					+ "					order by dPrice desc "
					+ "					limit ?, ?";
			
			ps = con.prepareStatement(query);
			ps.setInt(1, limitFrom);
			ps.setInt(2, countPerPage);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String pname = rs.getString("pname");
				String price = rs.getString("price");
				String dPrice = rs.getString("dPrice");
				String pimage = rs.getString("image");
				String plikecount = Integer.toString(rs.getInt("likecount"));
				int productid = rs.getInt("productid");
				String salerate = rs.getString("salerate");
				
				MainViewDto dto = new MainViewDto(pname, price, dPrice, pimage, plikecount, productid, salerate);
				
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
	
	// 신제품 높은 가격순 불러오기 
	public List<MainViewDto> alignNewHighPrice(int limitFrom, int countPerPage) {
		List<MainViewDto> dtos = new ArrayList<MainViewDto>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select distinct ( "
					+ "CASE WHEN p.eventid = e.eventid THEN FORMAT(price - (price * salerate), 0) "
					+ "       ELSE FORMAT(price, 0) "
					+ "  END "
					+ ") as dPrice, format(price, 0) as price, p.pname, pi.image, sum(pl.likecount) as likecount, "
					+ "p.productid, format((e.salerate * 100), 0) as salerate "
					+ "					from product p "
					+ "					left join price pr on pr.productid = p.productid "
					+ "					left join product_image pi on pi.productid = p.productid "
					+ "					left join productlike pl on pl.productid = p.productid "
					+ "                 left join event e on e.eventid = p.eventid "
					+ "                 where pinsertdate >= now() - interval 2 week and pinsertdate <= now() "
					+ "					group by dPrice, price, p.pname, pi.image, p.productid "
					+ "					order by dPrice "
					+ "					limit ?, ?";
			
			ps = con.prepareStatement(query);
			ps.setInt(1, limitFrom);
			ps.setInt(2, countPerPage);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String pname = rs.getString("pname");
				String price = rs.getString("price");
				String dPrice = rs.getString("dPrice");
				String pimage = rs.getString("image");
				String plikecount = Integer.toString(rs.getInt("likecount"));
				int productid = rs.getInt("productid");
				String salerate = rs.getString("salerate");
				
				MainViewDto dto = new MainViewDto(pname, price, dPrice, pimage, plikecount, productid, salerate);
				
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
	
	// 베스트 상품 정보 불러오기 
	public List<MainViewDto> bestProductList(int limitFrom, int countPerPage) {
		List<MainViewDto> dtos = new ArrayList<MainViewDto>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select distinct ( "
					+ "					CASE WHEN p.eventid = e.eventid THEN FORMAT(price - (price * salerate), 0) "
					+ "					ELSE FORMAT(price, 0) "
					+ "					END "
					+ "					) as dPrice, format(price, 0) as price, p.pname, pi.image, sum(pl.likecount) as likecount, "
					+ "p.productid, format((e.salerate * 100), 0) as salerate "
					+ "					from product p "
					+ "					left join price pr on pr.productid = p.productid "
					+ "					left join product_image pi on pi.productid = p.productid "
					+ "					left join productlike pl on pl.productid = p.productid "
					+ "					left join event e on e.eventid = p.eventid "
					+ "					group by dPrice, price, p.pname, pi.image, p.productid "
					+ "					order by likecount desc "
					+ "					limit ?, ?";
			
			ps = con.prepareStatement(query);
			ps.setInt(1, limitFrom);
			ps.setInt(2, countPerPage);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String pname = rs.getString("pname");
				String price = rs.getString("price");
				String dPrice = rs.getString("dPrice");
				String pimage = rs.getString("image");
				String plikecount = Integer.toString(rs.getInt("likecount"));
				int productid = rs.getInt("productid");
				String salerate = rs.getString("salerate");
				
				MainViewDto dto = new MainViewDto(pname, price, dPrice, pimage, plikecount, productid, salerate);
				
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
	
	// 베트스 낮은 가격순 불러오기 
	public List<MainViewDto> alignBestLowPrice(int limitFrom, int countPerPage) {
		List<MainViewDto> dtos = new ArrayList<MainViewDto>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select distinct ( "
			+ "					CASE WHEN p.eventid = e.eventid THEN FORMAT(price - (price * salerate), 0) "
			+ "					ELSE FORMAT(price, 0) "
			+ "					END "
			+ "					) as dPrice, format(price, 0) as price, p.pname, pi.image, sum(pl.likecount) as likecount, "
			+ "p.productid, format((e.salerate * 100), 0) as salerate "
			+ "					from product p "
			+ "					left join price pr on pr.productid = p.productid "
			+ "					left join product_image pi on pi.productid = p.productid "
			+ "					left join productlike pl on pl.productid = p.productid "
			+ "					left join event e on e.eventid = p.eventid "
			+ "					group by dPrice, price, p.pname, pi.image, p.productid "
			+ "					order by dPrice desc "
			+ "					limit ?, ?";
			
			ps = con.prepareStatement(query);
			ps.setInt(1, limitFrom);
			ps.setInt(2, countPerPage);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String pname = rs.getString("pname");
				String price = rs.getString("price");
				String dPrice = rs.getString("dPrice");
				String pimage = rs.getString("image");
				String plikecount = Integer.toString(rs.getInt("likecount"));
				int productid = rs.getInt("productid");
				String salerate = rs.getString("salerate");
				
				MainViewDto dto = new MainViewDto(pname, price, dPrice, pimage, plikecount, productid, salerate);
				
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
	
	// 베스트 높은 가격순 불러오기 
	public List<MainViewDto> alignBestHighPrice(int limitFrom, int countPerPage) {
		List<MainViewDto> dtos = new ArrayList<MainViewDto>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select distinct ( "
					+ "					CASE WHEN p.eventid = e.eventid THEN FORMAT(price - (price * salerate), 0) "
					+ "					ELSE FORMAT(price, 0) "
					+ "					END "
					+ "					) as dPrice, format(price, 0) as price, p.pname, pi.image, sum(pl.likecount) as likecount, "
					+ "p.productid, format((e.salerate * 100), 0) as salerate "
					+ "					from product p "
					+ "					left join price pr on pr.productid = p.productid "
					+ "					left join product_image pi on pi.productid = p.productid "
					+ "					left join productlike pl on pl.productid = p.productid "
					+ "					left join event e on e.eventid = p.eventid "
					+ "					group by dPrice, price, p.pname, pi.image, p.productid "
					+ "					order by dPrice "
					+ "					limit ?, ?";
			
			ps = con.prepareStatement(query);
			ps.setInt(1, limitFrom);
			ps.setInt(2, countPerPage);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String pname = rs.getString("pname");
				String price = rs.getString("price");
				String dPrice = rs.getString("dPrice");
				String pimage = rs.getString("image");
				String plikecount = Integer.toString(rs.getInt("likecount"));
				int productid = rs.getInt("productid");
				String salerate = rs.getString("salerate");
				
				MainViewDto dto = new MainViewDto(pname, price, dPrice, pimage, plikecount, productid, salerate);
				
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
	
	// 레시피 할인 이벤트 이미지들 저장
	public List<MainViewDto> getRecipeAdImgs() {
		List<MainViewDto> dtos = new ArrayList<MainViewDto>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select img from event where category = 1";
			
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
	
	// 신제품 광고 이미지
	public String getNewAdImg() {
		String adImg = null;
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select max(img) img from event where category = 2";
			
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				adImg = rs.getString("img");
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
		return adImg;
	}
	
	// 메인 paging을 위한 count 세기
	public int recipePageCount() {
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
	
	// 신제품 paging을 위한 count 세기
	public int newPageCount() {
		int amount = 0;
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select count(*) from("
					+ "select distinct ( "
					+ "					CASE WHEN p.eventid = e.eventid THEN FORMAT(price - (price * salerate), 0) "
					+ "					       ELSE FORMAT(price, 0) "
					+ "					  END "
					+ "					) as dPrice, format(price, 0) as price, p.pname, pi.image, sum(pl.likecount) as likecount, "
					+ "					p.productid, format((e.salerate * 100), 0) as salerate "
					+ "					from product p "
					+ "					left join price pr on pr.productid = p.productid "
					+ "					left join product_image pi on pi.productid = p.productid "
					+ "					left join productlike pl on pl.productid = p.productid "
					+ "					left join event e on e.eventid = p.eventid "
					+ "					where pinsertdate >= now() - interval 2 week and pinsertdate <= now() "
					+ "					group by dPrice, price, p.pname, pi.image, p.productid "
					+ "					order by p.productid desc ) as subquery";
			
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
	
	// best paging을 위한 count 세기
	public int bestPageCount() {
		int amount = 0;
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select count(*) from ( "
					+ "select distinct format(pr.price, 0) price, p.pname, pi.image, sum(pl.likecount) likecount, p.productid "
					+ "from product p "
					+ "left join product_image pi on p.productid = pi.productid "
					+ "left join price pr on p.productid = pr.productid "
					+ "left join productlike pl on p.productid = pl.productid "
					+ "group by price, p.pname, pi.image, p.productid "
					+ "order by likecount desc) as subquery";
			
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
	
	// 카트의 count 세기
	public int cartCount(String id) {
		int amount = 0;
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select count(*) from cart where userid = ?";
			
			ps = con.prepareStatement(query);
			
			ps.setString(1, id);
			
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
}