package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminCategoryDao;
import com.market.dao.AdminEventDao;

public class MAdminEventUpdate implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		//String image = request.getParameter("image");
		String ename = request.getParameter("ename");
		String econtent = request.getParameter("econtent");
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		int salerate = Integer.parseInt(request.getParameter("salerate"));
		int eventid = Integer.parseInt(request.getParameter("eventid"));
		
		AdminEventDao dao = new AdminEventDao();
		int num = dao.updateEvent(ename, econtent, startdate, enddate, salerate, eventid);
		
		request.setAttribute("num", num);
	}

}
