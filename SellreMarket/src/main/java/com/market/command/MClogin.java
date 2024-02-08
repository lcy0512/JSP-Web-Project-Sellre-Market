package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.LoginDao;

public class MClogin implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		String password = (String) session.getAttribute("password");
		
		LoginDao login = new LoginDao();
		String alertMessage = null;
		
		// 아이디 체크
		boolean idCheck = login.checkLoginId(id);
		// 비밀번호 체크
		boolean pwCheck = login.checkLoginPw(password);
		
		
		if (!idCheck && !pwCheck) {
			alertMessage = "아이디와 비밀번호를 확인 해주세요.";
		}
		else if (!idCheck) {
			alertMessage = "아이디를 확인 해주세요.";
		}
		else if (!pwCheck) {
			alertMessage = "비밀번호를 확인 해주세요.";
		}
		else if (idCheck && pwCheck) {
			alertMessage = "success";
		}
		
		session.setAttribute("alertMessage", alertMessage);
		
	}

}
