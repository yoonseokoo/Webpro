package com.lec.ex1.selectAll;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SelectAllOracle {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Connection conn = null; // Variable of type 'Connection' (object that connects to DB)
		Statement stmt = null; // Variable of type 'Statement' (object that sends SQL)
		ResultSet rs = null; // Variable of type 'ResultSet' (object that receives the SELECT command)
		String query = "SELECT * FROM EMP";
		try {
			Class.forName(driver); // [1] LOAD DB
			conn = DriverManager.getConnection(url, "scott", "tiger"); // [2] CONNECCT TO DB
			stmt = conn.createStatement(); // [3] CONSTRUCTING OBJECT THAT SENDS TO SQL
			rs = stmt.executeQuery(query); // [4] SENDS TO SQL + [5] RECEIVE RESULT (that has been sent to SQL)

			// [6] RECEIVE RESULTS AND PRINT IN DESIREABLE FORMAT
			System.out.println("EMPNO\tENAME\tJOB\t\tMGR\tHIREDATE\tSAL\tCOMM\tDEPTNO");
			while (rs.next()) {
				int empno = rs.getInt("empno"); // receive a number result (title/nickname)
				String ename = rs.getString("ename"); // receive string result
				String job = rs.getString("job");
				int mgr = rs.getInt("mgr");
				Date hiredate = rs.getDate("hiredate"); // Can also be received as a String
				int sal = rs.getInt("sal");
				int comm = rs.getInt("comm");
				int deptno = rs.getInt("deptno");
				if (job.length() < 8) {
					System.out.printf("%d\t%s\t%s\t\t%d\t%TF\t%d\t%d\t%d\n", empno, ename, job, mgr, hiredate, sal,
							comm, deptno);
				} else {
					System.out.printf("%d\t%s\t%s\t%d\t%TF\t%d\t%d\t%d\n", empno, ename, job, mgr, hiredate, sal, comm,
							deptno);
				}

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
			}
		}
	}
}
