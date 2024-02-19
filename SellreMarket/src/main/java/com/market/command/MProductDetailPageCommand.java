package com.market.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.dao.ProductDetailPageDao;
import com.market.dto.ProductDetailPageDto;

public class MProductDetailPageCommand implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	    // id 파라미터 가져오기
	    String id = (String)request.getSession().getAttribute("productID");
	    
	    if (id == null) {
	        // id가 없는 경우 처리
	        return;
	    }
	    
	    System.out.println("<<<command에 ID값 불러오기>>>");
	    System.out.println("command의 id 값 : " + id);
	    
	    // ProductDetailPageDao 객체 생성
	    ProductDetailPageDao dao = new ProductDetailPageDao();
	    
        // 상품 정보 가져오기
        List<ProductDetailPageDto> resultList = dao.getProductInfo(id);
        
        // 결과 리스트가 비어있는 경우 처리
        if (resultList.isEmpty()) {
            return;
        }
        
        // 결과 리스트 디버깅
	    System.out.println("<<<DAO 처리 이후 resultList 크기>>>");
        System.out.println("resultList 크기: " + resultList.size());
        System.out.println("<<<DAO 처리 이후 목록 출력>>>");
        
        for (ProductDetailPageDto productInfo : resultList) {
            System.out.println("상품명: " + productInfo.getProductName());
            System.out.println("가격: " + productInfo.getPrice());
            System.out.println("할인 가격: " + productInfo.getDiscountedPrice());
            System.out.println("할인율: " + productInfo.getSalerate());
            System.out.println("배송명: " + productInfo.getDeliveryName());
            System.out.println("이미지이름: " + productInfo.getImage());
        }
        
        // 결과 리스트에 있는 모든 상품 정보 사용
        for (ProductDetailPageDto productInfo : resultList) {
            // 각 상품 정보를 사용하여 필요한 작업 수행
            System.out.println("상품명: " + productInfo.getProductName());
            System.out.println("가격: " + productInfo.getPrice());
            System.out.println("할인 가격: " + productInfo.getDiscountedPrice());
            System.out.println("할인율: " + productInfo.getSalerate());
            System.out.println("배송명: " + productInfo.getDeliveryName());
            System.out.println("이미지이름: " + productInfo.getImage());
            
            // 결과 속성 설정
            request.setAttribute("pname", productInfo.getProductName());
            request.setAttribute("price", productInfo.getPrice());
            request.setAttribute("discountedPrice", productInfo.getDiscountedPrice());
            request.setAttribute("salerate", productInfo.getSalerate());
            request.setAttribute("dname", productInfo.getDeliveryName());
            request.setAttribute("image", productInfo.getImage());
            
            // 디버깅을 위해 결과 속성 값을 출력
            System.out.println("속성 productName 설정: " + request.getAttribute("pname"));
            System.out.println("속성 price 설정: " + request.getAttribute("price"));
            System.out.println("속성 discountedPrice 설정: " + request.getAttribute("discountedPrice"));
            System.out.println("속성 salerate 설정: " + request.getAttribute("salerate"));
            System.out.println("속성 deliveryName 설정: " + request.getAttribute("dname"));
            System.out.println("속성 image 설정: " + request.getAttribute("image"));
            
            // 필요한 작업 수행
            // 예: request에 속성 설정 등
        }
	}
}
