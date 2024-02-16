package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.SandCartDao;

public class MSendCartCommand implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	    // id 파라미터 가져오기
		String[] cartItemNames = (String[]) request.getAttribute("cartItemNames");
	    
        if (cartItemNames == null || cartItemNames.length == 0) {
            // 장바구니 상품 이름이 없는 경우 처리
            System.out.println("장바구니에 상품이 없습니다.");
            return;
        }

        // 첫 번째 상품의 이름 가져오기
        String itemName1 = cartItemNames[0];
        String itemName2 = cartItemNames[1];
        String itemName3 = cartItemNames[2];

        System.out.print("장바구니 : " + itemName1 + itemName2 + itemName3);
        
        SandCartDao dao = new SandCartDao();
        dao.addCartItems(cartItemNames);
    }
}