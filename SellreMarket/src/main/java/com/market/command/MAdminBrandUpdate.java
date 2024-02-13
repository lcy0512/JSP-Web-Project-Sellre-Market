package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminBrandDao;

public class MAdminBrandUpdate implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {


		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String bname = request.getParameter("bname");
		int brandid = Integer.parseInt(request.getParameter("brandid"));
		
		AdminBrandDao dao = new AdminBrandDao();
		int num = dao.updateBrand(bname, brandid);
		
		request.setAttribute("num", num);
		
	}

}
