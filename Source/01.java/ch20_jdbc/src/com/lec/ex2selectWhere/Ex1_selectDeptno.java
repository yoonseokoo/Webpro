package com.lec.ex2selectWhere;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

//Receiving DEPTNO that the user wants to print (using scanner) and printing info of that DEPT
public class Ex1_selectDeptno {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Scanner sc = new Scanner(System.in);
		System.out.println(("Enter department number: ?"));
		int deptno = sc.nextInt();
		String sql = "SELECT * FROM DEPT WHERE DEPTNO = " + deptno;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "scott", "tiger");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) { // when the department exists
				System.out.println("Info on department " + deptno + " is as follows: ");
				System.out.println("Department Name: " + rs.getString("dname"));
				System.out.println("Department Location: " + rs.getString("loc"));
			} else { // when department does not exist
				System.out.println("department " + deptno + " does not exist");
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}
