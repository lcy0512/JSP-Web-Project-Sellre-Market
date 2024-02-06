package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.MainViewDao;

public class MCgetCart implements MCommand {

	@Override
	public void execute(HttpServletRequest reqeust, HttpServletResponse response) {
		HttpSession session = reqeust.getSession();
		MainViewDao dao = new MainViewDao();
//		
//		String name = (String) session.getAttribute("yName");
//		String content = (String) session.getAttribute("rContent");
//		String src = (String) session.getAttribute("ySrc");
//		String price = (String) session.getAttribute("price");
		int recipeId = (int) session.getAttribute("recipeId");
		
		// AJAX에서 전달한 key 데이터 받기
		int selectedNum = Integer.parseInt(reqeust.getParameter("selectedNumber"));
		
		dao.insertCart(selectedNum, recipeId);
		System.out.println("inside mcgetCart.java  = " + selectedNum + ", " + recipeId);
	}

}
