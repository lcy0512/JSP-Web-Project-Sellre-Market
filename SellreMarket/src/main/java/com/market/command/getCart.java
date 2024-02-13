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
		String id = (String) session.getAttribute("id");
		
		
		int recipeid = (int) session.getAttribute("recipeid");
		int productid = (int) session.getAttribute("productid");
		
		if (recipeid > 0) {
			dao.recipePageClickCart(id, recipeid);
		}
		else if (productid > 0) {
			dao.newPageClickCart(id, productid);
		}
		
		else System.out.println("?????????? inside getCart dao");
	}
}
