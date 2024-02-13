package com.market.command;

import static com.market.common.support.Constants.LOGIN_USER_SESSION_NAME;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.market.auth.domain.User;
import com.market.dao.CartDao;
import com.market.dao.projection.CartListViewProjection;
import com.market.dto.CartQueryResponseDto.CartListAndPriceQueryResponseDto;
import com.market.dto.CartQueryResponseDto.CartPriceSummaryQueryResponseDto;

public class MCartListViewApi implements MCommand {
	
	private final Gson gson = new Gson();
	private final CartDao dao = new CartDao();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		List<CartListViewProjection> list;
		CartPriceSummaryQueryResponseDto priceSummary;
		
		User loginUser = (User) session.getAttribute(LOGIN_USER_SESSION_NAME);
		// TODO input "admin" as default to test (remove later)
		String loginUserId = loginUser != null ? loginUser.getId() : "admin";
		
		list = dao.findCartsByUserId(loginUserId);
		
		int totalPrice = list.stream()
				.map((item) -> item.price() * item.amount())
				.reduce(0, (acc, cur) -> acc + cur);
		int discountPrice = list.stream()
				.map((item) -> Math.floor(item.price() * item.saleRate() / 100.0) * item.amount())
				.reduce(0.0, (acc, cur) -> acc + cur)
				.intValue();
		int paymentPrice = totalPrice - discountPrice;
		
		priceSummary = new CartPriceSummaryQueryResponseDto(
				totalPrice,
				discountPrice,
				paymentPrice
		);
		
		try (PrintWriter out = response.getWriter()) {
			CartListAndPriceQueryResponseDto resData
					= new CartListAndPriceQueryResponseDto(list, priceSummary);
			
			out.print(gson.toJson(resData));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("carts", list);
		request.setAttribute("priceSummary", priceSummary);
	}

}
