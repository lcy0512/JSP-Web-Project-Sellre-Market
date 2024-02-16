package com.market.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.market.dao.MainViewDao;
import com.market.dto.MainViewDto;

public class MCpaging implements MCommand  {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
/*
	1. Date : 2024.02.14
	2. Author : Woody Jo
	3. Version : v1.0.0
	4. Description : 메인 body 페이지 데이터 가져오기 및 페이징 처리 
*/

		
		HttpSession session = request.getSession();
		MainViewDao dao = new MainViewDao();
		// get images
		Map<String, Object> datas = new HashMap<String, Object>();
		
		String id = (String) session.getAttribute("id");
		String href = null;
		
		int totalProductCount = 0;
		int cartCount = 0;
		
		// 장바구니 카운트 세기
		if (id != null) {
			cartCount = dao.cartCount(id);
		}
		
		int curPage = (int) session.getAttribute("curPage");
		
		// 한 페이지에 몇개를 보여줄 것인가?
		int countPerPage = 12;
		// 한 블럭에 몇개의 블럭을 보여줄 것인가?
		int countPerBlock = 5;
		
		// db에 limit의 시작점
		// ex) (1-1) * 5 = 0, (2-1) * 5 = 5, 
		int limitFrom = (curPage - 1) * countPerBlock;
		
		
		// 레시피
		if(session.getAttribute("headerCategory").equals("레시피")) {
			totalProductCount = dao.recipePageCount();
			if (session.getAttribute("alignCategory").equals("")) {
				href = "<a href='recipePage.do?curPage=";
			}
			else if (session.getAttribute("alignCategory").equals("낮은 가격순")) {
				href = "<a href='alignRecipeLowPrice.do?curPage=";
			}
			else if (session.getAttribute("alignCategory").equals("높은 가격순")) {
				href = "<a href='alignRecipeHighPrice.do?curPage=";
			}
			
		}
		
		// 신상품
		if(session.getAttribute("headerCategory").equals("신상품")) {
			totalProductCount = dao.newPageCount();
			if (session.getAttribute("alignCategory").equals("신상품순")) {
				href = "<a href='mainPage.do?curPage=";
			}
			else if (session.getAttribute("alignCategory").equals("낮은 가격순")) {
				href = "<a href='alignNewLowPrice.do?curPage=";
			}
			else if (session.getAttribute("alignCategory").equals("높은 가격순")) {
				href = "<a href='alignNewHighPrice.do?curPage=";
			}
			
		}
		
		// 베스트
		if(session.getAttribute("headerCategory").equals("베스트")) {
			totalProductCount = dao.bestPageCount();
			if (session.getAttribute("alignCategory").equals("베스트순")) {
				href = "<a href='bestProduct.do?curPage=";
			}
			else if (session.getAttribute("alignCategory").equals("낮은 가격순")) {
				href = "<a href='alignBestLowPrice.do?curPage=";
			}
			else if (session.getAttribute("alignCategory").equals("높은 가격순")) {
				href = "<a href='alignBestHighPrice.do?curPage=";
			}
			
		}
		
		// 블록 페이지 1~5, 6~10
		// ex) 1~5까지 = 1, 6~10 = 2
		int blockPage = ((curPage-1) / countPerBlock) + 1;
		
		// bloackPage가 1이면 시작 페이지가 '1 2 3 4 5'  2이면 '6 7 8 9 10'
		int blockStart = (blockPage-1) * countPerBlock + 1;
		
		// 마지막 페이지 정하기
		int endPage = (totalProductCount % countPerPage) == 0 ? totalProductCount / countPerPage : ((totalProductCount / countPerPage) + 1);
		
		session.setAttribute("cartCount", cartCount);
		session.setAttribute("curPage", curPage);
		
		datas.put("curPage", curPage);
		datas.put("endPage", endPage);
		datas.put("blockStart", blockStart);
		datas.put("endBlock", limitFrom + 5);
		datas.put("href", href);
		
		
		try {
			PrintWriter out = response.getWriter();
			out.print(new Gson().toJson(datas));
			out.flush();
		}
			catch (Exception e) {
				e.printStackTrace();
				System.out.println("errorrrr");
			}
		
		
	}

}
