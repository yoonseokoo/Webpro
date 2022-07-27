
<%@page import="com.lec.dao.MemberDao"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String conPath = request.getContextPath();
%> 
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
	<jsp:useBean id="dto" class="com.lec.dto.MemberDto"/>
	<jsp:setProperty name="dto" property="*" />
	<%
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.modify(dto);
		if(result == MemberDao.SUCCESS){
			session.setAttribute("customer", dto);
	%>				<script>
						alert('회원정보 수정이 완료되었습니다');
						location.href = '<%=conPath%>/member/list.jsp';
					</script>
<%			}else{%>
					<script>
						alert('회원정보 수정이 실패되었습니다. 정보가 너무 깁니다');
						location.href = 'modify.jsp';
					</script>
<%			} %>
			
</body>
</html>










