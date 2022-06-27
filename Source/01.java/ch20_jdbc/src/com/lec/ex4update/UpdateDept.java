package com.lec.ex4update;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class UpdateDept {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Scanner scanner = new Scanner(System.in);
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "scott", "tiger");
			stmt = conn.createStatement();

			while (true) {
				System.out.println("Which department number would you like to edit? ");
				int deptno = scanner.nextInt();
				String selectSQL = "SELECT * FROM DEPT WHERE DEPTNO=" + deptno;
				rs = stmt.executeQuery(selectSQL);
				if (rs.next()) {
					System.out.println("New name of department: ");
					String dname = scanner.next();
					System.out.println("New location: ");
					String loc = scanner.next();
					String sql = String.format("UPDATE DEPT SET DNAME = '%s',  LOC = '%s' WHERE DEPTNO = %d", dname,
							loc, deptno);
					int result = stmt.executeUpdate(sql);
					System.out.println(result > 0 ? "SUCCESSFULLY EDITED" : "SUCH DEPARTMENT DOES NOT EXIST");
					break;
				} else {
					System.out.println("department " + deptno + " does not exist");
					continue;
				}
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
	}
}
