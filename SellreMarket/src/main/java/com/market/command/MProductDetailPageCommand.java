package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.ProductDetailPageDao;

public class MProductDetailPageCommand implements MCommand {

	@Override
	public void execute(HttpServletRequest reqeust, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
        String id = reqeust.getParameter("1");
        
        System.out.println("command의 id 값" +id);
        
        ProductDetailPageDao dao = new ProductDetailPageDao();
        String result = dao.ProductInfo(id);
        
        System.out.println("command의 result" + result);
        
        // 결과 속성 설정
        reqeust.setAttribute("name", result);
	}

}
