package com.market.command;

import static com.market.common.support.Constants.LOGIN_USER_SESSION_NAME;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.auth.domain.User;
import com.market.dao.CartDao;
import com.market.dao.projection.CartListViewProjection;

public class MCartListView implements MCommand {
	private final CartDao dao = new CartDao();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute(LOGIN_USER_SESSION_NAME);
		// TODO input "admin" as default to test (remove later)
		String loginUserId = loginUser != null ? loginUser.getId() : "admin";
		
		List<CartListViewProjection> list = dao.findCartsByUserId(loginUserId);
		session.setAttribute("carts", list);
	}

}
