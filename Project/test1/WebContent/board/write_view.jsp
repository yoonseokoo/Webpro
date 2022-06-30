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
<jsp:include page="../main/header.jsp"/>
	<form action="${conPath }/write.do" method="post" enctype="multipart/form-data">
	<div id="boardList_wrap">
		<table>
			<caption>원글쓰기</caption>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="mId" required="required" value="${member.mId }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>제목</th>
					<td><input type="text" name="bTitle" required="required">
				</td>
			</tr>
			<tr>
				<th>본문</th>
				<td>
					<textarea rows="5" cols="20" name="bContent" ></textarea>
				</td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<input type="file" name="bImage" class="photo">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="글쓰기" class="btn">
					<input type="reset" value="초기화" class="btn">
					<input type="button" value="목록" onclick="location='${conPath }/list.do'" class="btn">
				</td>
			</tr>
		</table>
	</div>
	</form>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>