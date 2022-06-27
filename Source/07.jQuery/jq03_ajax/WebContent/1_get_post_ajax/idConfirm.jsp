<%@page import="com.lec.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String mId = request.getParameter("mId");
	MemberDao mDao = MemberDao.getInstance();
	int result = mDao.mIdConfirm(mId);
	if(result==MemberDao.EXISTENT){
		out.print("ID already in use");
	}else{
		out.print("Avaiable ID");
	}
%>

</body>
</html>