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
	

	<form action="${conPath }/login.do" method="post">
	<div id="totalLogin">
		<div id="loginForm_wrap1">
		<div id="login_title1">로그인</div>
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="mId" value="${mId }" required="required" class="mId">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="mPw" required="required" class="mPw">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" class="loginBtn_style">
				</td>
			</tr>
			<tr>
				<td colspan="2" id="login_findIdPw">
					<a href="${conPath }/adminLoginView.do">아이디/비밀번호를 잊으셨나요?</a>
				</td>	
			</tr>
		</table>
		</div>
		<div id="loginForm_wrap2">
			<div id="login_title2">등록</div>
				<table>
					<tr>
						<td>
							<p>
								<b>GIUSEPPE GIUSTI KOREA</b> 회원으로 가입하시면 빠르고 편리하게 이용하실 수 있습니다.
							</p>
							<p>
								아직 <b>GIUSEPPE GIUSTI KOREA</b> 의 회원이 아니시라면 이메일로 간편하게 가입하실 수 있습니다.
							</p>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="회원가입" onclick="location='${conPath}/joinView.do'" class="joinBtn_style">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>