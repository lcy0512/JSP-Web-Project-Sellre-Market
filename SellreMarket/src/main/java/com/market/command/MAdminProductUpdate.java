package com.market.command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminProductDao;

public class MAdminProductUpdate implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String pEngname = request.getParameter("pEngname");
		String allery = request.getParameter("allery");
		String nutrition = request.getParameter("nutrition");
		String origin = request.getParameter("origin");
		String description = request.getParameter("description");
		String productid = request.getParameter("productid");

		AdminProductDao dao = new AdminProductDao();
		int num = dao.updateProduct(pEngname, allery, nutrition, origin, description, productid);
		
		request.setAttribute("num", num);
	}

}
