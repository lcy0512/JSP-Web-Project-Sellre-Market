package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminBrandDao;
import com.market.dao.AdminCategoryDao;

public class MAdminBrandInsert implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {


		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String bname = request.getParameter("bname");
		
		AdminBrandDao dao = new AdminBrandDao();
		int num = dao.insertBrand(bname);
		
		request.setAttribute("num", num);
		
	}

}
