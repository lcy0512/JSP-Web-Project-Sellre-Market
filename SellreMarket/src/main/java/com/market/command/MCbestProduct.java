package com.market.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.MainViewDao;
import com.market.dto.MainViewDto;

public class MCbestProduct implements MCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
/*
	1. Date : 2024.02.11
	2. Author : Woody Jo
	3. Version : v1.0.0
	4. Description : best제품 body 페이지 데이터 가져오기 및 페이징 처리 
*/
		
		
		MainViewDao dao = new MainViewDao();
		
		int curPage = 0;
		
		System.out.println(request.getAttribute("curPage") + " curPage adsfkalsdfnlasnfadnsfnal");
		// 처음에 받아오는 페이지가 값이 없는 경우는 1로 설정하기 위한 트라이
		try {
			curPage = (int) (request.getAttribute("curPage"));
		}
		catch (Exception e) {
			curPage = 1;
		}
		
		System.out.println("bestProduct command curPage : "  + curPage);
		// 전체 페이지 수를 카운트하여 가져옴
		int totalProductCount = dao.bestPageCount();
		// 한 페이지에 몇개를 보여줄 것인가?
		int countPerPage = 12;
		// 한 블럭에 몇개의 블럭을 보여줄 것인가?
		int countPerBlock = 5;
		
		// db에 limit의 시작점
		// ex) (1-1) * 5 = 0, (2-1) * 5 = 5, 
		int limitFrom = (curPage - 1) * countPerBlock;
		
		List<MainViewDto> bestProducts = dao.bestProductList(limitFrom, countPerPage);
		// 블록 페이지 1~5, 6~10
		// ex) 1~5까지 = 1, 6~10 = 2
		int blockPage = ((curPage-1) / countPerBlock) + 1;
		
		// bloackPage가 1이면 시작 페이지가 '1 2 3 4 5'  2이면 '6 7 8 9 10'
		// 그래서 시작 페이지가 1, 6, 11 이렇게 나온다.
		int blockStart = (blockPage-1) * countPerBlock + 1;
		
		
		// 마지막 페이지 정하기
		int endPage = (totalProductCount % countPerPage) == 0 ? totalProductCount / countPerPage : ((totalProductCount / countPerPage) + 1);
		
		request.setAttribute("curPage", curPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("blockStart", blockStart);
		
		// 신제품 페이지 datas
		request.setAttribute("bestProducts", bestProducts);
	} 
}
