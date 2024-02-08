package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.InquiryDao;
import com.market.dto.InquiryDto;

public class MInquiryDetail implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		try {
			ArrayList<InquiryDto> detail = new ArrayList<InquiryDto>();
			
			String inquiryid = request.getParameter("inquiryid");
			String userid = (String)session.getAttribute("id");
			
			InquiryDao dao = new InquiryDao();
			detail = dao.detailInquiry(userid, inquiryid);
			
			request.setAttribute("detailInquiry", detail);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
