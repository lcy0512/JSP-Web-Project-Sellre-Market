package com.market.dto;

public class AdminQuestDto {

	int inquiryid;
	String intitle;
	String incontent;
	String inimage;
	String answer;
	String insertdate;
	String answerdate;
	String status;
	
	public AdminQuestDto() {
		
	}

	public AdminQuestDto(int inquiryid, String intitle, String incontent, String inimage, String answer,
			String insertdate, String answerdate, String status) {
		super();
		this.inquiryid = inquiryid;
		this.intitle = intitle;
		this.incontent = incontent;
		this.inimage = inimage;
		this.answer = answer;
		this.insertdate = insertdate;
		this.answerdate = answerdate;
		this.status = status;
	}

	public int getInquiryid() {
		return inquiryid;
	}

	public void setInquiryid(int inquiryid) {
		this.inquiryid = inquiryid;
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
	
	
}
