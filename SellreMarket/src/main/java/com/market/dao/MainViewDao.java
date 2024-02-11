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
	
	// 장바구니 담기 클릭 시 
	public void mainPageClickCart(String id, int recipeid) {
		
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
	public void newPageClickCart(String id, int productid) {
		
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
	
	
	// 제품 정보 불러오기 for 메인 화면 출력
	public List<MainViewDto> productView(int limitFrom, int countPerPage) {
		List<MainViewDto> dtos = new ArrayList<MainViewDto>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String query = "select y.yname, y.ysrc, y.ytitle, format(i.price, 0) price, likecount, ry.recipeid"
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
			ps.setInt(2, countPerPage);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String yname = rs.getString("yname");
				String ysrc = rs.getString("ysrc");
				String ytitle = rs.getString("ytitle");
				String price = rs.getString("price");
				int like = rs.getInt("likecount");
				int recipeid = rs.getInt("recipeid");
				
				MainViewDto dto = new MainViewDto(yname, ysrc, ytitle, price, like, recipeid);
				
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
			
			String query = "select distinct format(pr.price, 0) price, p.pname, pi.image, pl.likecount likecount, p.productid "
					+ "from price pr "
					+ "join product p on p.productid = pr.productid "
					+ "join product_image pi on pi.productid = p.productid "
					+ "left join productlike pl on pl.productid = p.productid "
					+ "where pinsertdate >= now() - interval 2 week and pinsertdate <= now() "
					+ "order by p.pname desc "
					+ "limit ?, ?";
			
			ps = con.prepareStatement(query);
			ps.setInt(1, limitFrom);
			ps.setInt(2, countPerPage);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String pname = rs.getString("pname");
				String price = rs.getString("price");
				String pimage = rs.getString("image");
				int plikecount = rs.getInt("likecount");
				int productid = rs.getInt("productid");
				
				MainViewDto dto = new MainViewDto(pname, price, pimage, plikecount, productid);
				
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
			
			String query = "select distinct format(pr.price, 0) price, p.pname, pi.image, pl.likecount likecount, p.productid "
					+ "from price pr "
					+ "join product p on p.productid = pr.productid "
					+ "join product_image pi on pi.productid = p.productid "
					+ "left join productlike pl on pl.productid = p.productid "
					+ "where pinsertdate >= now() - interval 2 week and pinsertdate <= now() "
					+ "order by price desc "
					+ "limit ?, ?";
			
			ps = con.prepareStatement(query);
			ps.setInt(1, limitFrom);
			ps.setInt(2, countPerPage);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String pname = rs.getString("pname");
				String price = rs.getString("price");
				String pimage = rs.getString("image");
				int plikecount = rs.getInt("likecount");
				int productid = rs.getInt("productid");
				
				MainViewDto dto = new MainViewDto(pname, price, pimage, plikecount, productid);
				
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
			
			String query = "select distinct format(pr.price, 0) price, p.pname, pi.image, pl.likecount likecount, p.productid "
					+ "from price pr "
					+ "join product p on p.productid = pr.productid "
					+ "join product_image pi on pi.productid = p.productid "
					+ "left join productlike pl on pl.productid = p.productid "
					+ "where pinsertdate >= now() - interval 2 week and pinsertdate <= now() "
					+ "order by price "
					+ "limit ?, ?";
			
			ps = con.prepareStatement(query);
			ps.setInt(1, limitFrom);
			ps.setInt(2, countPerPage);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String pname = rs.getString("pname");
				String price = rs.getString("price");
				String pimage = rs.getString("image");
				int plikecount = rs.getInt("likecount");
				int productid = rs.getInt("productid");
				
				MainViewDto dto = new MainViewDto(pname, price, pimage, plikecount, productid);
				
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
			
			String query = "select distinct format(pr.price, 0) price, p.pname, pi.image, sum(pl.likecount) likecount, p.productid "
					+ "from product p "
					+ "left join product_image pi on p.productid = pi.productid "
					+ "left join price pr on p.productid = pr.productid "
					+ "left join productlike pl on p.productid = pl.productid "
					+ "group by price, p.pname, pi.image, p.productid "
					+ "order by likecount desc "
					+ "limit ?, ?";
			
			ps = con.prepareStatement(query);
			ps.setInt(1, limitFrom);
			ps.setInt(2, countPerPage);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String pname = rs.getString("pname");
				String price = rs.getString("price");
				String pimage = rs.getString("image");
				int plikecount = rs.getInt("likecount");
				int productid = rs.getInt("productid");
				
				MainViewDto dto = new MainViewDto(pname, price, pimage, plikecount, productid);
				
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
			
			String query = "select distinct format(pr.price, 0) price, p.pname, pi.image, pl.likecount likecount, p.productid "
					+ "from price pr "
					+ "join product p on p.productid = pr.productid "
					+ "join product_image pi on pi.productid = p.productid "
					+ "left join productlike pl on pl.productid = p.productid "
					+ "where pinsertdate >= now() - interval 2 week and pinsertdate <= now() "
					+ "order by price desc "
					+ "limit ?, ?";
			
			ps = con.prepareStatement(query);
			ps.setInt(1, limitFrom);
			ps.setInt(2, countPerPage);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String pname = rs.getString("pname");
				String price = rs.getString("price");
				String pimage = rs.getString("image");
				int plikecount = rs.getInt("likecount");
				int productid = rs.getInt("productid");
				
				MainViewDto dto = new MainViewDto(pname, price, pimage, plikecount, productid);
				
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
			
			String query = "select distinct format(pr.price, 0) price, p.pname, pi.image, pl.likecount likecount, p.productid "
					+ "from price pr "
					+ "join product p on p.productid = pr.productid "
					+ "join product_image pi on pi.productid = p.productid "
					+ "left join productlike pl on pl.productid = p.productid "
					+ "where pinsertdate >= now() - interval 2 week and pinsertdate <= now() "
					+ "order by price "
					+ "limit ?, ?";
			
			ps = con.prepareStatement(query);
			ps.setInt(1, limitFrom);
			ps.setInt(2, countPerPage);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String pname = rs.getString("pname");
				String price = rs.getString("price");
				String pimage = rs.getString("image");
				int plikecount = rs.getInt("likecount");
				int productid = rs.getInt("productid");
				
				MainViewDto dto = new MainViewDto(pname, price, pimage, plikecount, productid);
				
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
	public List<MainViewDto> getMainAdImgs() {
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
	public int mainPageCount() {
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
			
			String query = "SELECT COUNT(*) AS count "
					+ "FROM ( "
					+ "    SELECT DISTINCT pr.price, p.pname, pi.image, pl.likecount "
					+ "    FROM price pr "
					+ "    JOIN product p ON p.productid = pr.productid "
					+ "    JOIN product_image pi ON pi.productid = p.productid "
					+ "    LEFT JOIN productlike pl ON pl.productid = p.productid "
					+ "    ORDER BY p.pname DESC "
					+ ") AS subquery";
			
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
}