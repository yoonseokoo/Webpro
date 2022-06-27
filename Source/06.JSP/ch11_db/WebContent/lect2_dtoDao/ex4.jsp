<%@page import="com.lec.ex.EmpDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.ex.EmpDAO"%>
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
		String searchName = request.getParameter("searchName");	
	if(searchName ==null) {
		searchName = "";
	}
	%>
</body>
<form action="">
	<p>이름 <input type="text" name="searchName" value="<%=searchName.toUpperCase() %>">
			<input type="submit" value="검색">
	</p>
</form>
<table>
<%
	EmpDAO dao = EmpDAO.getInstance();
	ArrayList<EmpDTO> emps = dao.selectSearchName(searchName);
	out.println("<tr><th>사번</th><th>이름</th><th>직책</th><th>상사사번</th><th>입사일</th><th>금여</th><th>상여</th><th>부서번호</th>");
	if(emps.size()!=0){
		for(EmpDTO emp : emps) {
			out.println("<tr><td>" + emp.getEmpno() + "</td><td>" + emp.getEname() + "</td><td>" 
			+ emp.getJob() + "</td><td>" + emp.getMgr() + "</td><td>" + emp.getHiredate() 
			+ "</td><td>" + emp.getSal() + "</td><td>" + emp.getComm()+ "</td><td>" + emp.getDeptno() + "</td></tr>");
		}
		
	} else {
	out.println("<tr><td colspan='8'>There are no employees with such name</td></tr>");
	}
%>
</table>
</html>