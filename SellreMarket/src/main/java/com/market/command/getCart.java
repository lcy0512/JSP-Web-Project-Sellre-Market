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
		
		String rContent = (String) session.getAttribute("rContent");
		int recipeId = dao.clickCart(rContent);
		
		request.setAttribute("recipeId", recipeId);
		
		System.out.println("clickdata.java  = " + rContent + ", " + recipeId);
		
	}

}
