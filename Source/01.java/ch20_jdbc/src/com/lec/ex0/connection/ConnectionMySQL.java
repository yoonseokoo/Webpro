package com.lec.ex0.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionMySQL {
	public static void main(String[] args) {
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/kimdb?serverTimezone=UTC";
		Connection conn = null;
		try {
			// [1]LOAD DB
			Class.forName(driver);

			// [2] CONSTRUCT OBJECT TO CONNECCT TO DB
			conn = DriverManager.getConnection(url, "root", "mysql");
			System.out.println("Successfully connected MYSQL to Database");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {

			// [3] CUT CONNECTION TO DB
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
	}
}
