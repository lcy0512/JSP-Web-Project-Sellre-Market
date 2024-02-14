package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.MainViewDao;

public class getCartByProduct implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		MainViewDao dao = new MainViewDao();
		
		String id = (String) session.getAttribute("id");
		int productid = (int) session.getAttribute("productid");
		
		dao.clickCartByproduct(id, productid);
		int cartCount = dao.cartCount(id);
		
		session.setAttribute("cartCount", cartCount);
		
	}
}
