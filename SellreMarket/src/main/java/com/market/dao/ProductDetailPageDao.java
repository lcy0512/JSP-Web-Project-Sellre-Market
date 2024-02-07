package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.market.dto.ProductDetailPageDto;

public class ProductDetailPageDao {
    
    DataSource dataSource;
    
    public ProductDetailPageDao() {
        try {
            Context context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/2jo");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<ProductDetailPageDto> getProductInfo(String id) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<ProductDetailPageDto> resultList = new ArrayList<>(); // DTO 객체를 담을 리스트 생성
        
        try {
            conn = dataSource.getConnection();
            
            String query = "select p.productid, p.pname, pr.price, "
            							+ "pr.price-(pr.price*(e.salerate/100)) as discountedPrice, "
            							+ "e.salerate, d.dname "
            					 + "from product p, price pr, event e, delivery_type d "
            					 + "where p.productid = ? "
            					 		+ "and p.productid = pr.productid "
            					 		+ "and e.eventid = '1' "
            					 		+ "and d.productid = p.productid";
            
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            
            rs = ps.executeQuery();
            
            while (rs.next()) {
                ProductDetailPageDto dto = new ProductDetailPageDto(
                    rs.getInt("productid"),
                    rs.getInt("price"),
                    rs.getInt("discountedPrice"),
                    rs.getInt("salerate"),
                    rs.getString("pname"),
                    rs.getString("dname")
                ); // DTO 객체 생성 및 초기화
                resultList.add(dto); // 리스트에 DTO 객체 추가
                System.out.println("DAO에서 상품명 출력 : " + dto.getProductName());
                System.out.println("DAO에서 원가 출력 : " + dto.getPrice());
                System.out.println("DAO에서 할인가 출력 : " + dto.getDiscountedPrice());
                System.out.println("DAO에서 할인율 출력 : " + dto.getSalerate());
                System.out.println("DAO에서 배송명 출력 : " + dto.getDeliveryName());
            }       
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return resultList; // DTO 객체를 담은 리스트 반환
    }
}
