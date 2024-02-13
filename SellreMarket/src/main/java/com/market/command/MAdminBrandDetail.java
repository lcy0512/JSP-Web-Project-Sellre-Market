package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.AdminBrandDao;
import com.market.dto.AdminBrandDto;

public class MAdminBrandDetail implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String idString = (String) session.getAttribute("brandid");
		
		int bradId = 0; // 기본값 설정

		if (idString != null) {
			try {
				bradId = Integer.parseInt(idString);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		
		AdminBrandDao dao = new AdminBrandDao();
		ArrayList<AdminBrandDto> list = dao.brandDetail(bradId);
		
		request.setAttribute("list", list);
	}

}
