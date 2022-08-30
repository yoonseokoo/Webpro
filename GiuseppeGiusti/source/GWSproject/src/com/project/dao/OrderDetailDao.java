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

import com.project.dto.OrderDetailDto;
public class OrderDetailDao {
private OrderDetailDao() {
		
	}
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private static OrderDetailDao instance = new OrderDetailDao();
	public static OrderDetailDao getInstance() {
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
	
	public int addOrderDetail(String mId) {
		int result = FAIL;
		String sql = " INSERT INTO ORDER_DETAIL (ODNO,ONO,CARTQUANTITY, PID) " + 
				"    SELECT ORDERDETAILNUM_SEQ.NEXTVAL, ORDERNUM_SEQ.CURRVAL, C.CARTQUANTITY, C.PID "
				+ "    FROM CART C " + 
				"    WHERE MID= ? ";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage()+ "주문 상세 동륵 실패");
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage()+ "주문 상세 동륵 실패");
			}
		}
		return result;
	} 
	
	public ArrayList<OrderDetailDto> getOrderDetail(String mId) {
		ArrayList<OrderDetailDto> ods = new ArrayList<OrderDetailDto>();
		String sql = "select  od.*, o.odate, pname, pprice, pimage  from orders o, order_detail od , product p where o.MID= ? and o.ono=od.ono and p.pid=od.pid";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int oDno = rs.getInt("oDno");
				String oNo = rs.getString("oNo");
				String cartQuantity = rs.getString("cartQuantity");
				String pId = rs.getString("pId");
				String pName = rs.getString("pName");
				int pPrice = rs.getInt("pPrice");
				String pImage = rs.getString("pImage");
				Date oDate = rs.getDate("oDate");
				ods.add(new OrderDetailDto(oDno, oNo, pId, pName, pPrice, cartQuantity, pImage, oDate));
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
		return ods;
	} 
	
}
