<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.friend.FriendDto"%>
<%@page import="java.util.List"%>
<%@page import="com.lec.friend.FriendDao"%>
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
	request.setCharacterEncoding("utf-8"); 
%>
	<jsp:useBean id="dto" class="com.lec.friend.FriendDto" scope="page"/>
	<jsp:setProperty name="dto" property="*" />
<%
	FriendDao friendDao = FriendDao.getInstance();
	int result = friendDao.addFriend(dto); 
	if(result == FriendDao.SUCCESS) {
		%>
		<script>
			alert('Successfully added friend');	
		</script>
	<% } else {%>
		<script>
			alert('Friend not added');		
		</script>
	<% } %>
		<script>location.href='friendInputList.jsp';</script>

		
		
</body>
</html>