package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.UserInfoDao;
import com.market.dto.MyPageDetailDto;
import com.mysql.cj.Session;

public class MMyPageDetail implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String userid = (String)session.getAttribute("id");
		
		System.out.println(userid);
		
		UserInfoDao dao = new UserInfoDao();
		MyPageDetailDto dto = dao.userDetail(userid);
		
		request.setAttribute("UserDetail", dto);
	}

}
