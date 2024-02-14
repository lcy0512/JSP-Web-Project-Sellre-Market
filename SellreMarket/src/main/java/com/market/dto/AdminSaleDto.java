package com.market.dto;

public class AdminSaleDto {

	String purchasedate;
	int total;
	
	int amount;
	String name;
	int genderCnt;
	String userid ;
	int purCnt;
	
	public AdminSaleDto() {
		// TODO Auto-generated constructor stub
	}

	public String getPurchasedate() {
		return purchasedate;
	}

	public void setPurchasedate(String purchasedate) {
		this.purchasedate = purchasedate;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGenderCnt() {
		return genderCnt;
	}

	public void setGenderCnt(int genderCnt) {
		this.genderCnt = genderCnt;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getPurCnt() {
		return purCnt;
	}

	public void setPurCnt(int purCnt) {
		this.purCnt = purCnt;
	}
	
}
