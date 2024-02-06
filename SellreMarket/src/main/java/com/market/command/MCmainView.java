package com.market.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.MainViewDao;
import com.market.dto.MainViewDto;

public class MCmainView implements MCommand{
	
/*
	1. Date : 2024.02.02
	2. Author : Woody Jo
	3. Version : v1.0.0
	4. Description : 메인 body 페이지 Dto 
*/

	@Override
	public void execute(HttpServletRequest reqeust, HttpServletResponse response) {
		MainViewDao mainDao = new MainViewDao();
		
		
		List<MainViewDto> eventDtos =  mainDao.getEventImgs();
		
		
		// 페이징 처리를 위한@@@@@@@@@@@@@@@
		int curPage = 0;
		
		// 처음에 받아오는 페이지가 값이 없는 경우는 1로 설정하기 위한 트라이
		try {
			curPage = Integer.parseInt(reqeust.getParameter("curPage"));
		}
		catch (Exception e) {
			curPage = 1;
		}
		
		// 전체 페이지 수를 카운트하여 가져옴
		int totalpageCount = mainDao.totalpageCount();
		// 한 페이지에 몇개를 넣을 것인가?
		int eachPageCount = 12;
		
		int limitFrom = (curPage - 1) * eachPageCount;
		
		// product 정보 출력 
		List<MainViewDto> productDtos = mainDao.productView(limitFrom, eachPageCount);
		
		// 블록 페이지 1~5, 6~10
		int blockPage = ((curPage-1) / eachPageCount) + 1;
		
		int blockStart = (blockPage-1) * eachPageCount + 1;
		
//		List<MainViewDto> dtos = dao.productView(limitFrom, eachPageCount);
		
		// 마지막 페이지 정하기
		int endPage = (totalpageCount / eachPageCount) == 0 ? totalpageCount / eachPageCount : (totalpageCount / eachPageCount) + 1 ;
		
		reqeust.setAttribute("curPage", curPage);
		reqeust.setAttribute("endPage", endPage);
//		reqeust.setAttribute("dtos", dtos);
		reqeust.setAttribute("blockStart", blockStart);
		// 페이징 처리를 위한@@@@@@@@@@@@@@@
		
		
		reqeust.setAttribute("productList", productDtos);
		reqeust.setAttribute("eventImgs", eventDtos);
		
		
	}
}