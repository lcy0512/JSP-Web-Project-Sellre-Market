package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminEventDao;

public class MAdminEventInsert implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		response.setCharacterEncoding("UTF-8");
		
		AdminEventDao dao = new AdminEventDao();
		int num = dao.insertEvent(request, response);
		
		request.setAttribute("eventNum", num);
		
	}

}
