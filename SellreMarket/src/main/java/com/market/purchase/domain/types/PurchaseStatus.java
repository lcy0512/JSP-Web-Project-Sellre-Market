package com.market.purchase.domain.types;

public enum PurchaseStatus {
	/**
	 * 이 아이템은 결제를 할 수 있는 준비가 됨.
	 */
	READY(false),
	
	/**
	 * 이 아이템의 결제가 진행되고 있어 결제 완료를 기다리는 상태.
	 */
	PENDING_PAYMENT(false),
	
	/**
	 * 모종의 이유로 결제를 할 수 없는 아이템이 됨.
	 */
	BLOCKED(true),
	
	/**
	 * 결제가 완료됨.
	 */
	SUCCESS(true);
	
	private final boolean completed;
	
	// 생성자 (외부에서 못 쓰고 위에서 씀. 그래서 public 안 붙음.)
	PurchaseStatus(boolean completed) {
		this.completed = completed;
	}
	
	public boolean disabled() {
		return completed;
	}
}
