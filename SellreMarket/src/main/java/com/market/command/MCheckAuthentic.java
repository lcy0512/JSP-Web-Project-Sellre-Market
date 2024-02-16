package com.market.command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.market.dao.SignUpDao;

public class MCheckAuthentic implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String authentication = request.getParameter("authentication");
		String email = request.getParameter("email");
		
		
		SignUpDao dao = new SignUpDao();
		
		boolean check = dao.confirmAuthentic(authentication, email);
		
		try {
			PrintWriter out = response.getWriter();
			out.print(new Gson().toJson(check));
			out.flush();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
