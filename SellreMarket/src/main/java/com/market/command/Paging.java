package com.market.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.MainViewDao;
import com.market.dto.MainViewDto;

public class Paging implements MCommand {

	@Override
	public void execute(HttpServletRequest reqeust, HttpServletResponse response) {
		
		MainViewDao dao = new MainViewDao();
		
		
		int curPage = 0;
		
		// 처음에 받아오는 페이지가 값이 없는 경우는 1로 설정하기 위한 트라이
		try {
			curPage = Integer.parseInt(reqeust.getParameter("curPage"));
		}
		catch (Exception e) {
			curPage = 1;
		}
		
		// 전체 페이지 수를 카운트하여 가져옴
		int totalpageCount = dao.totalpageCount();
		// 한 페이지에 몇개를 넣을 것인가?
		int eachPageCount = 5;
		
		int limitFrom = (curPage - 1) * eachPageCount;
		
		// 블록 페이지 1~5, 6~10
		int blockPage = ((curPage-1) / eachPageCount) + 1;
		
		int blockStart = (blockPage-1) * eachPageCount + 1;
		
		List<MainViewDto> dtos = dao.productView(limitFrom, eachPageCount);
		
		// 마지막 페이지 정하기
		int endPage = (totalpageCount / eachPageCount) == 0 ? totalpageCount / eachPageCount : (totalpageCount / eachPageCount) + 1 ;
		
		reqeust.setAttribute("curPage", curPage);
		reqeust.setAttribute("endPage", endPage);
		reqeust.setAttribute("dtos", dtos);
		reqeust.setAttribute("blockStart", blockStart);
		
	} 
}
