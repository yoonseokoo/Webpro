package com.lec.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.dto.MemberDto;
import com.lec.dto.MoneyDto;


public class MoneyDao {
	
	public static final int SUCCESS = 1;
	public static final int FAIl = 0;

	private static MoneyDao INSTANCE = new MoneyDao();

	public static MoneyDao getInstance() {
		return INSTANCE;
	}

	private MoneyDao() {
	}

	public static Connection getConnection() throws SQLException {
		Connection conn = null;
		Context ctx;
		try {
			ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	// -- [1] 제품 매출 조회 list
				public ArrayList<MoneyDto> MoneySales() throws Exception {
					ArrayList<MoneyDto> dtos = new ArrayList<MoneyDto>();
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = "SELECT PCODE, SUM(PRICE) TOTSALES " + 
							"        FROM MONEY " + 
							"        GROUP BY PCODE";
					try {
						conn = getConnection();
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						while (rs.next()) {
							String pcode = rs.getString("pcode");
							int totsales = rs.getInt("totsales");
							dtos.add(new MoneyDto(pcode, totsales));
						}
					} catch (SQLException e) {
						System.out.println(e.getMessage());
					} finally {
						try {
							if (rs != null)
								rs.close();
							if (pstmt != null)
								pstmt.close();
							if (conn != null)
								conn.close();
						} catch (Exception e2) {
							System.out.println(e2.getMessage());
						}
					}
					return dtos;
				}
}
