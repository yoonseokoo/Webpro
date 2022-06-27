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
	<form action="${conPath }/bModify.do" method="post">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="fId" value="${param.fId }">
		<table>
			<caption>${param.fId }번 글 수정</caption>
			<tr>
				<th>글제목</th>
				<td><input type="text" name="fTitle" value="${bModifyView.fTitle }"></td>
				<td rowspan="4"><img src="${conPath }/memberPhotoUp/${bModifyView.fFilename}" width="100"></td>
			</tr>
			<tr>
				<th>본문</th>
				<td><textarea rows="5" cols="20" name="fContent">${bModifyView.fContent }</textarea></td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<input type="file" name="fFilename" class="photo">
				</td>
			</tr>
			<tr>
				<th>IP</th>
				<td><input type="text" name="fIp" value="${bModifyView.fIp }" readonly="readonly"></td>
			</tr>
			
			<tr>
				<td colspan="3">
					<input type="submit" value="저장" class="btn">
					<input type="button" value="목록" onclick="location='${conPath }/list.do?pageNum=${param.pageNum }'" class="btn">
					
				</td>
			</tr>
		
		</table>
		
	
	</form>
</body>
</html>