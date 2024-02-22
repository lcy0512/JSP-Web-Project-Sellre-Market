package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.AdminProductInputDao;

public class MinsertCategoryToProduct implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String type = request.getParameter("type");
		String subtype = request.getParameter("subtype");
		int productid = (int) session.getAttribute("pId");
		
		AdminProductInputDao dao = new AdminProductInputDao();
		int result = dao.insertCategory(type, subtype, productid);
		
		request.setAttribute("result", result);
	}

}
