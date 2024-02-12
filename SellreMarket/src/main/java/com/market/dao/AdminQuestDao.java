package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.market.dto.AdminCategoryDto;
import com.market.dto.AdminQuestDto;

public class AdminQuestDao {

	DataSource dataSource;
	
	/************************************************************************************************
	 * Function : context.xml에 설정한 db이름을 가져온다. 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	public AdminQuestDao() {
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
			String query = "select count(inquiryid) from personal_inquiry";
		
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
	public ArrayList<AdminQuestDto> selectList(int index_no) {
		
		ArrayList<AdminQuestDto> list = new ArrayList<AdminQuestDto>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = 
							"""
							select inquiryid, intitle, date(insertdate), status from personal_inquiry
							order by inquiryid desc limit ?, 15
				
					"""; //limit 시작번호, 출력갯수
			

			ps = conn.prepareStatement(query);
			ps.setInt(1, index_no);
			
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminQuestDto quest = new AdminQuestDto();
				quest.setInquiryid(rs.getInt(1));
				quest.setIntitle(rs.getString(2));
				quest.setInsertdate(rs.getString(3));
				quest.setStatus(rs.getString(4));
				
				list.add(quest);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/************************************************************************************************
	 * Function : 문의내용 상세
	 * @param 	: 문의 id  
	 * @return 	: ArrayList
	************************************************************************************************/
	public ArrayList<AdminQuestDto> questDetail(int id) {
		
		ArrayList<AdminQuestDto> list = new ArrayList<AdminQuestDto>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = 
							"""
							select inquiryid, intitle, incontent, inimage, date(insertdate), answer from personal_inquiry
							where inquiryid= ?;
							
							"""; 
			

			ps = conn.prepareStatement(query);
			
			ps.setInt(1, id);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminQuestDto quest = new AdminQuestDto();
				quest.setInquiryid(rs.getInt(1));
				quest.setIntitle(rs.getString(2));
				quest.setIncontent(rs.getString(3));
				quest.setInimage(rs.getString(4));
				quest.setInsertdate(rs.getString(5));
				quest.setAnswer(rs.getString(6));
				
				list.add(quest);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	/************************************************************************************************
	 * Function : 답변 등록하기(update)
	 * @param 	: 해당 문의 id, answer
	 * @return 	: int
	************************************************************************************************/
	public int insertQuest(String answer, int inquiryid) {
		
		int num = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();	
			String query = """
							update personal_inquiry set 
							answer = ?, status = ?, answerdate = sysdate()
							where inquiryid = ?

							""";
			ps = conn.prepareStatement(query);
			ps.setString(1, answer);
			ps.setString(2, "답변완료");
			ps.setInt(3, inquiryid);
			
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
