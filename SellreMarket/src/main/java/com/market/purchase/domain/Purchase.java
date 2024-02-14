package com.market.purchase.domain;

import java.time.Instant;

import com.market.purchase.domain.types.PurchaseStatus;

// !!히스토리성 데이터가 아님!!
// (따라서 컬럼이 변경될 수 있음.
// 결제 정보는 나중에 이 테이블로 완전히 보존되지 않으므로
// 장부 역할을 하는 다른 테이블이 반드시 필요함.)
// 로그성 데이터는 -> 업데이트를 하면 안 됨. (겉으로 봐선 기록 조작과 구분할 수 없으니까)
public class Purchase {
	
	public static PurchaseBuilder builder() {
		return new PurchaseBuilder();
	}
	
	private Long id;
	private String userId;
	private Long addressId;
	private Long payId;
	private Long couponId;
	private Long productId;
	private Integer amount;
	private PurchaseStatus status;
	
	/**
	 * nullable (처음에 저장할 때 null(결제 안 했을 때 결제 테이블에 들어오니까), 결제 완료 후 시간 입력)
	 */
	private Instant purchasedAt;
	// private Instant createdAt;
	// private Instant updatedAt;

	public Purchase(Long id, String userId, Long addressId, Long payId, Long couponId, Long productId, Integer amount,
			PurchaseStatus status, Instant purchasedAt) {
		super();
		this.id = id;
		this.userId = userId;
		this.addressId = addressId;
		this.payId = payId;
		this.couponId = couponId;
		this.productId = productId;
		this.amount = amount;
		this.status = status;
		this.purchasedAt = purchasedAt;
	}

	public Long getAddressId() {
		return addressId;
	}

	public void setAddressId(Long addressId) {
		this.addressId = addressId;
	}

	public Long getPayId() {
		return payId;
	}

	public void setPayId(Long payId) {
		this.payId = payId;
	}

	public Long getCouponId() {
		return couponId;
	}

	public void setCouponId(Long couponId) {
		this.couponId = couponId;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public PurchaseStatus getStatus() {
		return status;
	}

	public void setStatus(PurchaseStatus status) {
		this.status = status;
	}

	public Instant getPurchasedAt() {
		return purchasedAt;
	}

	public void setPurchasedAt(Instant purchasedAt) {
		this.purchasedAt = purchasedAt;
	}

	public Long getId() {
		return id;
	}

	public String getUserId() {
		return userId;
	}

	public Long getProductId() {
		return productId;
	}
	
	public static class PurchaseBuilder {
		private Long id;
		private String userId;
		private Long addressId;
		private Long payId;
		private Long couponId;
		private Long productId;
		private Integer amount;
		private PurchaseStatus status;
		private Instant purchasedAt;
		
		public PurchaseBuilder id(Long id) {
			this.id = id;
			return this;
		}
		public PurchaseBuilder userId(String userId) {
			this.userId = userId;
			return this;
		}
		public PurchaseBuilder addressId(Long addressId) {
			this.addressId = addressId;
			return this;
		}
		public PurchaseBuilder payId(Long payId) {
			this.payId = payId;
			return this;
		}
		public PurchaseBuilder couponId(Long couponId) {
			this.couponId = couponId;
			return this;
		}
		public PurchaseBuilder productId(Long productId) {
			this.productId = productId;
			return this;
		}
		public PurchaseBuilder amount(Integer amount) {
			this.amount = amount;
			return this;
		}
		public PurchaseBuilder status(PurchaseStatus status) {
			this.status = status;
			return this;
		}
		public PurchaseBuilder purchasedAt(Instant purchasedAt) {
			this.purchasedAt = purchasedAt;
			return this;
		}
		
		public Purchase build() {
			return new Purchase(id, userId, addressId, payId, couponId, productId, amount, status, purchasedAt);
		}
	}
}
