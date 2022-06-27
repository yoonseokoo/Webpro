package com.lec.ex2selectWhere;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Ex3_selectDnameEmp {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Scanner sc = new Scanner(System.in);
		System.out.println(("Enter department name: "));
		String dname = sc.next();
		String sql = "SELECT * FROM DEPT WHERE DNAME = UPPER('" + dname + "')";
		String sql2 = "SELECT EMPNO, ENAME, SAL, GRADE FROM EMP E, SALGRADE, DEPT D WHERE SAL BETWEEN LOSAL AND HISAL AND E.DEPTNO = D.DEPTNO AND E.DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = UPPER('"
				+ dname + "'))";

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "scott", "tiger");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				System.out.println("Info on department " + dname + " is as follows: ");
				System.out.println("\nDepartment Number: " + rs.getInt("deptno"));
				System.out.println("Department Location: " + rs.getString("loc") + "\n");
				rs.close(); // close original rs
				rs = stmt.executeQuery(sql2);
				if (rs.next()) {
					System.out.println("EMPNO\tENAME\tSAL\tGRADE");
					do {
						int empno = rs.getInt("empno");
						String ename = rs.getString("ename");
						int sal = rs.getInt("sal");
						int grade = rs.getInt("grade");
						System.out.println(empno + "\t" + ename + "\t" + sal + "\t" + grade + "\t");
					} while (rs.next());
				} else {
					System.out.println("There are currently no employees in this department");
				}
			} else { // when department does not exist
				System.out.println("department " + dname + " does not exist");
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
