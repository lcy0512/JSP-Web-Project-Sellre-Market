package com.market.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.ProductDetailPageDao;
import com.market.dao.RecipeDetailPageDao;
import com.market.dto.ProductDetailPageDto;
import com.market.dto.RecipeDetailPageDto;

public class MRecipeDetailPageCommand implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	    // id 파라미터 가져오기
	    String id = (String)request.getSession().getAttribute("recipeID");
	    
	    if (id == null) {
	        // id가 없는 경우 처리
	        return;
	    }
	    
	    System.out.println("command의 id 값 : " + id);
	    
	    // ProductDetailPageDao 객체 생성
	    RecipeDetailPageDao dao = new RecipeDetailPageDao();
	    
        // 상품 정보 가져오기
        List<RecipeDetailPageDto> resultList = dao.getProductInfo(id);
        
        // 결과 리스트가 비어있는 경우 처리
        if (resultList.isEmpty()) {
            return;
        }
        
     // 결과 리스트 디버깅
        System.out.println("resultList 크기: " + resultList.size());

        // pname을 담을 리스트 생성
        List<String> pnameList = new ArrayList<>();
        List<Integer> priceList = new ArrayList<>();
        List<Integer> slaepriceList = new ArrayList<>();

        for (RecipeDetailPageDto productInfo : resultList) {
            // 각 상품 정보를 사용하여 필요한 작업 수행
            System.out.println("상품명: " + productInfo.getProductName());
            System.out.println("상품가격: " + productInfo.getProductPrice());
            System.out.println("할인가격: " + productInfo.getDiscountedPrice());

            // 결과 속성 설정
            String pname = productInfo.getProductName();
            Integer price =  productInfo.getProductPrice();
            Integer saleprice =  productInfo.getDiscountedPrice();
            pnameList.add(pname); // pname 을 리스트에 추가
            priceList.add(price); // price 를 리스트에 추가
            slaepriceList.add(saleprice); // saleprice 를 리스트에 추가

            // 디버깅을 위해 결과 속성 값을 출력
            System.out.println("속성 pname 설정: " + pname);
            System.out.println("속성 price 설정: " + price);
            System.out.println("속성 saleprice 설정: " + saleprice);
        }

        // pname 리스트를 request 속성으로 설정
        request.setAttribute("pnameList", pnameList);
        request.setAttribute("priceList", priceList);
        request.setAttribute("slaepriceList", slaepriceList);

        // 최종 출력
        System.out.println("최종 :  " + request.getAttribute("pnameList"));
        System.out.println("최종 :  " + request.getAttribute("priceList"));
        System.out.println("최종 :  " + request.getAttribute("slaepriceList"));
    }
}