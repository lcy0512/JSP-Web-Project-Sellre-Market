package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.AdminCategoryDao;
import com.market.dao.AdminEventDao;
import com.market.dto.AdminCategoryDto;
import com.market.dto.AdminEventDto;

public class MAdminEventDetail implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String idString = (String) session.getAttribute("eventid");
		
		int eventid = 0; // 기본값 설정

		if (idString != null) {
			try {
				eventid = Integer.parseInt(idString);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		
		AdminEventDao dao = new AdminEventDao();
		ArrayList<AdminEventDto> list = dao.eventDetail(eventid);
		
		request.setAttribute("eventDetailList", list);
	}

}
