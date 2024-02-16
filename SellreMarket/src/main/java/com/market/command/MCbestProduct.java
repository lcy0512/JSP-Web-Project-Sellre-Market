package com.market.command;

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

public class MCbestProduct implements MCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
/*
	1. Date : 2024.02.11
	2. Author : Woody Jo
	3. Version : v1.0.0
	4. Description : best제품 body 페이지 데이터 가져오기 및 페이징 처리 
*/
		
		HttpSession session = request.getSession();
		
		MainViewDao dao = new MainViewDao();
		
		String id = (String) session.getAttribute("id");
		
		int cartCount = 0;
		int curPage = (int) session.getAttribute("curPage");
		
		// 장바구니 카운트 세기
		if (id != null) {
			cartCount = dao.cartCount(id);
		}
		
		System.out.println(request.getAttribute("curPage") + " : mcnewProductPaging");
		
		
		// 한 페이지에 몇개를 보여줄 것인가?
		int countPerPage = 12;
		// 한 블럭에 몇개의 블럭을 보여줄 것인가?
		int countPerBlock = 5;
		
		// db에 limit의 시작점
		// ex) (1-1) * 5 = 0, (2-1) * 5 = 5, 
		int limitFrom = (curPage - 1) * countPerBlock;
		
		
		List<MainViewDto> bestProducts = dao.bestProductList(limitFrom, countPerPage);
		// 신제품 페이지 datas
		request.setAttribute("bestProducts", bestProducts);
		// 신제품 페이지 ad 이미지
		
		session.setAttribute("curPage", curPage);
		session.setAttribute("cartCount", cartCount);
	} 
}