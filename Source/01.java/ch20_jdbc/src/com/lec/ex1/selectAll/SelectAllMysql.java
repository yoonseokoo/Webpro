package com.lec.ex1.selectAll;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SelectAllMysql {
	public static void main(String[] args) {
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/kimdb?serverTimezone=UTC";
		String sql = "SELECT * FROM PERSONAL";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver); // [1] LOAD DB
			conn = DriverManager.getConnection(url, "root", "mysql"); // [2] CONNECCT TO DB
			stmt = conn.createStatement(); // [3] CONSTRUCTING OBJECT THAT SENDS TO SQL
			rs = stmt.executeQuery(sql); // [4] SENDS TO SQL + [5] RECEIVE RESULT (that has been sent to SQL)

			// [6] RECEIVE RESULTS AND PRINT IN DESIREABLE FORMAT

			if (rs.next()) { // if there is data corresponding to the select command
				System.out.println("EMPNO\tENAME\tJOB\t\tMGR\tSTARTDATE\tPAY\tBONUS\tDEPTNO");
				do {
					int pno = rs.getInt("pno"); // receive a number result (title/nickname)
					String pname = rs.getString("pname"); // receive string result
					String job = rs.getString("job");
					int manager = rs.getInt("manager");
					Date startdate = rs.getDate("startdate"); // Can also be received as a String
					int pay = rs.getInt("pay");
					int bonus = rs.getInt("bonus");
					int dno = rs.getInt("dno");
					if (job.length() < 8) {
						System.out.printf("%d\t%s\t%s\t\t%d\t%TF\t%d\t%d\t%d\n", pno, pname, job, manager, startdate,
								pay, bonus, dno);
					} else {
						System.out.printf("%d\t%s\t%s\t%d\t%TF\t%d\t%d\t%d\n", pno, pname, job, manager, startdate, pay,
								bonus, dno);
					}

				} while (rs.next());

			} else {
				System.out.println("There is no data in PERSONAL");
			}
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {

		}
	}
}
