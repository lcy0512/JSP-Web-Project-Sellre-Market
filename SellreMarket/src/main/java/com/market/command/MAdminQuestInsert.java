package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminOrderDao;
import com.market.dao.AdminQuestDao;

public class MAdminQuestInsert implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		
		String answer = request.getParameter("answer");
		int inquiryid = Integer.parseInt(request.getParameter("inquiryid"));
		
		AdminQuestDao dao = new AdminQuestDao();
		int num1 = dao.insertQuest(answer, inquiryid);
		
		request.setAttribute("total", num1);
	}

}
