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
		String letters = request.getParameter("letters");
		Connection conn = null;
		Statement  stmt = null;
		ResultSet  rs = null;
		
%>
	<form action="">
	<hr>
	이 름 <input type="text" name="letters" value="<%if(letters!=null) out.print(letters.toUpperCase()); %>">
	<input type="submit" value="검색"></input>
		<table>
			<% 
				
				String sql = "SELECT * FROM EMP WHERE ENAME LIKE UPPER ('%" + letters + "%')";
				String sql2  = "SELECT * FROM EMP";
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "scott", "tiger");
				stmt = conn.createStatement();
				if(letters!=null) {
					rs = stmt.executeQuery(sql);
				} else {
					rs = stmt.executeQuery(sql2);
				}
				
				if(rs.next()){
					out.println("<tr><th>사번</th><th>이름</th><th>직책</th><th>상사사번</th><th>입사일</th><th>금여</th><th>상여</th><th>부서번호</th>");
						do {
							int empno = rs.getInt("empno");
							String ename = rs.getString("ename");
							String job = rs.getString("job");
							int mgr = rs.getInt("mgr");
							Date hiredate = rs.getDate("hiredate");
							int sal = rs.getInt("sal");
							int comm = rs.getInt("comm");
							int deptno = rs.getInt("deptno");
							out.println("<tr><td>" + empno + "</td><td>" + ename + "</td><td>" + job + "</td><td>" + mgr + "</td><td>" + hiredate + "</td><td>" + sal + "</td><td>" + comm + "</td><td>" + deptno + "</td></tr>");
						} while(rs.next());
				} else {
				out.println("<tr><td>Such employee does not exist</td></tr>");
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
	</form>
</body>
</html>