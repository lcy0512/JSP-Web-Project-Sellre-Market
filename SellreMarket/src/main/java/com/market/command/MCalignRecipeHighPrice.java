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

public class MCalignRecipeHighPrice implements MCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		/*
		1. Date : 2024.02.12
		2. Author : Woody Jo
		3. Version : v1.0.0
		4. Description : 레시피 높은 가격순 정리 
	*/
			
		HttpSession session = request.getSession();
		
		MainViewDao dao = new MainViewDao();
		// get images
		List<MainViewDto> getRecipeAdImgs =  dao.getRecipeAdImgs();
		
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
		
		
		List<MainViewDto> productList = dao.alignRecipeHighPrice(limitFrom, countPerPage);
		// 신제품 페이지 datas
		request.setAttribute("productList", productList);
		// 신제품 페이지 ad 이미지
		request.setAttribute("getRecipeAdImgs", getRecipeAdImgs);
		
		session.setAttribute("curPage", curPage);
		session.setAttribute("cartCount", cartCount);
	} 
}