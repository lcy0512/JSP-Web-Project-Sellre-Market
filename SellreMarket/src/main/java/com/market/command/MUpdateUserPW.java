package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.UserInfoDao;

public class MUpdateUserPW implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String userid = request.getParameter("userid");
		String password = request.getParameter("newPassword");
		System.out.println("userid : " + userid);
		System.out.println("password : " + password);
		
		UserInfoDao dao = new UserInfoDao();
		
		dao.updatePassword(userid, password);
	}

}
