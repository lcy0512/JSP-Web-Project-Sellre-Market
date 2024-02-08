package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminCategoryDao;

public class MAdminCategoryInsert implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String type = request.getParameter("type");
		String subtype = request.getParameter("subtype");
		
		AdminCategoryDao dao = new AdminCategoryDao();
		int num = dao.insertCategory(type, subtype);
		
		request.setAttribute("num", num);
	}

}
