package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.project.dto.ProductGroupDto;

public class ProductGroupDao {
	public static final int SUCCESS = 1; // 회원가입시
	public static final int FAIL = 0;    // 회원가입시
	private DataSource ds;
	// 싱글톤
	private static ProductGroupDao instance = new ProductGroupDao();
	public static ProductGroupDao getInstance() {
		return instance;
	}
	private ProductGroupDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
	}
	// 글목록
	public ArrayList<ProductGroupDto> listGroup(int startRow, int endRow){
		ArrayList<ProductGroupDto> dtos = new ArrayList<ProductGroupDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* " + 
				"                    FROM (SELECT PG.* FROM PRODUCT_GROUP PG " + 
				"                       ORDER BY PGROUP ASC) A) " + 
				"        WHERE RN BETWEEN ? AND ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String pGroup = rs.getString("pGroup");
				String pGroupName = rs.getString("pGroupName");
				String pGroupDesc = rs.getString("pGroupDesc");
				String pGroupImg = rs.getString("pGroupImg");
				dtos.add(new ProductGroupDto(pGroup, pGroupName, pGroupDesc, pGroupImg));

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
	public int getGroupTotalCnt() {
		int totalCnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) FROM PRODUCT_GROUP";
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
	
	// pGroup 로 dto가져오기
	public ProductGroupDto contentView(String pGroup) {
		ProductGroupDto dto = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM PRODUCT_GROUP WHERE PGROUP = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pGroup);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String pGroupName = rs.getString("pGroupName");
				String pGroupDesc = rs.getString("pGroupDesc");
				String pGroupImg = rs.getString("pGroupImg");
				dto = new ProductGroupDto(pGroup, pGroupName, pGroupDesc, pGroupImg);

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
}