<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
		<link href="<%=conPath %>/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%!
		String driverMysql="com.mysql.jdbc.Driver";
		String urlMysql = "jdbc:mysql://localhost:3306/kimdb";
		String uidMysql = "root";
		String upwMysql = "mysql";
	%>
	<table>
	<% 
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM PERSONAL";
		try {
			Class.forName(driverMysql); // [1] LOAD DRIVE
			conn = DriverManager.getConnection(urlMysql, uidMysql, upwMysql);// [2] DB CONNECTING OBJECT
			stmt = conn.createStatement(); // [3] OBJECT THAT SENDS SQL
			rs = stmt.executeQuery(sql); // [4] SEND TO SQL + [5] RETRIVE SENT DATA
			if (rs.next()){
				out.println("<tr><th>사번</th><th>이름</th><th>직책</th><th>상사사번</th><th>입사일</th><th>금여</th><th>상여</th><th>부서번호</th>");
				do {
					int pno = rs.getInt("pno");
					String pname = rs.getString("pname");
					String job = rs.getString("job");
					int manager = rs.getInt("manager");
					String startdate = rs.getString("startdate");
					int pay = rs.getInt("pay");
					int bonus = rs.getInt("bonus");
					int dno = rs.getInt("dno");
					out.println("<tr><td>" + pno + "</td><td>" + pname + "</td><td>" + job + "</td><td>" + manager + "</td><td>" + startdate + "</td><td>" + pay + "</td><td>" + bonus+ "</td><td>" + dno + "</td></tr>");
				} while(rs.next());
			} else {
				out.println("<tr><td>Such data does not exist</td></tr>");
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	%>
	</table>
</body>
</html>