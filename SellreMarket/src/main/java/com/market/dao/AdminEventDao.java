package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.market.dto.AdminCategoryDto;
import com.market.dto.AdminEventDto;
import com.oreilly.servlet.MultipartRequest;

public class AdminEventDao {

DataSource dataSource;
	
	/************************************************************************************************
	 * Function : context.xml에 설정한 db이름을 가져온다. 
	 * @param 	: null
	 * @return 	: null
	************************************************************************************************/
	public AdminEventDao() {
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
	public int getEventCnt() {
		int eventCnt = 0;
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = "select count(eventid) from event where status = 1";
		
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				eventCnt = rs.getInt(1);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return eventCnt;
	}
	
	
	/************************************************************************************************
	 * Function : 현재페이지에 해당하는 리스트 조회
	 * @param 	: PageInfo에 있는 페이징 정보
	 * @return 	: ArrayList
	************************************************************************************************/
	public ArrayList<AdminEventDto> selectList(int index_no) {
		
		ArrayList<AdminEventDto> list = new ArrayList<AdminEventDto>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = 
							"""
							select eventid, ename, econtent, date(startdate), date(enddate), salerate, img
						    from event where status = 1
						    order by eventid desc limit ?, 15;
				
					"""; //limit 시작번호, 출력갯수
			

			ps = conn.prepareStatement(query);
			
			ps.setInt(1, index_no);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminEventDto event = new AdminEventDto();
				event.setEventid(rs.getInt(1));
				event.setEname(rs.getString(2));
				event.setEcontent(rs.getString(3));
				event.setStartdate(rs.getString(4));
				event.setEnddate(rs.getString(5));
				event.setSalerate(rs.getInt(6));
				event.setImg(rs.getString(7));
				list.add(event);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	/************************************************************************************************
	 * Function : 이벤트 등록
	 * @param 	: 입력한 데이터 
	 * @return 	: int
	************************************************************************************************/
	public int insertEvent(String image, String ename, String econtent, String startdate, String enddate, int salerate, HttpServletRequest request, HttpServletResponse response) {
		int num = 0;
		String originalFileName = "";
		
		
		try {
			
			String path = request.getServletContext().getRealPath("/image");

			int maxSize = 1024 * 1024 * 1;
			
			MultipartRequest multi = new MultipartRequest(request, path, maxSize, "UTF-8");
			
			Enumeration<String> files = multi.getFileNames();
			
			//넘어온 form에서 file 태그가 있는지 확인
			if(files.hasMoreElements()) {
				String name = (String) files.nextElement(); //file 태그 이름
				System.out.println("name : "+name);
				originalFileName = multi.getOriginalFileName(name);  //사용자가 업로드한 file dlfma
				System.out.println("mul  : "+originalFileName);
			}
			Connection conn = null;
			PreparedStatement ps = null;
			
			String query = """
							insert into event (
								ename, econtent, startdate, enddate, salerate, img, status
							) values (?,?,?,?,?,?,'1')
							""";
			try {
				
				conn = dataSource.getConnection();
				ps = conn.prepareStatement(query);
				
				ps.setString(1, ename);
				ps.setString(2, econtent);
				ps.setString(3, startdate);
				ps.setString(4, enddate);
				ps.setInt(5, salerate);
				ps.setString(6, originalFileName);
				
				ps.executeUpdate();
				
			} catch(Exception e) {
				e.printStackTrace();
			}finally { 
				// 메모리정리
				try {
					if(ps != null) ps.close();
					if(conn != null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return num;
	}
	
	
	/************************************************************************************************
	 * Function : event 상세
	 * @param 	: eventid  
	 * @return 	: ArrayList
	************************************************************************************************/
	public ArrayList<AdminEventDto> eventDetail(int id) {
		
		ArrayList<AdminEventDto> list = new ArrayList<AdminEventDto>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			conn = dataSource.getConnection();
			String query = 
							"""
							select eventid, ename, econtent, date(startdate), date(enddate), salerate, img
						    from event where status = 1 and eventid = ?
							
							"""; 
			

			ps = conn.prepareStatement(query);
			
			ps.setInt(1, id);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				AdminEventDto event = new AdminEventDto();
				event.setEventid(rs.getInt(1));
				event.setEname(rs.getString(2));
				event.setEcontent(rs.getString(3));
				event.setStartdate(rs.getString(4));
				event.setEnddate(rs.getString(5));
				event.setSalerate(rs.getInt(6));
				event.setImg(rs.getString(7));
				
				list.add(event);
			}
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/************************************************************************************************
	 * Function : 이벤트 수정
	 * @param 	: 입력한 대분류, 중분류 
	 * @return 	: int
	************************************************************************************************/
	public int updateEvent(String ename, String econtent, String startdate, String enddate, int salerate, int eventid) {
		int num = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();	
			String query = """
							update event set
							ename =?,
							econtent =?,
							startdate =?,
							enddate =?,
							salerate =?
							where eventid = ?

							""";
			ps = conn.prepareStatement(query);
			//ps.setString(1, image);
			ps.setString(1, ename);
			ps.setString(2, econtent);
			ps.setString(3, startdate);
			ps.setString(4, enddate);
			ps.setInt(5, salerate);
			ps.setInt(6, eventid);
			
			ps.executeUpdate();
			num++;
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			return num;
		}
		return num;
	}
	
	/************************************************************************************************
	 * Function : 이벤트 삭제
	 * @param 	: eventid
	 * @return 	: int
	************************************************************************************************/
	public int deleteEvent(int eventid) {
		
		int num = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = dataSource.getConnection();	
			String query = """
							update event set 
							status = 0
							where eventid = ?
							
							""";
			ps = conn.prepareStatement(query);
			ps.setInt(1, eventid);
			
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

