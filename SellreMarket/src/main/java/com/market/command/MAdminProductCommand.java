package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminProductDao;
import com.market.dto.AdminProductDto;

public class MAdminProductCommand implements MCommand{

	@Override
	public void execute(HttpServletRequest reqeust, HttpServletResponse response) {
		
		AdminProductDao dao = new AdminProductDao();
		ArrayList<AdminProductDto> list = dao.selectList();
		
		reqeust.setAttribute("list", list);
	}

}
