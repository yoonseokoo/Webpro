<%@page import="com.lec.member.MemberDaoConn"%>
<%@page import="com.lec.member.MemberDao"%>
<%@page import="java.sql.Timestamp"%>
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
%>
	<jsp:useBean id="dto" class="com.lec.member.MemberDto" scope="page"/>
	<jsp:setProperty name="dto" property="*" />
<%
	String tempbirth = request.getParameter("tempbirth");
	if(!tempbirth.equals("")){
		dto.setBirth(Timestamp.valueOf(tempbirth + " 00:00:00"));
	}
	
	MemberDaoConn mDao = new MemberDaoConn();
	int result = mDao.confirmId(dto.getId()); // ID 중복체크
	if(result == MemberDaoConn.MEMBER_NONEXISTENT){ // 사용가능한 ID
		result = mDao.joinMember(dto); // 회원가입
		if(result == MemberDaoConn.SUCCESS){ // 회원가입 성공
			session.setAttribute("id", dto.getId());
%>
			<script>
				alert('Thank you for signing up. Please login to access account');		
				location.href = 'login.jsp';
			</script>
<%		}else{ // SIGNUP FAIL
%>
			<script>
				alert('Sign up failed. Please try again');																																											
				location.href = 'join.jsp';
			</script>			
<%		}
	}else{ // ID NON-UNIQUE
%>	<script>
			alert('ID is already in use. Please use different ID');
			history.back();
		</script>			
<%}%>
</body>
</html>



