<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.lec.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=conPath%>/css/join.css" rel="stylesheet">

</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %> <!-- 한글 안깨지게 -->
	<jsp:useBean id="dto" class="com.lec.dto.MemberDto"/>
	<jsp:setProperty property="*" name="dto"/>
	<%
		MemberDao dao = MemberDao.getInstance();
		int cusno = dao.getCusno(); 
		Date today = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	%>
	<jsp:include page="../main/header.jsp"/>
	<div id="joinForm_wrap">
		<form action="joinPro.jsp" method="post" name="frmJoin">
			<div id="join_title">홈쇼핑 회원 등록</div><br>
			<table>
				<tr>
					<th><label for="cusno">회원번호</label></th>
					<td><input type="text" name="cusno" id="cusno" value="<%=cusno%>" readonly="readonly"></td>
				</tr>
				<tr>
					<th><label for="custname">회원성명</label></th>
					<td><input type="text" name="custname" id="custname" required="required"></td>
				</tr>
				<tr>
					<th><label for="phone">회원전호</label></th>
					<td><input type="text" name="phone" id="phone" ></td>
				</tr>
				<tr>
					<th><label for="address">회원주소</label></th>
					<td><input type="text" name="address" id=address></td>
				</tr>
				<tr>
					<th><label for="joindate">가입일자</label></th>
					<td><input type="text" name="tempbirth" id=joindate value="<%= sf.format(today) %>" readonly="readonly"></td>
				</tr>
				<tr>
					<th><label for="grade">고객등급<br> (A:VIP, B:일반, C:직원)</label></th>
					<td><input type="text" name=grade id="grade"></td>
				</tr>
				<tr>
					<th><label for="city">도시코드</label></th>
					<td><input type="text" name="city" id="city"></td>
				</tr>
				
				<tr>
					<td colspan="2"> </td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록" class="joinBtn_style">
						<input type="button" value="조회" class="joinBtn_style" 
											onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>