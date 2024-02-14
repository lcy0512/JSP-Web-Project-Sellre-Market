package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminSaleDao;
import com.market.dto.AdminSaleDto;

public class MAdminUserChart implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		ArrayList<AdminSaleDto> list = new AdminSaleDao().userList();
		request.setAttribute("list", list);
	}

}
