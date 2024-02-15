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
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/myDB");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public void addCartItems(String[] cartItemNames) {
        Connection conn = null;
        
        try {
            // 데이터베이스 연결 가져오기
            conn = dataSource.getConnection();

            // SQL 쿼리문을 통해 DB에 cartItemNames를 추가하는 코드
            String query = "INSERT INTO cart (productid, userid) VALUES ((SELECT productid FROM product WHERE pname = ?), 'baboya')";

            try (PreparedStatement statement = conn.prepareStatement(query)) {
                // cartItemNames의 각 항목을 DB에 추가
                for (String itemName : cartItemNames) {
                    statement.setString(1, itemName);
                    System.out.println(itemName);
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
