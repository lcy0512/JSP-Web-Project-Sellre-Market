package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.AdminProductDao;
import com.market.dto.AdminProductDto;

public class MAdminProductDetail implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String idString = (String) session.getAttribute("productidToDetail");
		
		int productId = 0; // 기본값 설정

		if (idString != null) {
			try {
				productId = Integer.parseInt(idString);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		
		AdminProductDao dao = new AdminProductDao();
		ArrayList<AdminProductDto> list = dao.productDetail(productId);
		
		request.setAttribute("list", list);
	}

}
