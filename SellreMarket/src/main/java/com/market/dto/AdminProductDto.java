package com.market.dto;

public class AdminProductDto {

	int productid;
	String pname;
	String pEngname;
	String origin;
	String nutrition;
	String pinsertdate;
	String expirationdate;
	String status;
	String allery;
	String description;
	int pstock;
	int stock;
	
	public AdminProductDto() {
		// TODO Auto-generated constructor stub
	}
	

	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getpEngname() {
		return pEngname;
	}

	public void setpEngname(String pEngname) {
		this.pEngname = pEngname;
	}

	public String getNutrition() {
		return nutrition;
	}

	public void setNutrition(String nutrition) {
		this.nutrition = nutrition;
	}

	public String getPinsertdate() {
		return pinsertdate;
	}

	public void setPinsertdate(String pinsertdate) {
		this.pinsertdate = pinsertdate;
	}

	public String getExpirationdate() {
		return expirationdate;
	}

	public void setExpirationdate(String expirationdate) {
		this.expirationdate = expirationdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public int getPstock() {
		return pstock;
	}

	public void setPstock(int pstock) {
		this.pstock = pstock;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}


	public String getAllery() {
		return allery;
	}


	public void setAllery(String allery) {
		this.allery = allery;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}
	
}
