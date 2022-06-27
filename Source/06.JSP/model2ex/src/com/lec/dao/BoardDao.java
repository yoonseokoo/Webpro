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

import com.lec.dto.BoardDto;

public class BoardDao {
	public static final int SUCCESS = 1; // 회원가입시
	public static final int FAIL = 0;    // 회원가입시
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
	// 글목록
	public ArrayList<BoardDto> listBoard(int startRow, int endRow){
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* " + 
				"   FROM (SELECT F.*  FROM FILEBOARD F, MEMBER M  " + 
				"    WHERE F.MID = M.MID  ORDER BY FGROUP DESC, FSTEP) A) " + 
				"    WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int    fId = rs.getInt("fId");
				String mId = rs.getString("mId");
				String fTitle = rs.getString("fTitle");
				String fContent = rs.getString("fContent");
				String fFilename = rs.getString("fFilename");
				Date   fRdate = rs.getDate("fRdate");
				int fHit = rs.getInt("fHit");
				int fGroup = rs.getInt("fGroup");
				int fStep = rs.getInt("fStep");
				int fIndent = rs.getInt("fIndent");
				String fIp = rs.getString("fIp");
				dtos.add(new BoardDto(fId, mId, fTitle, fContent, fFilename, fRdate, fHit, fGroup, fStep, fIndent, fIp));
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
		return dtos;
	}
	// 전체갯수
	public int getBoardTotalCnt() {
		int totalCnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) FROM FILEBOARD";
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
	// 원글쓰기
	public int insertBoard(String mId, String fTitle, String fContent, String fFilename, String fIp) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO FILEBOARD (FID, MID, FTITLE, FCONTENT, FFILENAME, FHIT, FGROUP, FSTEP, FINDENT, FIP) "
				+ " VALUES (FILEBOARD_SEQ.NEXTVAL, ?, ?, ?, ?, 0, FILEBOARD_SEQ.CURRVAL, 0, 0, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setString(2, fTitle);
			pstmt.setString(3, fContent);
			pstmt.setString(4, fFilename);
			pstmt.setString(5, fIp);
			
			result = pstmt.executeUpdate();
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
		return result;
	}
	// fid로 조회수 올리기(private)
	private void hitUp(int fId) {
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE FILEBOARD SET FHIT = FHIT+1 WHERE FID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fId);
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
	// fid로 dto가져오기=글상세보기(조회수올리기 포함)
	public BoardDto contentView(int fId) {
		BoardDto dto = null;
		hitUp(fId); // 글 상세보기시 자동적으로 hitup
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM FILEBOARD WHERE FID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String mId = rs.getString("mId");
				String fTitle = rs.getString("fTitle");
				String fContent = rs.getString("fContent");
				String fFilename = rs.getString("fFilename");
				Date   fRdate = rs.getDate("fRdate");
				int fHit = rs.getInt("fHit");
				int fGroup = rs.getInt("fGroup");
				int fStep = rs.getInt("fStep");
				int fIndent = rs.getInt("fIndent");
				String fIp = rs.getString("fIp");
				dto = new BoardDto(fId, mId, fTitle, fContent, fFilename, fRdate, fHit, fGroup, fStep, fIndent, fIp);
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
	// Fid로 dto가져오기=수정하기 + 답변글쓰기(form, 조회수 올리기 미포함)
	public BoardDto modifyView_replyView(int fId) {
		BoardDto dto = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM FILEBOARD WHERE FID = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String mId = rs.getString("mId");
				String fTitle = rs.getString("fTitle");
				String fContent = rs.getString("fContent");
				String fFilename = rs.getString("fFilename");
				Date   fRdate = rs.getDate("fRdate");
				int fHit = rs.getInt("fHit");
				int fGroup = rs.getInt("fGroup");
				int fStep = rs.getInt("fStep");
				int fIndent = rs.getInt("fIndent");
				String fIp = rs.getString("fIp");
				dto = new BoardDto(fId, mId, fTitle, fContent, fFilename, fRdate, fHit, fGroup, fStep, fIndent, fIp);
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
	// 답변글 쓰기 전 step a
	private void preReplyStep(int fGroup, int fStep) {
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "    UPDATE FILEBOARD SET FSTEP = FSTEP+1 WHERE FGROUP=? AND FSTEP > ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fGroup);
			pstmt.setInt(2, fStep);
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
	// 답변글 쓰기 -- 답변자 : bname, btitle, bcontent, bip
	//          -- 원글 : bgroup, bstep, bindent
	public int reply(String mId, String fTitle, String fContent, String fFilename,
					int fGroup, int fStep, int fIndent, String fIp) {
		int result = FAIL;
		preReplyStep(fGroup, fStep);
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO FILEBOARD (FID, MID, FTITLE, FCONTENT, FFILENAME, FGROUP, FSTEP, FINDENT, FIP)\r\n" + 
				"	    VALUES (FILEBOARD_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ? , ?)";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			pstmt.setString(2, fTitle);
			pstmt.setString(3, fContent);
			pstmt.setString(4, fFilename);
			pstmt.setInt(5, fGroup);
			pstmt.setInt(6, fStep+1);
			pstmt.setInt(7, fIndent+1);
			pstmt.setString(8, fIp);
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
	// 글수정
	public int modify(int fId, String fTitle, String fContent, String fFilename, String fIp) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE FILEBOARD " + 
				"    		 SET FTITLE = ?, " + 
				"            FCONTENT = ?, " + 
				"            FFILENAME = ?, " + 
				"            FIP = ? " + 
				"        WHERE FID=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fTitle);
			pstmt.setString(2, fContent);
			pstmt.setString(3, fFilename);
			pstmt.setString(4, fIp);
			pstmt.setInt(5, fId);
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
	// 글 삭제	
	public int delete(int fId) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = " DELETE FROM FILEBOARD WHERE FID=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fId);
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
}

