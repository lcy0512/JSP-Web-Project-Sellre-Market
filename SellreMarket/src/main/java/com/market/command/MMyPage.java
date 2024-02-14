package com.market.command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.market.dao.UserInfoDao;

public class MMyPage implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		
		System.out.println("My Page userid : " + userid);
		System.out.println("My Page password : " + password);
		UserInfoDao dao = new UserInfoDao();
		
		boolean result = dao.checkUserInput(userid, password);
		
		try {
			PrintWriter out = response.getWriter();
			
			// id,pw 존재 시 true
			out.print(new Gson().toJson(result));
			out.flush();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
