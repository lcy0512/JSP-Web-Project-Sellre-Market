package com.market.command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.market.dao.SignUpDao;

public class MDuplicatedCheck implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		boolean result;
		String userid = null;
		
		try {
			userid = request.getParameter("userid");
		}catch(Exception e) {
			e.printStackTrace();
			return;
		}
		
		if(userid != null) {
			SignUpDao dao = new SignUpDao();
			result = dao.checkDuplicatedId(userid);
			
			try {
				PrintWriter out = response.getWriter();
				
				out.print(new Gson().toJson(result));
				out.flush();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return;
		}
		
		// email
		String email = null;
		try {
			email = request.getParameter("email");
		}catch(Exception e) {
			e.printStackTrace();
			return;
		}
		
		if(email != null) {
			SignUpDao dao = new SignUpDao();
			result = dao.checkDuplicatedemail(email);
			
			try {
				PrintWriter out = response.getWriter();
				
				out.print(new Gson().toJson(result));
				out.flush();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	} // execute
}
