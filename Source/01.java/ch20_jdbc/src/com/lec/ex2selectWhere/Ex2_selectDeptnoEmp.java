package com.lec.ex2selectWhere;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

//Receiving DEPTNO that the user wants to print (using scanner) and printing name of employees in that department
public class Ex2_selectDeptnoEmp {
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
		String sql2 = "SELECT E.EMPNO, E.ENAME, E.SAL, M.ENAME MAN FROM EMP E, EMP M  WHERE E.MGR = M.EMPNO AND E.DEPTNO ="
				+ deptno;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, "scott", "tiger");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {

				System.out.println("Info on department " + deptno + " is as follows: ");
				System.out.println("\nDepartment Name: " + rs.getString("dname"));
				System.out.println("Department Location: " + rs.getString("loc") + "\n");
				rs.close(); // close original rs
				rs = stmt.executeQuery(sql2);
				if (rs.next()) {
					System.out.println("EMPNO\tENAME\tSAL\tMANAGER");
					do {
						int empno = rs.getInt("empno");
						String ename = rs.getString("ename");
						int sal = rs.getInt("sal");
						String man = rs.getString("man");
						System.out.println(empno + "\t" + ename + "\t" + sal + "\t" + man + "\t");
					} while (rs.next());
				} else {
					System.out.println("There are currently no employees in this department");
				}
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
