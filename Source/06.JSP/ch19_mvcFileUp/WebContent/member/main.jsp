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
	<c:if test="${not empty loginErrorMsg }">
		<script>
			alert('${loginErrorMsg}');
			history.back();
		</script>
	</c:if>
	<c:if test="${not empty modifyResult }">
		<script>
			alert('${modifyResult}');
		</script>
	</c:if>
	
		<c:if test="${empty member }">
			<table>
				<caption>로그인 상태가 아닙니다</caption>
				<tr>
					<td colspan="3">
						<input type="button" value="로그인" onclick="location='${conPath}/loginView.do'" class="btn">
						<input type="button" value="회원가입" onclick="location.href='${conPath}/joinView.do'" class="btn">
						<input type="button" value="전체회원보기" onclick="location.href='${conPath}/mAllView.do'" class="btn">
					</td>
				</tr>
			</table>
		</c:if>
	
		<c:if test="${not empty member }">
			<table>
				<caption>${member.mName }(${member.mId })님 어서오세요</caption>
					<tr>
						<td colspan="3">
							<input type="button" value="정보수정" onclick="location.href='${conPath}/modifyView.do'" class="btn">
							<input type="button" value="로그아웃" onclick="location.href='${conPath}/logout.do'" class="btn">
							<input type="button" value="전체회원보기" onclick="location.href='${conPath}/mAllView.do'" class="btn">
						</td>
					</tr>
			</table>
		</c:if>
	
	</body>
</html>