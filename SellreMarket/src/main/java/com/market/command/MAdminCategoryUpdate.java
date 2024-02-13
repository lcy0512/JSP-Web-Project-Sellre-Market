package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminCategoryDao;

public class MAdminCategoryUpdate implements MCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String type = request.getParameter("type");
		String subtype = request.getParameter("subtype");
		int catetoryid = Integer.parseInt(request.getParameter("catetoryid"));
		
		AdminCategoryDao dao = new AdminCategoryDao();
		int num = dao.updateCategory(type, subtype, catetoryid);
		
		request.setAttribute("num", num);
	}

}
