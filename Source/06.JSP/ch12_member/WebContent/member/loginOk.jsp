<%@page import="com.lec.member.MemberDto"%>
<%@page import="com.lec.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.loginCheck(id, pw);
		if(result==MemberDao.LOGIN_SUCCESS) { //LOGIN SUCCESSFUL
			MemberDto member = mDao.getMember(id);
			session.setAttribute("member", member);
			response.sendRedirect("main.jsp");
		} else if (result == MemberDao.LOGIN_FAIL_PW) { //LOGIN FAIL DUE TO PW
%> 	<script>
			alert('Please check your PW');
			history.back();
		</script>
<%		 } else { //LOGIN FAIL DUE TO ID
%> 	<script>
			alert('Please check your ID');
			history.back();
		</script>
<%			
		}
	%>
</body>
</html>