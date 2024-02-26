package com.market.command;

import static com.market.common.support.Constants.LOGIN_USER_SESSION_NAME;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.auth.domain.User;
import com.market.dao.CartDao;

public class MCartDeleteItem implements MCommand {
	private final CartDao dao = new CartDao();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 보안 요건: 카트 아이디의 소유자가 이 회원이어야 함.
		
		// (요청에 있는 변수 꺼내는 것뿐이니까 로직과 무관)
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(LOGIN_USER_SESSION_NAME);
		Long cartId = Long.parseLong(request.getParameter("cartId"));
		
		// [1] 사용자 본인의 카트 아이템이 맞는지 확인
		if (user == null || !hasAuthorityOnCart(user.getId(), cartId)) {
			// response.setStatus(403); // FORBIDDEN (권한 없음)
			throw new RuntimeException("권한이 없습니다.");
		}
		
		// [2] 맞으면 삭제
		dao.deleteByCartId(cartId);
		
		try (PrintWriter out = response.getWriter()) {
			out.print("{\"success\": true}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private boolean hasAuthorityOnCart(String userId, Long cartId) {
		return dao.existsByUserIdAndCartId(userId, cartId);
	}
}
