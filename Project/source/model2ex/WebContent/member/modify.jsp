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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  	<script>
  $( function() {
    $( "#datepicker" ).datepicker({
    	dateFormat : 'yy-mm-dd',
    	changeMonth : true, 
    	monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    	showMonthAfterYear : true,
    	yearSuffix : '년',
    	showOtherMonths : true,
    	dayNamesMin:['일','월','화','수','목','금','토'],
			changeYear : true,
			minDate : '-100y',
			yearRange : 'c-100:c+0',
    });
  });
  </script>
	<link href="${conPath }/css/style.css" rel="stylesheet">
</head>
<body>
	<c:if test="${empty member }"> <!-- 로그인 전이면 로그인 페이지로 가기 -->
		<script>location.href="login.do";</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<form action="${conPath }/modify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="dbmPhoto" value="${member.mPhoto }">
		<table>
			<caption>회원 정보 수정</caption>
			<tr><th>아이디</th>
					<td><input type="text" name="mId" value="${member.mId }" readonly="readonly"></td>
					<td rowspan="3"><img src="${conPath }/memberPhotoUp/${member.mPhoto}" width="100"></td>
			</tr>
			<tr><th>비밀번호</th>
					<td><input type="password" name="mPw" required="required" value="${member.mPw }"></td>
			</tr>
			<tr><th>이름</th>
					<td><input type="text" name="mName" required="required" value="${member.mName }"></td>
			</tr>
			<tr>
				<th>메일</th>
				<td><input type="email" name="mEmail" value="${member.mEmail }"></td>
				<td>사진</td>
			</tr>
			<tr>
				<th>사진</th>
				<td colspan="2"><input type="file" name="mPhoto"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td colspan="2"><input type="text" name="mBirth" id="datepicker" value="${member.mBirth }"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td colspan="2"><input type="text" name="mAddress" value="${member.mAddress }"></td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="submit" value="정보수정" class="btn">
						<input type="reset" value="초기화" class="btn">
						<input type="reset" value="이전" onclick="history.go(-1)" class="btn">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>