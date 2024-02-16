package com.market.command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.market.dao.FindUserInfo;

public class MFindUserID implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		FindUserInfo dao = new FindUserInfo();
		
		String findUserid = dao.findID(name, email);
		
		try {
			PrintWriter out = response.getWriter();
			
			out.print(new Gson().toJson(findUserid));
			out.flush();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
