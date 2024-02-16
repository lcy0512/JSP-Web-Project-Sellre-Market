package com.market.dto;

public class RecipeDetailPageDto {
	
	int id, productPrice, salerate, discountedPrice;
	String productName, deliveryName;
	
	public RecipeDetailPageDto() {
		// TODO Auto-generated constructor stub
	}	

	public RecipeDetailPageDto(int id, String productName, int productPrice, int discountedPrice) {
		super();
		this.id = id;
		this.productName = productName;
		this.productPrice = productPrice;
		this.discountedPrice = discountedPrice;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getDiscountedPrice() {
		return discountedPrice;
	}

	public void setDiscountedPrice(int discountedPrice) {
		this.discountedPrice = discountedPrice;
	}

	public int getSalerate() {
		return salerate;
	}

	public void setSalerate(int salerate) {
		this.salerate = salerate;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDeliveryName() {
		return deliveryName;
	}

	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
	}
	
	
	

}
