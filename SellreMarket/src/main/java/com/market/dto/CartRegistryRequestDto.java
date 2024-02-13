package com.market.dto;

import java.util.Objects;

public record CartRegistryRequestDto(
		Long productId,
		Integer amount
) {
	public CartRegistryRequestDto {
		Objects.requireNonNull(productId);
		Objects.requireNonNull(amount);
	}
}
