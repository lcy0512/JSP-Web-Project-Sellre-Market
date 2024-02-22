package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.AdminProductInputDao;

public class MInsertPrice implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		
		
		int price = Integer.parseInt(request.getParameter("price"));
		int productid = (int) session.getAttribute("pId");
		
		System.out.println("MInsertPrice : "+productid);
		
		AdminProductInputDao dao = new AdminProductInputDao();
		int result = dao.insertPrice(price, productid);
		
		request.setAttribute("result", result);
			
				
	}

}
