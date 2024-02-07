package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminGetPackTypeDao;
import com.market.dto.AdminGetPackTypeDto;

public class MAdminGetPackKind implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		ArrayList<AdminGetPackTypeDto> packKind = new AdminGetPackTypeDao().selectPackKind();
		
		request.setAttribute("packKind", packKind);
		
	}

}
