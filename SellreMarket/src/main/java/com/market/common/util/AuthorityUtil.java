package com.market.common.util;

import static com.market.common.support.Constants.LOGIN_USER_SESSION_NAME;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.auth.domain.User;

public final class AuthorityUtil {
	public static void requireSigning(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(LOGIN_USER_SESSION_NAME);
		
		if (user == null) {
			// response.setStatus(401);
			throw new RuntimeException("로그인되어 있지 않습니다.");
		}
	}
}
