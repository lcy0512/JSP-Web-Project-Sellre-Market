package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminEventDao;

public class MAdminEventInsert implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		response.setCharacterEncoding("UTF-8");
		
		String image = request.getParameter("image");
		String ename = request.getParameter("ename");
		String econtent = request.getParameter("econtent");
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		int salerate = Integer.parseInt(request.getParameter("salerate"));
		
		AdminEventDao dao = new AdminEventDao();
		int num = dao.insertEvent(image, ename, econtent, startdate, enddate, salerate, request, response);
		
		request.setAttribute("eventNum", num);
		
	}

}
