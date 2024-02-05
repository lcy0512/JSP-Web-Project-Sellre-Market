package com.market.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.MainViewDao;
import com.market.dto.MainViewDto;

public class MCmainView implements MCommand{
	
/*
	1. Date : 2024.02.02
	2. Author : Woody Jo
	3. Version : v1.0.0
	4. Description : 메인 body 페이지 Dto 
*/

	@Override
	public void execute(HttpServletRequest reqeust, HttpServletResponse response) {
		MainViewDao mainDao = new MainViewDao();
		
		List<MainViewDto> productDtos = mainDao.productView();
		List<MainViewDto> eventDtos =  mainDao.getEventImgs();
		
		for (MainViewDto dto : productDtos) {
			System.out.println(dto.getYsrc());
		}
		for (MainViewDto dto : eventDtos) {
			System.out.println(dto.getEimg());
		}
		
		reqeust.setAttribute("productList", productDtos);
		reqeust.setAttribute("eventImgs", eventDtos);
	}
}
