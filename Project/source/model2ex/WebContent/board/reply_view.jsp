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
<body>
	<form action="${conPath }/reply.do" method="post">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="fGroup" value="${reply_view.fGroup }">
		<input type="hidden" name="fStep" value="${reply_view.fStep }">
		<input type="hidden" name="fIndent" value="${reply_view.fIndent }">

		<table>
			<caption>${param.fId }번 글의 답글 쓰기</caption>
			
			<tr>
				<th>작성자ID</th>
				<td>
					<input type="text" name="mId" readonly="readonly" value="${member.mId }">
				</td>
				<td rowspan="4"><img src="${conPath }/memberPhotoUp/${reply_view.fFilename}" width="100"></td>
			</tr>
			<tr><th>제목</th><td><input type="text" name="fTitle" required="required" value="[답] ${reply_view.fTitle }"></td></tr>
			<tr><th>본문</th><td><textarea rows="5" cols="20" name="fContent" ></textarea></td></tr>
			<tr>
				<th>사진</th>
				<td>
					<input type="file" name="fFilename" class="photo">
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="submit" value="글쓰기" class="btn">
					<input type="reset" value="초기화" class="btn">
					<input type="button" value="목록" onclick="location='${conPath }/list.do'" class="btn">
				</td>
			</tr>
		</table>
	
	</form>
</body>
</body>
</html>