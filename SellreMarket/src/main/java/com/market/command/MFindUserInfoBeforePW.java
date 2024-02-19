package com.market.command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.market.dao.FindUserInfo;
import com.mysql.cj.x.protobuf.MysqlxCrud.Find;

public class MFindUserInfoBeforePW implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String userid = request.getParameter("userid");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		boolean findResult = false;
		
		FindUserInfo find = new FindUserInfo();
		findResult = find.findPW(userid, name, email);
		
		try {
			PrintWriter out = response.getWriter();
			out.print(new Gson().toJson(findResult));
			out.flush();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
