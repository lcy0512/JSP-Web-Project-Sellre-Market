package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.MainViewDao;

public class Paging implements MCommand {

	int startNo; // 페이지 블록 시작번호
	int endNo; // 페이지 블록 끝 번호
	int realEnd; // 게시물 끝 페이지 번호 
	boolean prev;
	boolean next;
	int total; // 총 게시물 수
	int pageNo;// 요청한 페이지 번호
	
	@Override
	public void execute(HttpServletRequest reqeust, HttpServletResponse response) {
		
		MainViewDao dao = new MainViewDao();
		
		int cPage;
		
		String tempPage = reqeust.getParameter("page");
		 
		// cPage(현재 페이지 정하기) 값이 없는 경우 1로 설정
		if (tempPage == null || tempPage.length() == 0) {
		    cPage = 1;
		}
		try {
		    cPage = Integer.parseInt(tempPage);
		} catch (NumberFormatException e) {
		    cPage = 1;
		}
		
		// 한 페이지 당 몇개의 데이터를 넣을 것인가 = 12개
		int eachPage = 12;
		
		// 페이지 한 묶음을 몇개로 하겠는가? = 5묶음
		int block = 5;
		
		
		
	} 
	
	
	
}
