package com.market.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.EventListDao;
import com.market.dto.EventDto;

public class MEventDetail implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		try {
			
			EventDto detail = new EventDto();
			String eventid = request.getParameter("eventid");
			
			System.out.println("command eventid : " + eventid);
			
			EventListDao dao = new EventListDao();
			detail = dao.eventDetail(eventid);
			
			request.setAttribute("detailDto", detail);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

}
