package com.market.dto;

public class InquiryDto {
	
	String inquiryid;
	String intitle;
	String incontent;
	String inimage;
	String answer;
	String insertdate;
	String answerdate;
	String status;
	String questid;
	String userid;
	
	// detailInquiry
	public InquiryDto(String intitle, String incontent, String inimage, String answer, String insertdate,
			String answerdate, String status, String questid) {
		super();
		this.intitle = intitle;
		this.incontent = incontent;
		this.inimage = inimage;
		this.answer = answer;
		this.insertdate = insertdate;
		this.answerdate = answerdate;
		this.status = status;
		this.questid = questid;
	}
	
	// list
	public InquiryDto(String inquiryid, String intitle, String insertdate, String status, String questid) {
		super();
		this.inquiryid = inquiryid;
		this.intitle = intitle;
		this.insertdate = insertdate;
		this.status = status;
		this.questid = questid;
	}

	public String getIntitle() {
		return intitle;
	}

	public void setIntitle(String intitle) {
		this.intitle = intitle;
	}

	public String getIncontent() {
		return incontent;
	}

	public void setIncontent(String incontent) {
		this.incontent = incontent;
	}

	public String getInimage() {
		return inimage;
	}

	public void setInimage(String inimage) {
		this.inimage = inimage;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

	public String getAnswerdate() {
		return answerdate;
	}

	public void setAnswerdate(String answerdate) {
		this.answerdate = answerdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getQuestid() {
		return questid;
	}

	public void setQuestid(String questid) {
		this.questid = questid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getInquiryid() {
		return inquiryid;
	}

	public void setInquiryid(String inquiryid) {
		this.inquiryid = inquiryid;
	}
	
	
}
