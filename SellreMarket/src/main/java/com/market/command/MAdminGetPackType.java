package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminGetCategoryDao;
import com.market.dao.AdminGetPackTypeDao;
import com.market.dto.AdminGetCategoryDto;
import com.market.dto.AdminGetPackTypeDto;

public class MAdminGetPackType implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		ArrayList<AdminGetPackTypeDto> packType = new AdminGetPackTypeDao().selectPackType();
		request.setAttribute("packType", packType);
		
	}
}
