package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.AdminProductInputDao;

public class MinsertUnitToProduct implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		String utype = request.getParameter("utype");
		String ugram = request.getParameter("ugram");
		int productid = (int) session.getAttribute("pId");
		
		AdminProductInputDao dao = new AdminProductInputDao();
		int result = dao.insertUnit(utype, ugram, productid);
		
		request.setAttribute("result", result);
	}

}
