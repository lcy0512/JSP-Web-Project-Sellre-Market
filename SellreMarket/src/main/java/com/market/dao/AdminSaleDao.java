package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.market.dto.AdminBrandDto;
import com.market.dto.AdminSaleDto;

public class AdminSaleDao {

	DataSource dataSource;
	
	/************************************************************************************************
	 * Function : context.xml에 설정한 db이름을 가져온다. 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	public AdminSaleDao() {
		try {
			
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/sellreMarket");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/************************************************************************************************
	 * Function : 매출현황 가져오기 
	 * @param 	: null
	 * @return 	: ArrayList
	************************************************************************************************/
	public ArrayList<AdminSaleDto> selectList() {
		
		ArrayList<AdminSaleDto> list = new ArrayList<AdminSaleDto>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = 
							"""
								select date(purchasedate), sum(amount * price) as total
								from purchase pur
								left join price p on p.productid = pur.productid
								where purchasedate between date_add(now(), interval -1 week) and now()
								group by purchasedate;
				
							"""; 
			

			ps = conn.prepareStatement(query);
			
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminSaleDto sale = new AdminSaleDto();
				sale.setPurchasedate(rs.getString(1));
				sale.setTotal(rs.getInt(2));
				
				list.add(sale);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	/************************************************************************************************
	 * Function : 월초 ~ 월말 기준 인기제품 top5 가져오기 
	 * @param 	: null
	 * @return 	: ArrayList
	************************************************************************************************/
	public ArrayList<AdminSaleDto> popularList() {
		
		ArrayList<AdminSaleDto> list = new ArrayList<AdminSaleDto>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = 
							"""
								select sum(amount) as amount, p.productid, p.pname
								from purchase pur
								left join product p on p.productid = pur.productid
								where substring(purchasedate, 1, 4) = year(sysdate()) and substring(purchasedate,6,8) = month(sysdate())
								group by  productid
								order by amount desc limit 5
				
							"""; 
			

			ps = conn.prepareStatement(query);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminSaleDto sale = new AdminSaleDto();
				sale.setAmount(rs.getInt(1));
				sale.setName(rs.getString(3));
				
				list.add(sale);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/************************************************************************************************
	 * Function : 가입 성비 조회
	 * @param 	: null
	 * @return 	: ArrayList
	************************************************************************************************/
	public ArrayList<AdminSaleDto> genderList() {
		
		ArrayList<AdminSaleDto> list = new ArrayList<AdminSaleDto>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = 
							"""
								select 
									case 
										when gender = 0 then '남자'
										when gender = 1 then '여자'
								        else '선택안함' end as name,
									count(gender) as genderCnt
								from customer
									group by gender
				
							"""; 
			

			ps = conn.prepareStatement(query);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminSaleDto sale = new AdminSaleDto();
				sale.setName(rs.getString(1));
				sale.setGenderCnt(rs.getInt(2));
				
				list.add(sale);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	/************************************************************************************************
	 * Function : 많이 주문한 고객 조회
	 * @param 	: null
	 * @return 	: ArrayList
	************************************************************************************************/
	public ArrayList<AdminSaleDto> userList() {
		
		ArrayList<AdminSaleDto> list = new ArrayList<AdminSaleDto>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = 
							"""
								select sum(amount) as amount, pur.userid, c.name
								from purchase pur
								left join customer c on c.userid = pur.userid
								group by  userid
								limit 5;
							"""; 
			

			ps = conn.prepareStatement(query);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminSaleDto sale = new AdminSaleDto();
				sale.setPurCnt(rs.getInt(1));
				sale.setUserid(rs.getString(2));
				sale.setName(rs.getString(3));
				
				list.add(sale);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}	
	
}
