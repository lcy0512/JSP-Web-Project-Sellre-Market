package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.SignUpDao;
import com.market.dao.UserInfoDao;

public class MSignUp implements MCommandReturnInt {

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		// TODO Auto-generated method stub
		
		String userid = request.getParameter("memberId");
		String nowpassword = request.getParameter("nowpassword");
		String password = request.getParameter("password");
		String tel = request.getParameter("mobileNumber");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		
		if(password == null) {
			password = nowpassword;
		}
		
		String gender = request.getParameter("gender");
		System.out.println("gender : " + gender);
		if(gender.equals("NONE")) {
			System.out.println("성별 선택안함");
			// 성별 선택안함
			gender = Integer.toString(2);
		}
		else if(gender.equals("MALE")) {
			System.out.println("성별 남성");
			// 성별 남성
			gender = Integer.toString(0);
		}
		else {
			System.out.println("성별 여성");
			// 성별 여성
			gender = Integer.toString(1);
		}
		
		String birthYear = request.getParameter("birthYear");
		String birthMonth = request.getParameter("birthMonth");
		String birthDay = request.getParameter("birthDay");
		
		String birthdate = birthYear + "-" + birthMonth + "-" + birthDay;
		
		SignUpDao dao = new SignUpDao();
		
		// 아이디 중복이 있으면 false, 없으면 true
		if(!dao.checkDuplicatedId(userid)) {
			result = 2;
			
			UserInfoDao infoDao = new UserInfoDao();
			// 회원정보 수정
			infoDao.updateUserInfo(userid, password, tel, name, email, address, detailAddress, gender, birthdate);
		}
		else {
			result = 1;
			
			// 회원가입 정보 입력
			dao.customerSignUp(userid, password, tel, name, email ,address, detailAddress, gender, birthdate);
			// 배송지 정보 입력
			int defaultset = 1;
			dao.deliveryInfo(address, detailAddress, defaultset, userid);
		}
		
		return result;
	}

}
