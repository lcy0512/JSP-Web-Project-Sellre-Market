package com.market.dto;

public class ProductDetailPageDto {
	
	int id;
	String name;
	
	public ProductDetailPageDto() {
		// TODO Auto-generated constructor stub
	}

	public ProductDetailPageDto(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	

}
