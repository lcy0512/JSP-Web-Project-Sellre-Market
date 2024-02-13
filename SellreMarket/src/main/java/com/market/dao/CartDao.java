package com.market.dao;

import static com.market.common.support.Constants.DATASOURCE_CONTEXT_NAME;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.market.dao.projection.CartListViewProjection;

public class CartDao {
	private DataSource dataSource;
	
	public CartDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup(DATASOURCE_CONTEXT_NAME);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public int save(Long productId, Integer amount) {
		return 0;
	}
	
	/**
	 * <h1>사용자 별 cart list 조회하기.</h1>
	 * <ul>
	 *   <li>A</li>
	 *   <li>B</li>
	 *   <li>C</li>
	 * </ul>
	 * @param userId (주로 로그인 된 사용자로) 사용자 아이디
	 * @return 해당 사용자의 카트 아이템 목록
	 */
	public List<CartListViewProjection> findCartsByUserId(String userId) {
		List<CartListViewProjection> list = new ArrayList<>();
		
		String query = """
				SELECT
					c.cartid as cartId,
					c.productid as productId,
					c.recipeid as recipeId,
					c.qty as amount,
					prod.pname as productName,
					price.priceid as priceId,
					price.price as price,
					event.eventid as eventId,
					event.salerate as saleRate,
					img.image as imagePath
				FROM cart c
					INNER JOIN product prod
						ON c.productid = prod.productid
					LEFT JOIN event
						ON c.productid = event.productid
					INNER JOIN price
				        ON c.productid = price.productid
					LEFT JOIN product_image img
						on c.productid = img.productid
				WHERE c.userid = ?
				""";
		
		try (
				Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query);
		) {
			preparedStatement.setString(1, userId);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				CartListViewProjection projection = CartListViewProjection.builder()
						.cartId(rs.getLong("cartId"))
						.productId(rs.getLong("productId"))
						.recipeId(rs.getLong("recipeId"))
						.amount(rs.getInt("amount"))
						.productName(rs.getString("productName"))
						.priceId(rs.getLong("priceId"))
						.price(rs.getInt("price"))
						.eventId(rs.getLong("eventId"))
						.saleRate(rs.getInt("saleRate"))
						.imagePath(rs.getString("imagePath"))
						.build();
				
				list.add(projection);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
