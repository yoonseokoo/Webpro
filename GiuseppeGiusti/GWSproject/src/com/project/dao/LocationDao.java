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

import com.project.dto.LocationDto;
import com.project.dto.MemberDto;

public class LocationDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	private static LocationDao instance = new LocationDao();
	public static LocationDao getInstance() {
		return instance;
}
	private LocationDao() {}
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
	
	public ArrayList<LocationDto> getAddress() throws Exception {
		ArrayList<LocationDto> dtos = new ArrayList<LocationDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM LOCATION";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int lId = rs.getInt("lId");
				String lStore = rs.getString("lStore");
				String lAddress = rs.getString("lAddress");
				dtos.add(new LocationDto(lId, lStore, lAddress));
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
}
