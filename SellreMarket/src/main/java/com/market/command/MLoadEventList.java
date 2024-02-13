package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.EventListDao;
import com.market.dto.EventDto;

public class MLoadEventList implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		EventListDao dao = new EventListDao();
		ArrayList<EventDto> eventList = dao.eventList();
		
		request.setAttribute("EventList", eventList);

	}

}
