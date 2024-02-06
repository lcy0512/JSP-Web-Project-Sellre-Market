package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.command.MCommand;
import com.market.dao.AdminProductDao;
import com.market.dto.AdminProductDto;
import com.market.dto.PageInfo;

public class MAdminProductCount implements MCommand{

	@Override
	public void execute(HttpServletRequest reqeust, HttpServletResponse response) {
		
		
		int listCount; 		//현재 총 게시글 개수
		int currentPage; 	//현재 페이지(사용자가 요청한 페이지)
		int pageLimit = 10;		//페이지 하단에 보여질 페이지 최대 개수
		int boardLimit = 10; 	//한 페이지 내에 보여질 게시글 최대 갯수 
		
		int maxPage; 		//가장 마지막 페이지(총 페이지 수)
		int startPage; 		//페이징 바의 시작수 
		int endPage;		//페이징 바의 끝 수
		
		int prev;
		int next;
	
		//총 게시글 갯수
		listCount = new AdminProductDao().getProductCnt();
		
		//현재 페이지
		currentPage = Integer.parseInt(reqeust.getParameter("pageNum"));
		
		/*
		 * maxPage : 제일 마지막 페이지 수
		 * listCount, boardLimit 영향받음
		 * 
		 *  listCount를 더블형으로 바꿔 boardLimit로 나누고 올림처리 => maxPage
		 */
		maxPage = (int) Math.ceil((double)listCount / boardLimit);
		
		
		/*
		 * startPage : 페이징바의 시작수 
		 * pageLimit, currentPage 영향받음
		 * 
		 *  페이징 목록이 10개 => startPage : 1, 11, 21, 31 .. => n * pageLimit + 1
		 *   currentPage 1 ~ 10  => n = 0
		 *   currentPage 11 ~ 20  => n = 1
		 *   currentPage 21 ~ 30  => n = 2
		 *   
		 *    currentPage - 1 / pageLimit => n
		 *  	0~9
		 *  	10~19
		 *  	20~29
		 *  
		 *  StartPage = n * pageLimit + 1/* pageLimit + 1
		 */
		//startPage = (currentPage - 1)/ pageLimit * pageLimit + 1;
		startPage = (int) Math.floor((currentPage - 1) / (double) pageLimit) * pageLimit + 1;

		
		/*
		 * endPage : 페이징바의 끝 수
		 * startPage, pageLimit의 영향을 받음, maxPage영향 받기도 함
		 * startPage : 1 => endPage : 10
		 * startPage : 11 => endPage : 20
		 * startPage : 21 => endPage : 30
		 */
		//endPage = startPage + pageLimit - 1;
		endPage = Math.min(startPage + pageLimit - 1, maxPage);
		
		//startPage가 11이여서 endPage가 20. 그런데 maxPage가 14밖에 없다면? endPage는 maxPage가 되게!! 
		if(maxPage > endPage) {
			endPage = maxPage;
		}

		
		//값 확인
		System.out.println("boardLimit : " + boardLimit);
		System.out.println("총 페이지 수 : " + maxPage);
		System.out.println("총 게시글 개수 : " + listCount);
		System.out.println("현재 페이지 : " + currentPage);
		System.out.println("하단에 보여질 페이지 최대 개수 : " + pageLimit);
		
	
		
		
		
		//페이징처리 자주 사용하기 위해 객체로 만들어버렷!!
		PageInfo pageInfo = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		//현재 요청한 페이지에 보여질 게시글 리스트 수만큼 조회
		ArrayList<AdminProductDto> list = new AdminProductDao().selectList(pageInfo);
		
		reqeust.setAttribute("pageInfo", pageInfo);
		reqeust.setAttribute("list", list);
		reqeust.setAttribute("listCount",listCount);
		
		
	}
	
}
