package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminOrderDao;

public class MAdminOrderProduct implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int count = Integer.parseInt(request.getParameter("count"));
		int productid = Integer.parseInt(request.getParameter("productid"));
		String content = request.getParameter("content");
		
		AdminOrderDao dao = new AdminOrderDao();
		int num1 = dao.inputOrder(count, productid, content);
		int num2 = dao.updateStock(count, productid);
		
		request.setAttribute("total", num1+num2);
	}

}
