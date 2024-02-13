package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.UserInfoDao;

public class MDeleteUserInfo implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String userid = (String)session.getAttribute("id");
		
		UserInfoDao dao = new UserInfoDao();
		dao.deleteUserInfo(userid);
	}

}
