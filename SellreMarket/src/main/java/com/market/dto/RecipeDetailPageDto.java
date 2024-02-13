package com.market.dto;

public class RecipeDetailPageDto {
	
	int id, price, discountedPrice, salerate;
	String productName, deliveryName;
	
	public RecipeDetailPageDto() {
		// TODO Auto-generated constructor stub
	}	

	public RecipeDetailPageDto(int id, String productName) {
		super();
		this.id = id;
		this.productName = productName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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
