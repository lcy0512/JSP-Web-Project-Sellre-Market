package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminGetCategoryDao;
import com.market.dto.AdminGetCategoryDto;

public class MAdminGetSubCategory implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String type = request.getParameter("categoryType");
				
		//카테고리 중분류 가져오기
		ArrayList<AdminGetCategoryDto> subList = new AdminGetCategoryDao().selectCategorySubType(type);
		request.setAttribute("subList", subList);
		

	}

}
