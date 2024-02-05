package com.market.dto;

public class AdminProductDto {

	int productid;
	String pname;
	String pEngname;
	String origin;
	String pinsertdate;
	String expirationdate;
	String status;
	
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

	
}
