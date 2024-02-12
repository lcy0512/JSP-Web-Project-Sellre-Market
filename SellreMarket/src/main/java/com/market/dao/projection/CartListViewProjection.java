package com.market.dao.projection;

/**
 * 장바구니 목록 조회용 모델 (DB 연결 쪽 DTO 역할)
 */
public record CartListViewProjection(
		Long cartId,
		Long productId,
		Long recipeId,
		Integer amount,
		
		String productName,
		Long priceId,
		Integer price,
		Long eventId,
		Integer saleRate,
		String imagePath
		
		// TODO append recipe info
) {
	public static CartListViewProjectionBuilder builder() {
		return new CartListViewProjectionBuilder();
	}
	public static class CartListViewProjectionBuilder {
		private Long cartId;
		private Long productId;
		private Long recipeId;
		private Integer amount;
		
		private String productName;
		private Long priceId;
		private Integer price;
		private Long eventId;
		private Integer saleRate;
		private String imagePath;

		public CartListViewProjectionBuilder cartId(Long cartId) {
			this.cartId = cartId;
			return this;
		}
		public CartListViewProjectionBuilder productId(Long productId) {
			this.productId = productId;
			return this;
		}
		public CartListViewProjectionBuilder recipeId(Long recipeId) {
			this.recipeId = recipeId;
			return this;
		}
		public CartListViewProjectionBuilder amount(Integer amount) {
			this.amount = amount;
			return this;
		}
		
		public CartListViewProjectionBuilder productName(String productName) {
			this.productName = productName;
			return this;
		}
		public CartListViewProjectionBuilder priceId(Long priceId) {
			this.priceId = priceId;
			return this;
		}
		public CartListViewProjectionBuilder price(Integer price) {
			this.price = price;
			return this;
		}
		public CartListViewProjectionBuilder eventId(Long eventId) {
			this.eventId = eventId;
			return this;
		}
		public CartListViewProjectionBuilder saleRate(Integer saleRate) {
			this.saleRate = saleRate;
			return this;
		}
		public CartListViewProjectionBuilder imagePath(String imagePath) {
			this.imagePath = imagePath;
			return this;
		}
		
		public CartListViewProjection build() {
			return new CartListViewProjection(
					cartId,
					productId,
					recipeId,
					amount,
					productName,
					priceId,
					price,
					eventId,
					saleRate,
					imagePath
			);
		}
	}
}
