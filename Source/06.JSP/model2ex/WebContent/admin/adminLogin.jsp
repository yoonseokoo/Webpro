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
	<link href="${conPath }/css/login.css" rel="stylesheet">
	<style></style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="loginForm_wrap">
	<div id="login_title">관리자 모드 로그인</div>
	<form action="${conPath }/adminLogin.do" method="post">
	
		<table>
			<tr>
				<th>ADMIN ID</th>
				<td>
					<input type="text" name="aId" value="${aId }" required="required">
				</td>
			</tr>
			<tr>
				<th>ADMIN PW</th>
				<td>
					<input type="password" name="aPw" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" class="loginBtn_style">
				</td>
			</tr>
		</table>
	</form>
	</div><br>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>