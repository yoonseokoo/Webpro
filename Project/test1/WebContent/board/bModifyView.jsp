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
	<form action="${conPath }/bModify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="bId" value="${param.bId }">
		<input type="hidden" name="dbFileName" value="${board.bImage }">
		<div id="boardList_wrap">
		<table>
			<caption>${param.bId }번 글 수정</caption>
			<tr>
				<th>글제목</th>
				<td><input type="text" name="bTitle" value="${bModifyView.bTitle }"></td>
				<td rowspan="4"><img src="${conPath }/memberPhotoUp/${bModifyView.bImage}" width="100"></td>
			</tr>
			<tr>
				<th>본문</th>
				<td><textarea rows="5" cols="20" name="bContent">${bModifyView.bContent }</textarea></td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<input type="file" name="bImage" class="photo">
				</td>
			</tr>
			
			<tr>
				<td colspan="3">
					<input type="submit" value="저장" class="btn">
					<input type="button" value="목록" onclick="location='${conPath }/list.do?pageNum=${param.pageNum }'" class="btn">
					
				</td>
			</tr>
		
		</table>
		</div>
	
	</form>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>