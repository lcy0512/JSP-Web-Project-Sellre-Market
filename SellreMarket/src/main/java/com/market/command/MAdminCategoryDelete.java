package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminCategoryDao;

public class MAdminCategoryDelete implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int catetoryid = Integer.parseInt(request.getParameter("catetoryid"));
		
		AdminCategoryDao dao = new AdminCategoryDao();
		int num = dao.deleteCategory(catetoryid);
		
		request.setAttribute("num", num);
	}

}
