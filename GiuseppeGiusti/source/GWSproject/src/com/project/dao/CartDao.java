package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.project.dto.CartDto;

public class CartDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	public static final int EXISTENT    = 0;
	public static final int NONEXISTENT = 1;
	private CartDao() {
	}
	
	private static CartDao instance = new CartDao();
	public static CartDao getInstance() {
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
	public int cartProductExist(String mId,String pId) {
		int result = EXISTENT;
		String sql = "SELECT * FROM CART WHERE MID=? AND PID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setString(2, pId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = EXISTENT;
			}else {
				result = NONEXISTENT;
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
		return result;
	} 
	
	public int cartAddProduct(String mId,String pId, String cartQuantity) {
		int result = FAIL;
		String sql = "INSERT INTO CART VALUES (CART_SEQ.NEXTVAL,?,?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setString(2, pId);
			pstmt.setString(3, cartQuantity);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	public ArrayList<CartDto> getCart(String mId) {
		ArrayList<CartDto> cart = new ArrayList<CartDto>();
		String sql = "SELECT C.*, PSTOCK, PDISCOUNT, PPRICE, PNAME, PIMAGE " + 
				"    FROM CART C, PRODUCT P, MEMBER M " + 
				"    WHERE M.MID=C.MID " + 
				"    AND P.PID=C.PID " + 
				"    AND M.MID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int cartNo = rs.getInt("cartNo");
				String cartQuantity = rs.getString("cartQuantity");
				String pId = rs.getString("pId");
				String pName = rs.getString("pName");
				String pImage = rs.getString("pImage");
				int pStock = rs.getInt("pStock");
				int pPrice = rs.getInt("pPrice");
				int pDiscount = rs.getInt("pDiscount");
				cart.add(new CartDto(cartNo, mId, pId, pName, pImage, pStock, pPrice, pDiscount, cartQuantity));
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
		return cart;
	}
	
	
	
	public CartDto buyInCart(String mId) {
		CartDto cart = null;
		String sql = "SELECT C.* , P.PNAME, P.PID " + 
				"        FROM CART C, MEMBER M, PRODUCT P " + 
				"        WHERE M.MID=C.MID " + 
				"        AND P.PID=C.PID " + 
				"        AND C.MID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int cartNo = rs.getInt("cartNo");
				String pId = rs.getString("pId");
				String cartQuantity = rs.getString("cartQuantity");
				int pStock = rs.getInt("pStock");
				int pDiscount = rs.getInt("pDiscount");
				int pPrice = rs.getInt("pPrice");
				String pName = rs.getString("pName");
				String pImage = rs.getString("pImage");
				cart = new CartDto(cartNo, mId, pId, pName, pImage, pStock, pPrice, pDiscount, cartQuantity);
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
		return cart;
	}
	public int cartEmpty(String mId) {
		int empty = FAIL;
		String sql = "DELETE FROM CART WHERE MID=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			empty = pstmt.executeUpdate();
			System.out.println(empty == SUCCESS?"cart emptied ":"cart empty failed" );
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return empty;
	}
	
	
	
	public int cartDelProduct(int cartNo) {
		int result = FAIL;
		String sql = "DELETE FROM CART WHERE CARTNO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cartNo);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "물품 삭제 성공":"물품 삭제 실패");
		} catch (Exception e) {
			System.out.println(e.getMessage()+ " - 물품 삭제 실패");
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	public int updateCart(CartDto cart) { //CHANGING QUANTITY IN CART
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="UPDATE CART " + 
				"    SET CARTQUANTITY = ? " + 
				"    WHERE CARTNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cart.getCartQuantity());
			pstmt.setInt(2, cart.getCartNo());
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "주문정보 업데이트 성공":"주문정보 업데이트 실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
				if(conn!=null) {
					conn.close();
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	
}

