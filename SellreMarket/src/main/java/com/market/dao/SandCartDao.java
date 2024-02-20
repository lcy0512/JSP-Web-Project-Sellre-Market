package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class SandCartDao {
    DataSource dataSource;

    public SandCartDao() {
        try {
            Context context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/sellreMarket");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public void addCartItems(String[] cartItemNames, String[] cartItemQuantities) {
        Connection conn = null;
        
        try {
            // 데이터베이스 연결 가져오기
            conn = dataSource.getConnection();

            // SQL 쿼리문을 통해 DB에 cartItemNames를 추가하는 코드
            String query = "INSERT INTO cart (productid, qty, userid) VALUES ((SELECT productid FROM product WHERE pname = ?), ?, 'baboya')";

            try (PreparedStatement statement = conn.prepareStatement(query)) {
                // cartItemNames와 cartItemQuantities를 함께 처리
                for (int i = 0; i < cartItemNames.length; i++) {
                    String itemName = cartItemNames[i];
                    String itemQuantity = cartItemQuantities[i];
                    
                    statement.setString(1, itemName);
                    statement.setString(2, itemQuantity);
                    
                    System.out.println("DAO에서 이름 쳐 넣음 : " + itemName);
                    System.out.println("DAO에서 수량 쳐 넣음 : " + itemQuantity);
                    
                    statement.executeUpdate(); // 각 항목을 개별적으로 추가
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 연결 닫기
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

}
