package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminProductDao;
import com.market.dto.AdminProductDto;

public class MAdminProductCommand implements MCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		AdminProductDao dao = new AdminProductDao();
		ArrayList<AdminProductDto> list = dao.selectList();
		
		request.setAttribute("list", list);
		
	}

}
