package com.market.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.SandCartDao;

public class MSendCartCommand implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	    // id 파라미터 가져오기
		String[] cartItemNames = (String[]) request.getAttribute("cartItemNames");
		String[] cartItemQuantities = (String[]) request.getAttribute("cartItemQuantities");
	    
        if (cartItemNames == null || cartItemNames.length == 0) {
            // 장바구니 상품 이름이 없는 경우 처리
            System.out.println("장바구니에 상품이 없습니다.");
            return;
        }
        
        if (cartItemQuantities == null || cartItemQuantities.length == 0) {
            // 장바구니 상품 이름이 없는 경우 처리
            System.out.println("장바구니에 상품이 없습니다.");
            return;
        }

        // 첫 번째 상품의 이름 가져오기
        String itemName1 = cartItemNames[0];
        String itemName2 = cartItemNames[1];
        String itemName3 = cartItemNames[2];
        
        String itemQuantities1 = cartItemQuantities[0];
        String itemQuantities2 = cartItemQuantities[1];
        String itemQuantities3 = cartItemQuantities[2];
             
        System.out.println("Command 장바구니 이름 : " + itemName1 + "and " + itemName2 + "and " + itemName3);
        System.out.println("Command 장바구니 수량 : " + itemQuantities1 + "and " + itemQuantities2 + "and " + itemQuantities3);
        
        SandCartDao dao = new SandCartDao();
        dao.addCartItems(cartItemNames, cartItemQuantities);
    }
}