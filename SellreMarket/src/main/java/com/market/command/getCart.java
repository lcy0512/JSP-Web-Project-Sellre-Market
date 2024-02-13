package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.MainViewDao;

public class getCart implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		MainViewDao dao = new MainViewDao();
//		int productid;
		String id = (String) session.getAttribute("customerid");
		int recipeid = (int) session.getAttribute("recipeid");
		
		if (id == null) {
			// 테스트용
			id = "admin";		
		}
		
//		dao.newPageClickCart(id, productid);
		dao.recipePageClickCart(id, recipeid);
	}
}
