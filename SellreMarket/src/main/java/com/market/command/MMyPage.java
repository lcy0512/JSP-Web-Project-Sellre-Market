package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.UserInfoDao;

public class MMyPage implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		
		UserInfoDao dao = new UserInfoDao();
		
		dao.checkUserInput(userid, password);
		
	}
}
