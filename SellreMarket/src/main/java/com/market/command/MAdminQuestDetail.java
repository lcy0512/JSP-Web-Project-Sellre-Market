package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.AdminQuestDao;
import com.market.dto.AdminQuestDto;

public class MAdminQuestDetail implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String idString = (String) session.getAttribute("questId");
		
		int questId = 0; // 기본값 설정

		if (idString != null) {
			try {
				questId = Integer.parseInt(idString);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		
		AdminQuestDao dao = new AdminQuestDao();
		ArrayList<AdminQuestDto> list = dao.questDetail(questId);
		
		request.setAttribute("list", list);
	}

}
