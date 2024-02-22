package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.AdminProductInputDao;

public class MinsertPackToProduct implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		
		String packType = request.getParameter("packType");
		String packKind = request.getParameter("packKind");
		int productid = (int) session.getAttribute("pId");
		
		AdminProductInputDao dao = new AdminProductInputDao();
		int result = dao.insertPack(packType, packKind, productid);
		
		request.setAttribute("result", result);
	}

}
