<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.dto.MemberDto"%>
<%@page import="com.lec.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel="stylesheet">

</head>
<body>
<%
	out.println("<h3>1.로그인</h3>");
	MemberDao dao = MemberDao.getInstance();
	int result = dao.loginCheck("aaa", "1");
	if(result == MemberDao.LOGIN_SUCCESS){
		out.println("<p>aaa-1 로그인성공</p>");
	}
	result = dao.loginCheck("aaa", "9");
	if(result == MemberDao.FAIL){
		out.println("<p>aaa - 9 로그인실패</p>");
	}
	out.println("<h3>2.mid로 dto가져오기</h3>");
	MemberDto member = dao.getMember("aaa");
	out.println("<p>"+member+"</p>");
	out.println("<h3>3.회원id중복체크</h3>");
	if(MemberDao.EXISTENT == dao.mIdConfirm("bbb")){
		out.println("bbb는 중복된 ID");
	}else if(MemberDao.NONEXISTENT == dao.mIdConfirm("bbb")){
		out.println("bbb는 사용가능한 ID");
	}
	out.println("<h3>4.회원가입</h3>");
	result = dao.joinMember(new MemberDto("eee","1","홍길",null,"NOIMG.JPG",null, null,null));
	if(result == MemberDao.SUCCESS){
		out.println("회원가입 성공");
	}else if(result == MemberDao.FAIL){
		out.println("회원가입 실패");
	}
	out.println("<h3>5.정보 수정</h3>");
	result = dao.modifyMember(new MemberDto("eee","1","홍길동","hong@h.com","NOIMG.JPG",null, "부산",null));
	if(result == MemberDao.SUCCESS){
		out.println("회원수정 성공");
	}else if(result == MemberDao.FAIL){
		out.println("회원수정 실패");
	}
	out.println("<h3>6.회원리스트(최신 가입일 순 4등~6등)</h3>");
	ArrayList<MemberDto> members = dao.allMember(4, 6);
	for(MemberDto m : members){
		out.println(m + "<hr>");
	}
	out.println("<h3>7. 회원수 : "+dao.getMemberTotCnt()+"</h3>");
%>
</body>
</html>