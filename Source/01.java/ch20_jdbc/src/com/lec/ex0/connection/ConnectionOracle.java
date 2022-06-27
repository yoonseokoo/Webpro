package com.lec.ex0.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionOracle {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Connection conn = null;
		try {
			// [1] LOAD DB
			Class.forName(driver);
			System.out.println("Successfully loaded driver");

			// [2] CONSTRUCT OBJECT TO CONNECCT TO DB
			conn = DriverManager.getConnection(url, "scott", "tiger");
			System.out.println("Successfully connected Oracle to Database");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage() + "Driver error");
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "Failed to linked to Database");
		} finally {
			// [3] CUT CONNECTION TO DB
		}
		try {
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "Error whilst closing");
		}
	}
}
