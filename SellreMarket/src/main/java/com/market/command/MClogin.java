package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.dao.LoginDao;
import com.market.dto.LoginDto;

public class MClogin implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		String password = (String) session.getAttribute("password");
		
		LoginDao login = new LoginDao();
		LoginDto dto = new LoginDto();
		String alertMessage = null;
		
		// 아이디 체크, 비밀번호 체크 후 true일 때 이름 반납
		boolean idCheck = login.checkLogin(id, password);
		
		System.out.println(dto.getName());
		if (idCheck) {
			session.setAttribute("userName", dto.getName());
		}
		else {
			alertMessage = "아이디와 비밀번호를 확인 해주세요.";
			session.setAttribute("alertMessage", alertMessage);
		}
		
		//
	}

}
