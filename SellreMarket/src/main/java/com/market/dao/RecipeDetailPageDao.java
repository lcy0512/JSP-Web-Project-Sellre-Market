package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.market.dto.RecipeDetailPageDto;

public class RecipeDetailPageDao {
    
    DataSource dataSource;
    
    public RecipeDetailPageDao() {
        try {
            Context context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/sellreMarket");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<RecipeDetailPageDto> getProductInfo(String id) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<RecipeDetailPageDto> resultList = new ArrayList<>(); // DTO 객체를 담을 리스트 생성
        
        try {
            conn = dataSource.getConnection();
            
            String query = "select r.recipeid, p.pname, pri.price, (pri.price - (pri.price * (e.salerate)/100)) as saleprice "
            					 + "from recipeOfYoutuber r, product p, productOfRecipe pr, price pri, event e "
            					 + "where r.recipeid = ? "
            					 + "and r.recipeid = pr.recipeid "
            					 + "and pr.productid = p.productid "
            					 + "and pri.productid = p.productid "
            					 + "and e.productid = p.productid";
            
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            
            rs = ps.executeQuery();
            
            while (rs.next()) {
            	RecipeDetailPageDto dto = new RecipeDetailPageDto(
                    rs.getInt("recipeid"),
                    rs.getString("pname"),
                    rs.getInt("price"),
                    rs.getInt("saleprice")
                ); // DTO 객체 생성 및 초기화
                resultList.add(dto); // 리스트에 DTO 객체 추가
                System.out.println("DAO에서 상품명 출력 : " + dto.getProductName());
                System.out.println("DAO에서 상품가격 출력 : " + dto.getProductPrice());
                System.out.println("DAO에서 할인가격 출력 : " + dto.getDiscountedPrice());
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
