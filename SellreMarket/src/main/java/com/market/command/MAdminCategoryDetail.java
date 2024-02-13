package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.AdminCategoryDao;
import com.market.dto.AdminCategoryDto;

public class MAdminCategoryDetail implements MCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String idString = (String) session.getAttribute("categoryid");
		
		int categoryId = 0; // 기본값 설정

		if (idString != null) {
			try {
				categoryId = Integer.parseInt(idString);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		
		AdminCategoryDao dao = new AdminCategoryDao();
		ArrayList<AdminCategoryDto> list = dao.categoryDetail(categoryId);
		
		request.setAttribute("list", list);
	}

}
