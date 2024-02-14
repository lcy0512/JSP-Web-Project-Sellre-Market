package com.market.dto;

public class EventDto {
	
	String eventid;
	String ename;
	String econtent;
	String inputdate;
	String startdate;
	String enddate;
	String productid;
	String pname;
	String img;
	String category;
	String status;
	
	public EventDto() {
		// TODO Auto-generated constructor stub
	}
	
	// EventListDao.eventList()
	public EventDto(String eventid, String ename, String inputdate, String category, String status) {
		super();
		this.eventid = eventid;
		this.ename = ename;
		this.inputdate = inputdate;
		this.category = category;
		this.status = status;
	}
	
	// EventListDao.eventDetail()
	public EventDto(String eventid, String ename, String econtent, String inputdate, String startdate, String enddate,
			String productid, String pname, String img, String category, String status) {
		super();
		this.eventid = eventid;
		this.ename = ename;
		this.econtent = econtent;
		this.inputdate = inputdate;
		this.startdate = startdate;
		this.enddate = enddate;
		this.productid = productid;
		this.pname = pname;
		this.img = img;
		this.category = category;
		this.status = status;
	}

	public String getProductid() {
		return productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getEventid() {
		return eventid;
	}

	public void setEventid(String eventid) {
		this.eventid = eventid;
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

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
