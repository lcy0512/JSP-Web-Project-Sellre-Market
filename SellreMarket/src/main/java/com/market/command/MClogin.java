package com.market.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static com.market.common.support.Constants.LOGIN_USER_SESSION_NAME;
import com.market.auth.domain.User;
import com.market.dao.LoginDao;
import com.market.dto.LoginDto;

public class MClogin implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String password = (String) session.getAttribute("password");
		
		LoginDao login = new LoginDao();
		
		// 로그인 시도 시 알람 메시지
		String alertMessage = null;
		
		
		// map으로 dao에서 받아온다.
		Map<String, Object> data = login.checkLogin(id, password);

		String userName = (String) data.get("name");
		boolean check = (boolean) data.get("check");
		
		if (check) {
			alertMessage = "success";
			session.setAttribute("userName", userName);
			session.setAttribute("id", id);
			
			User loginUser = new User(id, userName);
			session.setAttribute(LOGIN_USER_SESSION_NAME, loginUser);
		}
		else {
			session.removeAttribute("id");
			session.removeAttribute("userName");
			alertMessage = "아이디와 비밀번호를 확인 해주세요.";
			
		}
		
		session.setAttribute("alertMessage", alertMessage);
		
	}
}
