package com.market.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.MainViewDao;
import com.market.dto.MainViewDto;

public class Paging implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		MainViewDao dao = new MainViewDao();
		
		
		int curPage = 0;
		
		// 처음에 받아오는 페이지가 값이 없는 경우는 1로 설정하기 위한 트라이
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		catch (Exception e) {
			curPage = 1;
		}
		
		// 전체 페이지 수를 카운트하여 가져옴
		int totalpageCount = dao.totalpageCount();
		// 한 번에 몇개의 블럭을 보여줄 것인가?
		int blockGroup = 5;
		
		// db에 limit의 시작점 ex) (1-1) * 5 = 0, (2-1) * 5 = 5, 
		int limitFrom = (curPage - 1) * blockGroup;
		
		// 블록 페이지 1~5, 6~10
		// ex) 1~5까지 = 1, 6~10 = 2
		int blockPage = ((curPage-1) / blockGroup) + 1;
		
		// bloackPage가 1이면 시작 페이지가 1 2이면 6
		int blockStart = (blockPage-1) * blockGroup + 1;
		
		List<MainViewDto> dtos = dao.productView(limitFrom, blockGroup);
		
		// 마지막 페이지 정하기
		int endPage = (totalpageCount / blockGroup) == 0 ? totalpageCount / blockGroup : (totalpageCount / blockGroup) + 1 ;
		
		request.setAttribute("curPage", curPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("dtos", dtos);
		request.setAttribute("blockStart", blockStart);
		
	} 
}