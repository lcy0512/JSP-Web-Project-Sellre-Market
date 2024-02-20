package com.market.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.AdminDeliveryDao;
import com.market.dto.AdminDeliverDto;

public class MAdminDelivery implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	ArrayList<AdminDeliverDto> dname = new AdminDeliveryDao().seletList();
		
	request.setAttribute("dname", dname);
		
	}

}
