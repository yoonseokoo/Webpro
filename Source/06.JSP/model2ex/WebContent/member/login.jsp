<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link href="${conPath }/css/login.css" rel="stylesheet">
</head>
<body>
	<c:if test="${not empty  joinResult}">
		<script>
			alert('${joinResult}');
		</script>
	</c:if>
	<c:if test="${not empty  joinErrorMsg}">
		<script>
			alert('${joinErrorMsg}');
			history.back();
		</script>
	</c:if> 
	<jsp:include page="../main/header.jsp"/>
	<div id="loginForm_wrap">
	<div id="login_title">사용자님 로그인</div>
	<form action="${conPath }/login.do" method="post">
	
		<table>
			<tr>
				<th>ID</th>
				<td>
					<input type="text" name="mId" value="${mId }" required="required">
				</td>
			</tr>
			<tr>
				<th>PW</th>
				<td>
					<input type="password" name="mPw" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" class="loginBtn_style">
					<input type="button" value="회원가입" onclick="location='${conPath}/joinView.do'" class="loginBtn_style">
				</td>
			</tr>
		</table>
	</form>
	</div><br>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>