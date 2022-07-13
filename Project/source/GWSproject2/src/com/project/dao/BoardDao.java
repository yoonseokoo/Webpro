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

import com.project.dto.BoardDto;

public class BoardDao {
	public static final int SUCCESS = 1;
	public static final int FAIL = 0;
	private DataSource ds;
	// 싱글톤
	private static BoardDao instance = new BoardDao();
	public static BoardDao getInstance() {
		return instance;
	}
	private BoardDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}

	// [1] PRINT BOARD LIST
	public ArrayList<BoardDto> listBoard(int startRow, int endRow){
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * " +  
				"        FROM (SELECT ROWNUM RN, A.* " + 
				"                        FROM (SELECT B.*" + 
				"                                 FROM BOARD B, MEMBER M " + 
				"                                 WHERE B.MID = M.MID " + 
				"                                 ORDER BY BGROUP DESC, BSTEP) A)" + 
				"        WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int bId = rs.getInt("bId");
				String mId = rs.getString("mId");
				String bTitle = rs.getString("bTitle");
				String bContent = rs.getString("bContent");
				String bImage = rs.getString("bImage");
				int bHit = rs.getInt("bHit");
				int bGroup = rs.getInt("bGroup");
				int bStep = rs.getInt("bStep");
				int bIndent = rs.getInt("bIndent");
				Date   bRdate = rs.getDate("bRdate");
				dtos.add(new BoardDto(bId, mId, bTitle, bContent, bImage, bHit, bGroup, bStep, bIndent, bRdate));

			}
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null)  conn.close();
			}catch (SQLException e) {
			}
		}
		return dtos;
	}

	// [2] GET NUMBER OF POSTS FOR PAGING
	public int getBoardTotalCnt() {
		int totalCnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) FROM BOARD";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totalCnt = rs.getInt(1);
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null)  conn.close();
			}catch (SQLException e) {
				// TODO: handle exception
			}
		}
		return totalCnt;
	}

	// [3] WRITE NEW POST IN BOARD
	public int insertBoard(String mId, String bTitle, String bContent, String bImage) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO BOARD (BID, MID, BTITLE, BCONTENT, BIMAGE, BHIT, BGROUP, BSTEP, BINDENT) " + 
				"    VALUES (BOARD_SEQ.NEXTVAL, ?, ?, ?, ?, 0, BOARD_SEQ.CURRVAL, 0, 0 )";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setString(2, bTitle);
			pstmt.setString(3, bContent);
			pstmt.setString(4, bImage);
			
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null)  conn.close();
			}catch (SQLException e) {
			}
		}
		return result;
	}

	
/*	private void hitUp(int bId) {
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE BOARD SET BHIT = BHIT+1 WHERE BID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bId);
			pstmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null)  conn.close();
			}catch (SQLException e) {
				// TODO: handle exception
			}
		}
	} */


	// [4] DETAIL VIEW OF POST IN BOARD
	public BoardDto contentView(int bId) {
		BoardDto dto = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM BOARD WHERE BID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String mId = rs.getString("mId");
				String bTitle = rs.getString("bTitle");
				String bContent = rs.getString("bContent");
				String bImage = rs.getString("bImage");
				int bHit = rs.getInt("bHit");
				int bGroup = rs.getInt("bGroup");
				int bStep = rs.getInt("bStep");
				int bIndent = rs.getInt("bIndent");
				Date bRdate = rs.getDate("bRdate");
				int oNo = rs.getInt("oNo");
				dto = new BoardDto(bId, mId, bTitle, bContent, bImage, bHit, bGroup, bStep, bIndent, bRdate);

			}
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null)  conn.close();
			}catch (SQLException e) {
				// TODO: handle exception
			}
		}
		return dto;
	}

	// [5] INCREASE VIEW HIT AND GET BOARD (WHEN MODIFYING AND REPLYING)
	public BoardDto modifyView_replyView(int bId) {
		BoardDto dto = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM BOARD WHERE BID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String mId = rs.getString("mId");
				String bTitle = rs.getString("bTitle");
				String bContent = rs.getString("bContent");
				String bImage = rs.getString("bImage");
				int bHit = rs.getInt("bHit");
				int bGroup = rs.getInt("bGroup");
				int bStep = rs.getInt("bStep");
				int bIndent = rs.getInt("bIndent");
				Date bRdate = rs.getDate("bRdate");

				dto = new BoardDto(bId, mId, bTitle, bContent, bImage, bHit, bGroup, bStep, bIndent, bRdate);

			}
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null)  conn.close();
			}catch (SQLException e) {
				// TODO: handle exception
			}
		}
		return dto;
	}

	// [6] PUTTING INDENT
	private void preReplyStep(int bGroup, int bStep) {
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE BOARD SET BSTEP = BSTEP+1 WHERE BGROUP = ? AND BSTEP > ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bGroup);
			pstmt.setInt(2, bStep);
			pstmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null)  conn.close();
			}catch (SQLException e) {
				// TODO: handle exception
			}
		}
	}

	// [7] REPLY TO A POST
	public int reply(String mId, String bTitle, String bContent, String bImage,
					int bGroup, int bStep, int bIndent) {
		int result = FAIL;
		preReplyStep(bGroup, bStep);
		Connection        conn  = null;
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO BOARD (BID, MID, BTITLE, BCONTENT, BIMAGE, BHIT, BGROUP, BSTEP, BINDENT) " + 
				"        VALUES (BOARD_SEQ.NEXTVAL, ?, ?, ? ,?, 0,  ?, ?, ?)";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setString(2, bTitle);
			pstmt.setString(3, bContent);
			pstmt.setString(4, bImage);
			pstmt.setInt(5, bGroup);
			pstmt.setInt(6, bStep+1);
			pstmt.setInt(7, bIndent+1);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "답변글 성공":"답변글 실패");
		}catch (SQLException e) {
			System.out.println(e.getMessage() + " - 답변글 실패");
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null)  conn.close();
			}catch (SQLException e) {
				// TODO: handle exception
			}
		}
		return result;
	}
	
	// [8] MODIFY BOARD DETAILS
	public int modify(int bId, String bTitle, String bContent, String bImage) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE BOARD  " + 
				"    SET BTITLE = ?, " + 
				"        BCONTENT = ?, " + 
				"        BIMAGE = ? " + 
				"        WHERE BID=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bTitle);
			pstmt.setString(2, bContent);
			pstmt.setString(3, bImage);
			pstmt.setInt(4, bId);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "글 수정 성공":"글 수정 실패");
		}catch (SQLException e) {
			System.out.println(e.getMessage() + " - 글 수정 실패");
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null)  conn.close();
			}catch (SQLException e) {
				// TODO: handle exception
			}
		}
		return result;
	}

	// [9] DELETE POST
	public int delete(int bId) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = " DELETE FROM BOARD WHERE BID=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bId);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "글 삭제 성공":"글 삭제 실패");
		}catch (SQLException e) {
			System.out.println(e.getMessage() + " - 글 삭제 실패");
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null)  conn.close();
			}catch (SQLException e) {
				// TODO: handle exception
			}
		}
		return result;
	}
	
	// [10] DELTE POSTS OF CUSTOMER THAT IS WITHDRAWING FROM SITE
	public void withdrawalDeleteBoard(String mId) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM BOARD WHERE MID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.executeUpdate();
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
	}
}

