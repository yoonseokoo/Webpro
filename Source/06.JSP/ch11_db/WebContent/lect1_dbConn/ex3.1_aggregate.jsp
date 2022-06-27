<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
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
<%
	String deptnoStr = request.getParameter("deptno");
		if(deptnoStr == null) {
			deptnoStr = "-1";
		}
		int deptno = Integer.parseInt(deptnoStr);
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs = null;
		String sql = "SELECT * FROM DEPT";
%>
	<form action="">
	부서번호 <select name="deptno">
				<option value="0"></option>
		<%
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "scott", "tiger");
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()){
					int deptnoDB = rs.getInt("deptno");
					String dname = rs.getString("dname");
					if (deptnoDB != deptno) {
						out.println("<option value='" + deptnoDB + "'>" + deptnoDB + " - " + dname + "</option>" );
					} else {
					out.println("<option value='" + deptnoDB + "' selected = 'selected'>" + deptnoDB + " - " + dname + "</option>" );
					}
				}
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
		%>
			</select>
		<input type="submit">
		<%if(deptno!=-1) {%>
		<table>
			<!-- PRINTING INFO -->
			<% 
			sql = "SELECT * FROM EMP WHERE DEPTNO = " + deptno;
			try{
				conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "scott", "tiger");
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()){
					out.println("<tr><th>이름</th><th>입사일</th><th>금여</th><th>부서번호</th></tr>");
						do {
							String ename = rs.getString("ename");
							Timestamp hiredate = rs.getTimestamp("hiredate");
							int sal = rs.getInt("sal");
							out.println("<tr><td>" + ename + "</td><td>" + hiredate + "</td><td>" + sal + "</td><td>" + deptno + "</td></tr>");
						} while(rs.next());
				} else {
				out.println("<tr><td>There are no employees</td></tr>");
				}
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}finally {
				if(rs!=null) 
					rs.close();
				if(stmt!=null) 
					stmt.close();
				if(conn!=null) 
					conn.close();
			}
			%>
		</table>
		<%} %>
	</form>
</body>
</html>