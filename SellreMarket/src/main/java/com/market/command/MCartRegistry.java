package com.market.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.market.dao.CartDao;
import com.market.dto.CartRegistryRequestDto;
import com.market.dto.CartRegistryResponseDto;

public class MCartRegistry implements MCommand {
	private final Gson gson = new Gson();
	private final CartDao dao = new CartDao();

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.getAttribute("");
		try (PrintWriter out = response.getWriter()) {
			// req
			CartRegistryRequestDto requestBody = parseRequestDto(request);
			
			// handle
			Long productId = requestBody.productId();
			Integer amount = requestBody.amount();
			dao.save(productId, amount);

			// res
			CartRegistryResponseDto responseBody = new CartRegistryResponseDto(true);
			response.setStatus(201); // 201 CREATED
			out.print(gson.toJson(responseBody));
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private CartRegistryRequestDto parseRequestDto(HttpServletRequest request) {
		String productIdAsString = request.getParameter("productId");
		String amountAsString = request.getParameter("amount");
		
		// Null이면 예외 발생
		Objects.requireNonNull(productIdAsString);
		Objects.requireNonNull(amountAsString);
		
		Long productId = Long.parseLong(productIdAsString);
		Integer amount = Integer.parseInt(amountAsString);
		
		return new CartRegistryRequestDto(productId, amount);
	}
}
