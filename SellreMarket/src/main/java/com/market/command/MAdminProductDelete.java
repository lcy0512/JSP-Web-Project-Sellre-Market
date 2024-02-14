package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminProductDao;


public class MAdminProductDelete implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int productid = Integer.parseInt(request.getParameter("productid"));
		
		AdminProductDao dao = new AdminProductDao();
		int num = dao.deleteProduct(productid);
		
		request.setAttribute("num", num);
	}
}
