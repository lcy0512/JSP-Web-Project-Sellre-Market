package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.SignUpDao;

public class MSignUp implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String userid = request.getParameter("memberId");
		String password = request.getParameter("password");
		String tel = request.getParameter("mobileNumber");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		String allAddress = address.concat(detailAddress);
		String gender = request.getParameter("gender");
		
		if(gender.length() == 4) {
			// 성별 선택안함
			gender = Integer.toString(2);
		}
		else if(gender.length() == 5) {
			// 성별 남성
			gender = Integer.toString(0);
		}
		else {
			// 성별 여성
			gender = Integer.toString(1);
		}
		
		String birthYear = request.getParameter("birthYear");
		String birthMonth = request.getParameter("birthMonth");
		String birthDay = request.getParameter("birthDay");
		
		String birthdate = birthYear + "-" + birthMonth + "-" + birthDay;
		
		SignUpDao dao = new SignUpDao();
		
		dao.customerSignUp(userid, password, tel, name, email ,allAddress, gender, birthdate);
	}

}
