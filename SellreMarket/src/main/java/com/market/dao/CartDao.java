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
	
	public int save(String userId, Long productId, Integer amount) {
		String query = """
				INSERT INTO cart (
					userid,
					productid,
					qty
				) VALUES (
					?,
					?,
					?
				)
				""";
		
		try (
				Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query);
		) {
			preparedStatement.setString(1, userId);
			preparedStatement.setLong(2, productId);
			preparedStatement.setInt(3, amount);
			return preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
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
					INNER JOIN price
				        ON c.productid = price.productid
					LEFT JOIN event
						ON c.productid = event.productid
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

	public int updateAmountByCartId(Long cartId, Integer amount) {
		String query = """
				UPDATE cart
				SET qty = ?
				WHERE cartid = ?
				""";
		
		try (
				Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query);
		) {
			preparedStatement.setInt(1, amount);
			preparedStatement.setLong(2, cartId);
			return preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public boolean existsByUserIdAndCartId(String userId, Long cartId) {
		String query = """
				SELECT count(cartid) as result
				FROM sellremarket.cart
				WHERE cartid = ?
					AND userid = ?
				""";
		
		try (
				Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query);
		) {
			preparedStatement.setLong(1, cartId);
			preparedStatement.setString(2, userId);
			
			// (AutoCloseable용 try 구문)
			try (ResultSet rs = preparedStatement.executeQuery()) {
				int result = 0;
				while (rs.next()) {
					result = rs.getInt("result");
				}
				return result > 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public void deleteByCartId(Long cartId) {
		String query = """
				DELETE FROM cart
				WHERE cartid = ?
				""";
		
		try (
				Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query);
		) {
			preparedStatement.setLong(1, cartId);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
