package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.EventListDao;
import com.market.dao.InquiryDao;
import com.market.dto.EventDto;
import com.market.dto.InquiryDto;

public class MEventDetail implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		try {
			
			EventDto detail = new EventDto();
			
			String eventid = request.getParameter("eventid");
			
			EventListDao dao = new EventListDao();
			detail = dao.eventDetail(eventid);
			
			request.setAttribute("eventDetail", detail);
			
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

}
