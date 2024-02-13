package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.AdminCategoryDao;
import com.market.dao.AdminOrderDao;
import com.market.dto.AdminCategoryDto;
import com.market.dto.AdminProductDto;

public class MAdminOrderDetail implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String idString = (String) session.getAttribute("orderProductId");
		
		int productid = 0; // 기본값 설정

		if (idString != null) {
			try {
				productid = Integer.parseInt(idString);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		
		AdminOrderDao dao = new AdminOrderDao();
		ArrayList<AdminProductDto> list = dao.orderDetail(productid);
		
		request.setAttribute("list", list);
	}

}
