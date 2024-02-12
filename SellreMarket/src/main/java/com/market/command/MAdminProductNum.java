package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminProductDao;

public class MAdminProductNum implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		AdminProductDao dao = new AdminProductDao();
		int num = dao.productNum();
		
		request.setAttribute("productNum", num);
	}

}
