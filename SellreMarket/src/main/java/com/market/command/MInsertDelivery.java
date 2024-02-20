package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.AdminProductInputDao;

public class MInsertDelivery implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		String dname = request.getParameter("dname");
		int productid = (int) session.getAttribute("pId");
		
		AdminProductInputDao dao = new AdminProductInputDao();
		int result = dao.insertDelivery(dname, productid);
		
		request.setAttribute("result", result);

	}

}
