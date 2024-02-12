package com.market.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.MainViewDao;
import com.market.dto.MainViewDto;

public class MCnewProductPaging implements MCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
/*
	1. Date : 2024.02.10
	2. Author : Woody Jo
	3. Version : v1.0.0
	4. Description : 신제품 body 페이지 데이터 가져오기 및 페이징 처리 
*/
		
		MainViewDao dao = new MainViewDao();
		String getNewAdImg = dao.getNewAdImg();
		
		int curPage = 0;
		
		// 처음에 받아오는 페이지가 값이 없는 경우는 1로 설정하기 위한 트라이
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		catch (Exception e) {
			curPage = 1;
		}
		
		// 전체 페이지 수를 카운트하여 가져옴
		int totalProductCount = dao.newPageCount();
		System.out.println(totalProductCount + " new product total page");
		// 한 페이지에 몇개를 보여줄 것인가?
		int countPerPage = 12;
		// 한 블럭에 몇개의 블럭을 보여줄 것인가?
		int countPerBlock = 5;
		
		// db에 limit의 시작점
		// ex) (1-1) * 5 = 0, (2-1) * 5 = 5, 
		int limitFrom = (curPage - 1) * countPerBlock;
		System.out.println(limitFrom + " limit from new product dao");
		
		List<MainViewDto> newProducts = dao.newProductList(limitFrom, countPerPage);
		// 블록 페이지 1~5, 6~10
		// ex) 1~5까지 = 1, 6~10 = 2
		int blockPage = ((curPage-1) / countPerBlock) + 1;
		
		// bloackPage가 1이면 시작 페이지가 '1 2 3 4 5'  2이면 '6 7 8 9 10'
		// 그래서 시작 페이지가 1, 6, 11 이렇게 나온다.
		int blockStart = (blockPage-1) * countPerBlock + 1;
		
		
		// 수정필요 @@@@@@@@@@@@@@@@@@@@@@@@@@
		System.out.println((totalProductCount / countPerPage) +  " ??????");
		// 마지막 페이지 정하기
		int endPage = (totalProductCount / countPerPage) == 0 ? totalProductCount / countPerPage : ((totalProductCount / countPerPage) + 1);
		// 수정필요 @@@@@@@@@@@@@@@@@@@@@@@@@@
		System.out.println(curPage + " curPage");
		System.out.println(endPage + " endPage");
		System.out.println(blockStart + " blockStart");
		request.setAttribute("curPage", curPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("blockStart", blockStart);
		// 신제품 페이지 datas
		request.setAttribute("newProducts", newProducts);
		// 신제품 페이지 ad 이미지
		request.setAttribute("getNewAdImg", getNewAdImg);
	} 
}
