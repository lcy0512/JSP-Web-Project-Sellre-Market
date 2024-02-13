package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.MainViewDao;

public class getCartByRecipe implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		MainViewDao dao = new MainViewDao();
		
		String id = (String) session.getAttribute("id");
		int recipeid = (int) session.getAttribute("recipeid");
		
		dao.clickCartByrecipe(id, recipeid);
		int cartCount = dao.cartCount(id);
		
		session.setAttribute("cartCount", cartCount);
		
	}
}
