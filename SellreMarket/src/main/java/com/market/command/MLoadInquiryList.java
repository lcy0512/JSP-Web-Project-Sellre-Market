package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.InquiryDao;
import com.market.dto.InquiryDto;
import com.mysql.cj.Session;

public class MLoadInquiryList implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String userid = null;
		
		try {
			userid = (String)session.getAttribute("id");
			
			InquiryDao dao = new InquiryDao();
			ArrayList<InquiryDto> inquiryList = dao.list(userid);
			
			request.setAttribute("InquiryList", inquiryList);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	
	
	
	
	
	
	
	
	}
} // End
