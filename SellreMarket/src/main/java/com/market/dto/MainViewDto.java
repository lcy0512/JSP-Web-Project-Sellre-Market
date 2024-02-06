package com.market.dto;

import java.sql.Date;

public class MainViewDto {
	
/*
	1. Date : 2024.02.02
	2. Author : Woody Jo
	3. Version : v1.0.0
	4. Description : 메인 body 페이지 Dto 
*/
	
	int yid;
	String yname;
	String ysrc;
	String ytitle;
	int rid;
	String rcontent;
	int pid;
	String pname;
	String pengname;
	String allery;
	String nutrition;
	int pstock;
	Date pinsertdate;
	String origin;
	Date expirationdate;
	String description;
	int status;
	int priceid;
	String price;
	int like;
	String ename;
	String econtent;
	String eimg;
	
	public MainViewDto() {
		// TODO Auto-generated constructor stub
	}
	
	public MainViewDto(String eimg) {
		super();
		this.eimg = eimg;
	}

	public MainViewDto(String yname, String ysrc, String ytitle, String price, int like) {
		super();
		this.yname = yname;
		this.ysrc = ysrc;
		this.ytitle = ytitle;
		this.price = price;
		this.like = like;
	}

	public int getYid() {
		return yid;
	}

	public void setYid(int yid) {
		this.yid = yid;
	}

	public String getYname() {
		return yname;
	}

	public void setYname(String yname) {
		this.yname = yname;
	}

	public String getYsrc() {
		return ysrc;
	}

	public void setYsrc(String ysrc) {
		this.ysrc = ysrc;
	}

	public String getYtitle() {
		return ytitle;
	}

	public void setYtitle(String ytitle) {
		this.ytitle = ytitle;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPengname() {
		return pengname;
	}

	public void setPengname(String pengname) {
		this.pengname = pengname;
	}

	public String getAllery() {
		return allery;
	}

	public void setAllery(String allery) {
		this.allery = allery;
	}

	public String getNutrition() {
		return nutrition;
	}

	public void setNutrition(String nutrition) {
		this.nutrition = nutrition;
	}

	public int getPstock() {
		return pstock;
	}

	public void setPstock(int pstock) {
		this.pstock = pstock;
	}

	public Date getPinsertdate() {
		return pinsertdate;
	}

	public void setPinsertdate(Date pinsertdate) {
		this.pinsertdate = pinsertdate;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public Date getExpirationdate() {
		return expirationdate;
	}

	public void setExpirationdate(Date expirationdate) {
		this.expirationdate = expirationdate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getPriceid() {
		return priceid;
	}

	public void setPriceid(int priceid) {
		this.priceid = priceid;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getEcontent() {
		return econtent;
	}

	public void setEcontent(String econtent) {
		this.econtent = econtent;
	}

	public String getEimg() {
		return eimg;
	}

	public void setEimg(String eimg) {
		this.eimg = eimg;
	}
	
}