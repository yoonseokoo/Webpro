package com.lec.friend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class FriendDao {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	public static final int SUCCESS = 1; // WHEN FRIEND IS SUCCESSFULLY ADDED
	public static final int FAIL = 0; /// WHEN FRIEND CANNOT BE ADDED

	private static FriendDao instance; // 자기가 자기 클래스 참조

	public static FriendDao getInstance() {
		if (instance == null) {
			instance = new FriendDao();
		}
		return instance;
	}

	private FriendDao() {
	}

	private Connection getConnection() throws SQLException {

		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println("Connection pool error");
		}
		return conn;
	}

	// PRINTING FRIEND LIST
	public ArrayList<FriendDto> printInfo() throws Exception {
		ArrayList<FriendDto> dtos = new ArrayList<FriendDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM FRIEND";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int fno = rs.getInt("fno");
				String fname = rs.getString("fname");
				String fphone = rs.getString("fphone");
				dtos.add(new FriendDto(fno, fname, fphone));
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

	// ADDING FRIEND

	public int addFriend(FriendDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO FRIEND (FNO, FNAME, FPHONE) VALUES (FRIEND_SQ.NEXTVAL , ? , ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getFname());
			pstmt.setString(2, dto.getFphone());
			result = pstmt.executeUpdate();
			System.out.println(result == SUCCESS ? "Friend added" : "Friend not added");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return result;
	}

	// FINDING FRIEND BY NAME/TEL
	public ArrayList<FriendDto> select(String searchName, String searchTel) {
		ArrayList<FriendDto> dtos = new ArrayList<FriendDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM FRIEND WHERE FNAME LIKE '%'||?||'%' AND FPHONE LIKE '%'||?||'%'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchName);
			pstmt.setString(2, searchTel);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int fno = rs.getInt("fno");
				String fname = rs.getString("fname");
				String fphone = rs.getString("fphone");
				dtos.add(new FriendDto(fno, fname, fphone));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return dtos;
	}
}