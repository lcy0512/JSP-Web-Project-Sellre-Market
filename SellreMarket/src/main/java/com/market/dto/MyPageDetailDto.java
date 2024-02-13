package com.market.dto;

public class MyPageDetailDto {
	
	String userid;
	String password;
	String tel_no;
	String name;
	String email;
	String address;
	String detailaddress;
	String gender;
	String birthdate;
	String status;
	
	public MyPageDetailDto() {
		// TODO Auto-generated constructor stub
	}
	
	public MyPageDetailDto(String userid, String password, String tel_no, String name, String email, String address,
			String detailaddress,String gender, String birthdate, String status) {
		super();
		this.userid = userid;
		this.password = password;
		this.tel_no = tel_no;
		this.name = name;
		this.email = email;
		this.address = address;
		this.detailaddress = detailaddress;
		this.gender = gender;
		this.birthdate = birthdate;
		this.status = status;
	}
	
	// UserInfoDao.userDetail (개인정보 수정 시 불러올때 사용)
	public MyPageDetailDto(String userid, String password, String tel_no, String name, String email, String address,
			String detailaddress,String gender, String birthdate) {
		super();
		this.userid = userid;
		this.password = password;
		this.tel_no = tel_no;
		this.name = name;
		this.email = email;
		this.address = address;
		this.detailaddress = detailaddress;
		this.gender = gender;
		this.birthdate = birthdate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTel_no() {
		return tel_no;
	}

	public void setTel_no(String tel_no) {
		this.tel_no = tel_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDetailaddress() {
		return detailaddress;
	}

	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	
}
