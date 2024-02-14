package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminQuestDao;

public class MAdminQuestNum implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		AdminQuestDao dao = new AdminQuestDao();
		int num = dao.questNum();
		
		request.setAttribute("questNum", num);
	}

}
