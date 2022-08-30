package com.project.dao;

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

import com.project.dto.MemberDto;

public class MemberDao {
	public static final int EXISTENT    = 0;
	public static final int NONEXISTENT = 1;
	public static final int LOGIN_FAIL    =0;
	public static final int LOGIN_SUCCESS = 1;
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private static MemberDao instance = new MemberDao();
	public static MemberDao getInstance() {
		return instance;
	}
	
	private MemberDao() {}
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return conn; 
	}
	
	
	//[1] LOGIN CHECK
	public int loginCheck(String mId, String mPw) {
		int result = LOGIN_FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM MEMBER WHERE mId=? and mPw=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setString(2, mPw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = LOGIN_SUCCESS;
			}else {
				result = LOGIN_FAIL;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	//[2] BRING DTO UDING MID 
	public MemberDto getMember(String mId) {
		MemberDto member = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM MEMBER WHERE mId=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String mPw = rs.getString("mPw");
				String mName = rs.getString("mName");
				String mPhone = rs.getString("mPhone");
				String mAddress =rs.getString("mAddress");
				String mAddressDetail=rs.getString("mAddressDetail");
				Date   mBirth = rs.getDate("mBirth");
				String mEmail = rs.getString("mEmail");
				String mGender = rs.getString("mGender");
				int mCumPurchase = rs.getInt("mCumPurchase");
				Date mRdate =  rs.getDate("mRdate");
				int mGrade = rs.getInt("mGrade");
				member = new MemberDto(mId, mPw, mName, mPhone, mAddress, mAddressDetail, mBirth, mEmail, mGender, mCumPurchase, mRdate, mGrade);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return member;
	}
	
	
	
	//[3] JOIN

	public int joinMember(MemberDto member) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBER (MID,MPW,MNAME,MPHONE,MADDRESS,MADDRESSDETAIL,MBIRTH ,MEMAIL, MGENDER)  " + 
				"   VALUES (?,?,?,?,?,?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getmId());
			pstmt.setString(2, member.getmPw());
			pstmt.setString(3, member.getmName());
			pstmt.setString(4, member.getmPhone());
			pstmt.setString(5, member.getmAddress());
			pstmt.setString(6, member.getmAddressDetail());
			pstmt.setDate(7, member.getmBirth());
			pstmt.setString(8, member.getmEmail());
			pstmt.setString(9, member.getmGender());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage() + "joinMember 예외");
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
	
	// [3-1] CHECKING FOR mId DUPLICATES WHILST SIGNING UP
		public int mIdConfirm(String mId) {
			int result = EXISTENT;
			Connection        conn  = null;
			PreparedStatement pstmt = null;
			ResultSet         rs    = null;
			String sql = "SELECT * FROM MEMBER WHERE MID=?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mId);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = EXISTENT;
				}else {
					result = NONEXISTENT;
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(rs    != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn  != null) conn.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
			return result;
		}
		
		// [3-2] CHECKING FOR mEmail DUPLICATES WHILST SIGNING UP
		public int mEmailConfirm(String mEmail) {
			int result = EXISTENT;
			Connection        conn  = null;
			PreparedStatement pstmt = null;
			ResultSet         rs    = null;
			String sql = "SELECT * FROM MEMBER WHERE MEMAIL=?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mEmail);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = EXISTENT;
				}else {
					result = NONEXISTENT;
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(rs    != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn  != null) conn.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
			return result;
		}
	
		// [4] Get Member List **
		public ArrayList<MemberDto> getMemberList(int startRow, int endRow) {
			ArrayList<MemberDto> members = new ArrayList<MemberDto>();
			String sql = "    SELECT * " + 
					"        FROM (SELECT ROWNUM RN, M.* ,G.GNAME,(SELECT COUNT(*)  " + 
					"                                                FROM CART C, MEMBER M " + 
					"                                                WHERE C.MID=M.MID) CART_CNT " + 
					"            FROM MEMBER M, GRADE G " + 
					"            WHERE M.MGRADE= G.MGRADE " + 
					"            AND M.MCUMPURCHASE BETWEEN G.LOWGRADE AND G.HIGHGRADE) " + 
					"            WHERE RN BETWEEN ? AND ?";
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
					String mId = rs.getString("mId");
					String mPw = rs.getString("mPw");
					String mName = rs.getString("mName");
					String mPhone = rs.getString("mPhone");
					String mAddress = rs.getString("mAddress");
					String mAddressDetail = rs.getString("mAddressDetail");
					Date mBirth = rs.getDate("mBirth");
					String mEmail = rs.getString("mEmail");
					String mGender = rs.getString("mGender");
					int mCumPurchase = rs.getInt("mCumPurchase");
					Date mRdate = rs.getDate("mRdate");
					int mGrade = rs.getInt("mGrade");
					String gName = rs.getString("gName");
					int cart_cnt = rs.getInt("cart_cnt");
					members.add(new MemberDto(mId, mPw, mName, mPhone, mAddress, mAddressDetail, mBirth, mEmail, mGender, mCumPurchase, mRdate, mGrade));
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
			return members;
		}
	
	
		//MODIFY
	public int memberModify(MemberDto member) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="UPDATE MEMBER " + 
				"    SET MPW = ?, MNAME = ?, MPHONE = ?, " + 
				"    MADDRESS = ?, MADDRESSDETAIL = ?, MBIRTH = ?, " + 
				"    MEMAIL = ? WHERE MID= ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getmPw());
			pstmt.setString(2, member.getmName());
			pstmt.setString(3, member.getmPhone());
			pstmt.setString(4, member.getmAddress());
			pstmt.setString(5, member.getmAddressDetail());
			pstmt.setDate(6, member.getmBirth());
			pstmt.setString(7, member.getmEmail());
			pstmt.setString(8, member.getmId());
			result = pstmt.executeUpdate();
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
	
	//회원탈퇴
	public int withdrawal(String mId) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM MEMBER WHERE MID = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	//COUNTING TOT MEMBERS
	public int getMemberTotCnt() {
		int totCnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) CNT FROM MEMBER";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totCnt = rs.getInt("cnt");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return totCnt;
	}
	
	
	/*public ArrayList<String> getMemberListGrades(String gName) {
		ArrayList<String> mIds = new ArrayList<String>();
		String sql="  SELECT * FROM MEMBER M,GRADE G WHERE MCUMPURCHASE BETWEEN LOWGRADE AND HIGHGRADE AND GNAME=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gName);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				mIds.add(rs.getString("mId"));
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
		return mIds;
	} */
}


