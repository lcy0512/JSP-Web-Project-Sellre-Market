package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminGetCategoryDao;
import com.market.dto.AdminGetCategoryDto;

public class MAdminGetCategory implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//카테고리 대분류 가져오기
		ArrayList<AdminGetCategoryDto> typeList = new AdminGetCategoryDao().selectCategory();
		request.setAttribute("typeList", typeList);
	}

}
