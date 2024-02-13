package com.market.dto;

import java.util.List;

import com.market.dao.projection.CartListViewProjection;

public final class CartQueryResponseDto {
	private CartQueryResponseDto() {}
	
	public record CartPriceSummaryQueryResponseDto(
			Integer totalPrice,
			Integer discountPrice,
			Integer paymentPrice
	) {
		public CartPriceSummaryQueryResponseDto {
			if (totalPrice == null) totalPrice = 0;
			if (discountPrice == null) discountPrice = 0;
			if (paymentPrice == null) paymentPrice = 0;
		}
	}
	
	public record CartListAndPriceQueryResponseDto(
			List<CartListViewProjection> carts,
			CartPriceSummaryQueryResponseDto priceSummary
	) {}
}
