package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminProductInputDao;
import com.market.dto.AdminProductInputDto;

public class MAdminProductInsert implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String pname = request.getParameter("pname");
		String pEngname = request.getParameter("pEngname");
		String allery = request.getParameter("allery");
		String nutrition = request.getParameter("nutrition");
		int pstock = Integer.parseInt(request.getParameter("pstock"));
		String origin = request.getParameter("origin");
		String description = request.getParameter("description");
		
		AdminProductInputDao dao = new AdminProductInputDao();
		
		int num1 = dao.insertProduct(pname, pEngname, allery, nutrition, pstock, origin, description);		//product insert
		int productid = dao.selectInputProductId(pname, pEngname, pstock, origin);
		
		request.setAttribute("result", num1);
		request.setAttribute("productid", productid);
		
	}

}
