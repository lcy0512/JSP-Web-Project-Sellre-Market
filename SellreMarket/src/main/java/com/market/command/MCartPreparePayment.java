package com.market.command;

import static com.market.common.support.Constants.LOGIN_USER_SESSION_NAME;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.auth.domain.User;
import com.market.dao.CartDao;
import com.market.dao.PurchaseDao;
import com.market.dao.projection.CartListViewProjection;
import com.market.purchase.domain.Purchase;
import com.market.purchase.domain.types.PurchaseStatus;

public class MCartPreparePayment implements MCommand {
	
	private final PurchaseDao dao = PurchaseDao.getInstance();
	private final CartDao cartDao = new CartDao();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(LOGIN_USER_SESSION_NAME);
		
		List<CartListViewProjection> carts = cartDao.findCartsByUserId(user.getId());
		List<Purchase> entities = carts.stream()
				.map((cart) -> Purchase.builder()
						.userId(user.getId())
						.addressId(null)
						.payId(null)
						.couponId(null)
						.productId(cart.productId())
						.amount(cart.amount())
						.status(PurchaseStatus.READY)
						.purchasedAt(null)
						.build()
				)
				.toList();
		int success = dao.saveAll(entities);
		System.out.println("save success: " + success + " of (carts)" + carts.size());
	}
}
