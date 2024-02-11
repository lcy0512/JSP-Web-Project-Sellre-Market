package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminCategoryDao;
import com.market.dao.AdminEventDao;

public class MAdminEventDelete implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int eventid = Integer.parseInt(request.getParameter("eventid"));
		
		AdminEventDao dao = new AdminEventDao();
		int num = dao.deleteEvent(eventid);
		
		request.setAttribute("num", num);
	}

}
