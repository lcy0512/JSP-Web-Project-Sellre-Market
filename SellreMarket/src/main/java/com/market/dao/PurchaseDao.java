package com.market.dao;

import static com.market.common.support.Constants.DATASOURCE_CONTEXT_NAME;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.List;
import java.util.Objects;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.market.purchase.domain.Purchase;

public class PurchaseDao {
	
	public static PurchaseDao getInstance() {
		return LazyHolder.INSTANCE;
	}

	private DataSource dataSource;

	public PurchaseDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup(DATASOURCE_CONTEXT_NAME);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public int save(Purchase entity) {
		String query = """
				INSERT INTO purchase (
					userid,
					addressid,
					payid,
					couponid,
					productid,
					amount,
					purchasedate,
					status
				) VALUES (
					?,
					?,
					?,
					?,
					?,
					?,
					?,
					?
				)
				""";

		try (Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query);) {
			preparedStatement.setString(1, entity.getUserId());
			preparedStatement.setLong(2, entity.getAddressId());
			preparedStatement.setLong(3, entity.getPayId());
			preparedStatement.setLong(4, entity.getCouponId());
			preparedStatement.setLong(5, entity.getProductId());
			preparedStatement.setInt(6, entity.getAmount());
			preparedStatement.setTimestamp(7, Timestamp.from(entity.getPurchasedAt()));
			preparedStatement.setString(8, entity.getStatus().name());
			return preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	private static class LazyHolder {
		private static final PurchaseDao INSTANCE = new PurchaseDao();
	}

	public int saveAll(List<Purchase> entities) {
		Objects.requireNonNull(entities);
		if (entities.isEmpty()) {
			throw new RuntimeException("");
		}
		
		String valuesPartial = """
				(
					?,
					?,
					?,
					?,
					?,
					?,
					?,
					?
				)
				""";
		
		String query = """
				INSERT INTO purchase
				(
					userid,
					addressid,
					payid,
					couponid,
					productid,
					amount,
					purchasedate,
					status
				)
				VALUES
				""";
		
		StringBuilder stringBuilder = new StringBuilder();
		for (int i = 0; i < entities.size() - 1; i++) {
			stringBuilder.append(valuesPartial);
			stringBuilder.append(',');
		}
		stringBuilder.append(valuesPartial);

		try (Connection connection = dataSource.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(query);) {
			for (int i = 0; i < entities.size(); i++) {
				Purchase entity = entities.get(i);
				int baseGain = 8 * i;
				
				preparedStatement.setString(1, entity.getUserId());
				preparedStatement.setLong(2, entity.getAddressId());
				preparedStatement.setLong(3, entity.getPayId());
				preparedStatement.setLong(4, entity.getCouponId());
				preparedStatement.setLong(5, entity.getProductId());
				preparedStatement.setInt(6, entity.getAmount());
				preparedStatement.setTimestamp(7, Timestamp.from(entity.getPurchasedAt()));
				preparedStatement.setString(8, entity.getStatus().name());
			}
			return preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
