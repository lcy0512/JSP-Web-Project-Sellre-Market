package com.market.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.MainViewDao;
import com.market.dto.MainViewDto;

public class MCmainView implements MCommand{

	@Override
	public void execute(HttpServletRequest reqeust, HttpServletResponse response) {
		MainViewDao mainDao = new MainViewDao();
		
		List<MainViewDto> productDtos = mainDao.productView();
		List<MainViewDto> eventDtos =  mainDao.getEventImgs();
		
		reqeust.setAttribute("productList", productDtos);
		reqeust.setAttribute("eventImgs", eventDtos);
	}
}
