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


public class MemberDao {
	
	public static final int SUCCESS = 1;
	public static final int FAIl = 0;

	private static MemberDao INSTANCE = new MemberDao();

	public static MemberDao getInstance() {
		return INSTANCE;
	}

	private MemberDao() {
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

	

	// -- [1]Insert Member
	public int insert(MemberDto dto) {
		int result = FAIl;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO MEMBER (CUSNO, CUSTNAME, PHONE, ADDRESS, JOINDATE, GRADE, CITY) " + 
				"    VALUES ('100'||MEMBER_SEQ.NEXTVAL, ?, ?, ?, SYSDATE, ?, ?) ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCustname());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getGrade());
			pstmt.setString(5, dto.getCity());
			result = pstmt.executeUpdate();

			System.out.println(result == SUCCESS ? "Member insert success" : "Member insert failed");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "member insert failed : " + dto);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}



//   -- [2] Member Detail
	public MemberDto detail(int cusno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDto dto = null;
		String sql = "SELECT * FROM MEMBER WHERE CUSNO= ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cusno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String custname = rs.getString("custname");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				Date joindate = rs.getDate("joindate");
				String grade = rs.getString("grade");
				String city = rs.getString("city");
				dto = new MemberDto(cusno, custname, phone, address, joindate, grade, city);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "Member dto failed : " + dto);
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return dto;
	}

	// -- [3] modify
	public int modify(MemberDto dto) {
		int result = FAIl;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE MEMBER  " + 
				"    SET CUSTNAME = ?, " + 
				"    PHONE = ?, " + 
				"    ADDRESS = ?, " + 
				"    GRADE = ?, " + 
				"    CITY = ? " + 
				"    WHERE CUSNO= ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCustname());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getGrade());
			pstmt.setString(5, dto.getCity());
			pstmt.setInt(6, dto.getCusno());
			result = pstmt.executeUpdate();
			System.out.println("Member modify success");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "member modify fail : " + dto);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}

	// -- [4] Member list
	public ArrayList<MemberDto> printInfo() throws Exception {
		ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER ORDER BY CUSNO";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int cusno = rs.getInt("cusno");
				String custname = rs.getString("custname");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				Date joindate = rs.getDate("joindate");
				String grade = rs.getString("grade");
				String city = rs.getString("city");
				dtos.add(new MemberDto(cusno, custname, phone, address, joindate, grade, city));
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

	// -- [5] 매출 list
		public ArrayList<MemberDto> MemberSales() throws Exception {
			ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT DISTINCT MEM.CUSNO, MEM.CUSTNAME, GDESC, TOT " + 
					"        FROM MEMBER MEM, MONEY M, GRADE G, (SELECT CUSNO, SUM(PRICE) TOT FROM MONEY GROUP BY CUSNO) T " + 
					"        WHERE G.GRADE= MEM.GRADE " + 
					"        AND MEM.CUSNO = M.CUSNO " + 
					"        AND T.CUSNO = MEM.CUSNO " + 
					"        ORDER BY CUSNO";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					int cusno = rs.getInt("cusno");
					String custname = rs.getString("custname");
					String gdesc = rs.getString("gdesc");
					int tot = rs.getInt("tot");
					dtos.add(new MemberDto(cusno, custname, gdesc, tot));
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
	// -- [6] 매출 list
			public int getCusno() {
				int cusno=0;
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "SELECT MAX(CUSNO)+1 MAX FROM MEMBER";
					try {
						conn = getConnection();
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						rs.next();
						cusno = rs.getInt("max");
						System.out.println(cusno);
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
					return cusno;
				}
}
