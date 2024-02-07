package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminProductInputDao;
import com.market.dto.AdminProductInputDto;

public class MAdminProductInsert implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String image = request.getParameter("image");
		String bname = request.getParameter("bname");
		String pname = request.getParameter("bname");
		String pEngname = request.getParameter("pEngname");
		String allery = request.getParameter("allery");
		String nutrition = request.getParameter("nutrition");
		int pstock = Integer.parseInt(request.getParameter("pstock"));
		String origin = request.getParameter("origin");
		String expirationdate = request.getParameter("expirationdate");
		String description = request.getParameter("description");
		int price = Integer.parseInt(request.getParameter("price"));
		
		String type = request.getParameter("type");
		String subType = request.getParameter("subType");
		
		String packType = request.getParameter("packType");
		String packKind = request.getParameter("packKind");
		
		
		//saleunit
		String utype = request.getParameter("utype");
		String ugram = request.getParameter("ugram");
		
		AdminProductInputDao dao = new AdminProductInputDao();
		
		int num1 = dao.insertProduct(bname, pname, pEngname, allery, nutrition, pstock, origin, expirationdate, description);		//product insert
		int num2 = dao.insertImage(image);		//image insert
		int num3 = dao.insertPrice(price);		//price insert
		int num4 = dao.insertCategory(type, subType);	//category insert
		int num5 = dao.insertPacking(packType, packKind);		//packing insert
		int num6 = dao.insertUnit(utype, ugram);		//saleunit insert
		
		int result = num1 + num2 + num3 + num4 + num5 + num6;
		request.setAttribute("result", result);
		
	}

}
