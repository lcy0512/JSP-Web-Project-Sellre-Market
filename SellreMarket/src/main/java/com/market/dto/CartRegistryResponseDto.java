package com.market.dto;

import java.util.Objects;

public record CartRegistryResponseDto(
		Boolean success
) {
	public CartRegistryResponseDto {
		Objects.requireNonNull(success);
	}
}
