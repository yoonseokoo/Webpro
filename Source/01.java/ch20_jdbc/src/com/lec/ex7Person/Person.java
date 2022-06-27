package com.lec.ex7Person;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class Person {
	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		Scanner scanner = new Scanner(System.in);
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String ans;
		do {
			System.out.println(
					"\nWhat would you like to do:\n 1: [ADD PERSON]  \t2: [PRINT INFO ON JOB OF YOUR CHOICE]\t 3: [PRINT ALL INFO] \t4: [EXIT]");
			ans = scanner.next();
			switch (ans) {

			case "1":
				try {
					Class.forName(driver);
					conn = DriverManager.getConnection(url, "scott", "tiger");
					stmt = conn.createStatement();

					while (true) {
						System.out.print("Enter name: ");
						String pname = scanner.next();
						System.out.print("Enter job name: ");
						String jname = scanner.next();
						System.out.print("Enter Korean score: ");
						int kor = scanner.nextInt();
						System.out.print("Enter English score: ");
						int eng = scanner.nextInt();
						System.out.print("Enter Math score: ");
						int mat = scanner.nextInt();

						String sql = String.format(
								"INSERT INTO PERSON VALUES (PERSON_NO_SQ.NEXTVAL, '%s', (SELECT JNO FROM JOB WHERE JNAME='%s'), %d,%d,%d)",
								pname, jname, kor, eng, mat);
						int result = stmt.executeUpdate(sql);
						System.out.println(result > 0 ? "INSERT SUCCESSFUL" : "INSERT FAILED");
						break;

					}
				} catch (ClassNotFoundException e) {
					System.out.println(e.getMessage());
				} catch (SQLException e) {
					System.out.println("SQL ERROR" + e.getMessage());
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
				break;

			case "2":
				System.out.println(("Enter job name: (¹è¿ì/°¡¼ö/¿¥¾¾)"));
				String jname = scanner.next();

				String sql = String.format(
						"SELECT ROWNUM RANK, A.*  FROM (SELECT PNAME||'('||PNO||'¹ø)' PNAME, JNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM FROM PERSON P, JOB J WHERE P.JNO=J.JNO AND JNAME='%s' ORDER BY SUM DESC) A",
						jname);
				try {
					Class.forName(driver);
					conn = DriverManager.getConnection(url, "scott", "tiger");
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					System.out.println("RANK\tPNAME\t\tJNAME\tKOR\tENG\tMAT\tSUM");
					System.out.println("¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á");
					if (rs.next()) {
						do {
							int rank = rs.getInt("rank");
							String pname = rs.getString("pname");
							jname = rs.getString("jname");
							int kor = rs.getInt("kor");
							int eng = rs.getInt("eng");
							int mat = rs.getInt("mat");
							int sum = rs.getInt("sum");
							System.out.printf("%d\t%s\t%s\t%d\t%d\t%d\t%d\n", rank, pname, jname, kor, mat, eng, sum);
						} while (rs.next());
					} else { // when department does not exist
						System.out.println("Such job does not exist");
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
				break;

			case "3":
				try {
					Class.forName(driver);
					conn = DriverManager.getConnection(url, "scott", "tiger");
					stmt = conn.createStatement();
					String sql2 = "SELECT ROWNUM RANK, A.*\r\n"
							+ "    FROM (SELECT PNAME||'('||PNO||'¹ø)' PNAME, JNAME, KOR, ENG, MAT, KOR+ENG+MAT SUM\r\n"
							+ "            FROM PERSON P, JOB J\r\n" + "            WHERE P.JNO=J.JNO\r\n"
							+ "            ORDER BY SUM DESC) A";
					rs = stmt.executeQuery(sql2);
					System.out.println("RANK\tPNAME\t\tJNAME\tKOR\tENG\tMAT\tSUM");
					System.out.println("¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á¡á");
					while (rs.next()) {
						int rank = rs.getInt("rank");
						String pname = rs.getString("pname");
						String jname2 = rs.getString("jname");
						int kor = rs.getInt("kor");
						int eng = rs.getInt("eng");
						int mat = rs.getInt("mat");
						int sum = rs.getInt("sum");

						if (pname.length() < 7) {
							System.out.printf("%d\t%s\t\t%s\t%d\t%d\t%d\t%d\n", rank, pname, jname2, kor, mat, eng,
									sum);
						} else {
							System.out.printf("%d\t%s\t%s\t%d\t%d\t%d\t%d\n", rank, pname, jname2, kor, mat, eng, sum);
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
				break;
			}
		} while ((!ans.equalsIgnoreCase("4")));
		System.out.println("END");
	}
}
