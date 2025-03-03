package com.yl.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.yl.dto.Customer_service_dto;

public class Customer_service_dao {
	
	private Customer_service_dao() {
	}
	
	private static Customer_service_dao instance = new Customer_service_dao();
	public static Customer_service_dao getInstance() {
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
	public ArrayList<Customer_service_dto> getCustomer_serviceList(int startRow,int endRow) {
		ArrayList<Customer_service_dto> csboards = new ArrayList<Customer_service_dto>();
		String sql = "SELECT * FROM (SELECT ROWNUM RN,C.* FROM (SELECT CS.*,M.MNAME FROM CUSTOMER_SERVICE CS, MEMBER M WHERE CS.MID=M.MID ORDER BY CGROUP DESC,CGROUP_OUTNUM) C)" + 
				"    WHERE RN BETWEEN ? AND ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int cno = rs.getInt("cno");
				String mid = rs.getString("mid");
				String mname = rs.getString("mname");
				String csubject = rs.getString("csubject");
				String ccontent = rs.getString("ccontent");
				int csecret = rs.getInt("csecret");
				String cimage = rs.getString("cimage");
				int chit = rs.getInt("chit");
				int cgroup = rs.getInt("cgroup");
				int cgroup_outnum = rs.getInt("cgroup_outnum");
				int cindent = rs.getInt("cindent");
				Date crdate = rs.getDate("crdate");
				boolean cmexist = rs.getInt("cmexist")==1;
				String ono = rs.getString("ono");
				csboards.add(new Customer_service_dto(cno, mid, mname, csubject, ccontent, csecret, cimage, chit, cgroup, cgroup_outnum, cindent, crdate, cmexist, ono));
			}
		} catch (SQLException e) {
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
		return csboards;
	}
	
	
	
	public Customer_service_dto getCsBoard(int cno) {
		Customer_service_dto csboard = null;
		String sql = "SELECT CS.*,M.MNAME FROM customer_service CS, MEMBER M WHERE CNO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String mid = rs.getString("mid");
				String mname = rs.getString("mname");
				String csubject = rs.getString("csubject");
				String ccontent = rs.getString("ccontent");
				int csecret = rs.getInt("csecret");
				String cimage = rs.getString("cimage");
				int chit = rs.getInt("chit");
				int cgroup = rs.getInt("cgroup");
				int cgroup_outnum = rs.getInt("cgroup_outnum");
				int cindent = rs.getInt("cindent");
				Date crdate = rs.getDate("crdate");
				boolean cmexist = rs.getInt("cmexist")==1;
				String ono = rs.getString("ono");
				csboard = new Customer_service_dto(cno, mid, mname, csubject, ccontent, csecret, cimage, chit, cgroup, cgroup_outnum, cindent, crdate, cmexist, ono);
			}
		} catch (SQLException e) {
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
		return csboard;
	}
	
	public boolean writeCsBoardMember(String mid,String csubject, String ccontent, boolean csecret,String cimage, int ono) {
		boolean result = false;
		String sql = "INSERT INTO customer_service (CNO,MID,CSUBJECT,CCONTENT,CSECRET,CIMAGE,CGROUP,ONO) VALUES " + 
				"(CNO_SEQ.NEXTVAL,?,?,?,?,?,CNO_SEQ.CURRVAL,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, csubject);
			pstmt.setString(3, ccontent);
			pstmt.setInt(4, csecret==true?1:0);
			pstmt.setString(5, cimage);
			pstmt.setInt(6, ono);
			result = pstmt.executeUpdate()==1;
		} catch (SQLException e) {
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
	
	// 글 수정 (수정 후 조회수 0)
	public boolean hitup(int cno) {
		boolean result = false;
		String sql = "UPDATE CUSTOMER_SERVICE SET CHIT=CHIT+1 WHERE CNO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			result = pstmt.executeUpdate()==1;
		} catch (SQLException e) {
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
	
	public boolean modifyCsBoardMember(int cno,String csubject, String ccontent, boolean csecret, String cimage, int ono) {
		boolean result = false;
		String sql = "UPDATE CUSTOMER_SERVICE SET CSUBJECT=?,CCONTENT=?,CSECRET=?,CIMAGE=?,CHIT=0,CRDATE=SYSDATE,ONO=? WHERE CNO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, csubject);
			pstmt.setString(2, ccontent);
			pstmt.setInt(3, csecret==true?1:0);
			pstmt.setString(4, cimage);
			pstmt.setInt(5, ono);
			pstmt.setInt(6, cno);
			result = pstmt.executeUpdate()==1;
		} catch (SQLException e) {
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
	public boolean modifyCsBoardMember(int cno,String csubject, String ccontent, boolean csecret, int ono) {
		boolean result = false;
		String sql = "UPDATE CUSTOMER_SERVICE SET CSUBJECT=?,CCONTENT=?,CSECRET=?, CHIT=0,CRDATE=SYSDATE,ONO=? WHERE CNO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, csubject);
			pstmt.setString(2, ccontent);
			pstmt.setInt(3, csecret==true?1:0);
			pstmt.setInt(4, ono);
			pstmt.setInt(5, cno);
			result = pstmt.executeUpdate()==1;
		} catch (SQLException e) {
			System.out.println("modifyCsBoardMember오류:"+e.getMessage());
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
	
	public boolean existCsComment(int cno,boolean cmexist) {
		boolean result = false;
		String sql = "UPDATE CUSTOMER_SERVICE SET CMEXIST=? WHERE CNO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cmexist?1:0);
			pstmt.setInt(2, cno);
			result = pstmt.executeUpdate()==1;
		} catch (SQLException e) {
			System.out.println("modifyCsBoardMember오류:"+e.getMessage());
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
	
	public boolean deleteCsBoardMember(int cno) {
		boolean result = false;
		String sql = "DELETE FROM CUSTOMER_SERVICE WHERE CNO=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			result = pstmt.executeUpdate()==1;
		} catch (SQLException e) {
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
	
	
	public int getTotalCsBoardsCnt() {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM CUSTOMER_SERVICE";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
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
	
	private void preReplyStepA(int cgroup,int cgroup_outnum) {
		String sql = "UPDATE customer_service SET CGROUP_OUTNUM=CGROUP_OUTNUM+1 WHERE CGROUP=? AND CGROUP_OUTNUM>?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cgroup);
			pstmt.setInt(2, cgroup_outnum);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("preReplyStepA오류:"+e.getMessage());
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
	public boolean csReplyStepB(String mid,String csubject,String ccontent,boolean csecret,String cimage,int cgroup,int cgroup_outnum,int cindent,int ono) {
		preReplyStepA(cgroup, cgroup_outnum);
		boolean result = false;
		String sql = "INSERT INTO customer_service (CNO,MID,CSUBJECT,CCONTENT,CSECRET,CIMAGE,CGROUP,"
				+ "CGROUP_OUTNUM,CINDENT,CRDATE,ONO) VALUES (CNO_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,SYSDATE,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, csubject);
			pstmt.setString(3, ccontent);
			pstmt.setInt(4, csecret?1:0);
			pstmt.setString(5, cimage);
			pstmt.setInt(6, cgroup);
			pstmt.setInt(7, cgroup_outnum+1);
			pstmt.setInt(8, cindent+1);
			pstmt.setInt(9, ono);
			result = pstmt.executeUpdate()==1;
		} catch (SQLException e) {
			System.out.println("csReplyStepB오류:"+e.getMessage());
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
	
}
