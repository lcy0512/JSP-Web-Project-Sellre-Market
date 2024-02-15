package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminBrandDao;
import com.market.dto.AdminBrandDto;

public class MBrandSelect implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<AdminBrandDto> list = new AdminBrandDao().selectBrand();
		request.setAttribute("list", list);

	}

}
