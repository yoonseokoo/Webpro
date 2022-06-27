<%@page import="com.lec.member.MemberDao"%>
<%@page import="com.lec.member.MemberDto"%>
<%@page import="java.sql.Timestamp"%>
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
	<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="dto" class="com.lec.member.MemberDto"/>
	<jsp:setProperty name="dto" property="*"/>
	
	<%
	String tempbirth = request.getParameter("tempbirth");
	if(!tempbirth.equals("")){
		dto.setBirth(Timestamp.valueOf(tempbirth + " 00:00:00"));
	}
	MemberDto member = (MemberDto)session.getAttribute("member");
	String sessionPw = null;
	if(member!=null) {
		sessionPw = member.getPw(); 
	}
	String oldPw = request.getParameter("oldPw");
	if(sessionPw.equals(oldPw)){
		if(dto.getPw() == null) {
			dto.setPw(oldPw);
		}
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.modifyMember(dto);
		if(result==MemberDao.SUCCESS) { //UPDATE SUCCESSFUL
			session.setAttribute("member", dto); //update info in session
%>			<script>
				alert('Your information has been updated successfully');
				location.href = 'main.jsp';
			</script>
<%
		} else { //UPDATE UNSUCCESSFUL
%>			<script>
				alert('Information could not be updated. Please check your changes');
				location.href = 'modify.jsp';
			</script>
<%	
		}
		
	} else { //if current password is entered incorrectly
		%>
		<script>
			alert('Current password is incorrect. Please check your Pw');
			history.back();
		</script>
		<% } %>
	}
	
	
	%>
</body>
</html>










