package com.project.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.project.dto.OrdersDto;

public class OrdersDao {
private OrdersDao() {
		
	}
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private static OrdersDao instance = new OrdersDao();
	public static OrdersDao getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		Context ctx = null;
		try {
			ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	
	public int addOrder(OrdersDto order) {
		int result = FAIL;
		String sql = "INSERT INTO ORDERS (ONO, ONAME, OPHONE, OADDRESS, OADDRESSDETAIL, ONOTE, MID) " + 
				"    VALUES (ORDERNUM_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order.getoName());
			pstmt.setString(2, order.getoAddress());
			pstmt.setString(3, order.getoAddressDetail());
			pstmt.setString(4, order.getoPhone());
			pstmt.setString(5, order.getoNote());
			pstmt.setString(6, order.getmId());
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS?"Orders table insert successful":"orders table insert failed" );
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage()+ "주문 실패");
			}
		}
		return result;
	}

	
	
	
	public OrdersDto getOrder(String oNo) {
		OrdersDto order =null;
		String sql = "SELECT * FROM ORDERS WHERE ONO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, oNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String oName = rs.getString("oName");
				String oAddress = rs.getString("oAddress");
				String oAddressDetail = rs.getString("oAddressDetail");
				String oPhone = rs.getString("oPhone");
				String oNote = rs.getString("oNote");
				Date oDate = rs.getDate("oDate");
				String mId = rs.getString("mId");
				order = new OrdersDto(oNo, oName, oAddress, oAddressDetail, oPhone, oNote, oDate, mId);
				
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return order;
	}
	
/*	public int salesDate(int year,int month,int date) {
		String dateStr = year+"-"+month+"-"+date;
		return salesDate(dateStr);
	}
	public int salesDate(String date) {
		int result = 0;
		String sql = "SELECT SUM(PURCHASE_AMOUNT) FROM ORDERS WHERE ODATE BETWEEN TO_DATE(?,'YY-MM-DD') AND TO_DATE(?,'YY-MM-DD')+1";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setString(2, date);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("salesDate오류:"+e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	public int salesMonth(int year,int month) {
		int result = 0;
		String preMonth = year+"-"+month+"-01";
		String nextMonth = "";
		if(month==12) {
			nextMonth = year+"-"+month+"-01";
		}else {
			nextMonth = year+1+"-01-01";
		}
		String sql = "SELECT SUM(PURCHASE_AMOUNT) FROM ORDERS WHERE ODATE BETWEEN TO_DATE(?,'YY-MM-DD') AND TO_DATE(?,'YY-MM-DD')+1";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, preMonth);
			pstmt.setString(2, nextMonth);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("salesDate오류:"+e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	public ArrayList<Orders_dto> getDateOrders(int year,int month,int date) {
		String dateStr = year+"-"+month+"-"+date;
		return getDateOrders(dateStr);
	}
	public ArrayList<Orders_dto> getDateOrders(String date) {
		ArrayList<Orders_dto> orders = new ArrayList<Orders_dto>();
		String sql = "SELECT * FROM ORDERS WHERE ODATE BETWEEN TO_DATE(?,'YY-MM-DD') AND TO_DATE(?,'YY-MM-DD')+1";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setString(2, date);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int ono = rs.getInt("ono");
				Date odate = rs.getDate("odate");
				Date parrive_date = rs.getDate("parrive_date");
				int purchase_amount = rs.getInt("purchase_amount");
				int dno = rs.getInt("dno");
				String mid = rs.getString("mid");
				orders.add(new Orders_dto(ono, odate, parrive_date, null, null, purchase_amount, dno, mid));
			}
		} catch (Exception e) {
			System.out.println("getDateOrders오류:"+e.getMessage());
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return orders;
	} */
}
