package com.market.dto;

public class SignUpDto {
	
	private String userid;
	private String userpassword;
	private String useremail;
	private String useremailHash;
	private boolean useremailchecked;
	
	
	public SignUpDto() {
		// TODO Auto-generated constructor stub
	}


	public SignUpDto(String userid, String userpassword, String useremail, String useremailHash,
			boolean useremailchecked) {
		super();
		this.userid = userid;
		this.userpassword = userpassword;
		this.useremail = useremail;
		this.useremailHash = useremailHash;
		this.useremailchecked = useremailchecked;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getUserpassword() {
		return userpassword;
	}


	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}


	public String getUseremail() {
		return useremail;
	}


	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}


	public String getUseremailHash() {
		return useremailHash;
	}


	public void setUseremailHash(String useremailHash) {
		this.useremailHash = useremailHash;
	}


	public boolean isUseremailchecked() {
		return useremailchecked;
	}


	public void setUseremailchecked(boolean useremailchecked) {
		this.useremailchecked = useremailchecked;
	}
	
	
	
}
