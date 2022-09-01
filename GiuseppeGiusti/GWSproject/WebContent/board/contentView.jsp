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
<link href="${conPath }/css/bContentView.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;400&display=swap" rel="stylesheet">
</head>
<body>

	<jsp:include page="../main/header.jsp"/>
	<input type="hidden" name="dbmPhoto" value="${contentView.bImage }">
	<div id="boardList_wrap">

	<table>
		<caption>${contentView.bId }글 상세보기</caption>

		<tr>
			<th>글번호</th>
			<td>${contentView.bId }</td>
		</tr>
		<tr>
			<th>작성자ID</th>
			<td>${contentView.mId }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${contentView.bTitle }</td>
		</tr>
		<tr>
			<th>본문</th>
			<td >${contentView.bContent }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><fmt:formatDate value="${contentView.bRdate }" pattern="yy/MM/dd(E)"/>
		</tr>
		 <tr>
		 	<th>첨부파일</th>
			<td>
				<c:if test="${not empty contentView.bImage }">
					<a href="${conPath }/boardPhotoUp/${contentView.bImage}" target="_blank">${contentView.bImage}</a>
				</c:if>
				<c:if test="${empty contentView.bImage }">
					첨부파일없음
				</c:if>
			</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${contentView.bHit }</td>
		</tr>
		<c:if test="${not empty member }">
			<c:if test="${member.mId eq contentView.mId }">
				<tr>
					<td colspan="3">

						<button onclick="location='${conPath }/bModifyView.do?bId=${contentView.bId }&pageNum=${param.pageNum }'" class="btn2">수정</button>
						<button onclick="location='${conPath }/bDelete.do?bId=${contentView.bId }&pageNum=${param.pageNum }'" class="btn2">삭제</button>
						<button onclick="location='${conPath }/reply_view.do?bId=${contentView.bId }&pageNum=${param.pageNum }'" class="btn2">답변</button>
						<button onclick="location='${conPath }/list.do?mId=${member.mId }&pageNum=${param.pageNum }'" class="btn2">목록</button>

					</td>
				</tr>
			</c:if>
			<c:if test="${member.mId != contentView.mId }">
				<tr>
					<td colspan="3">
						

						<button onclick="location='${conPath }/reply_view.do?bId=${contentView.bId }&pageNum=${param.pageNum }'" class="btn2">답변</button>
						<button onclick="location='${conPath }/list.do?mId=${member.mId }&pageNum=${param.pageNum }'" class="btn2">목록</button>


					</td>
				</tr>
			</c:if>
		</c:if>
		
		<c:if test="${ empty member }">
				<tr>
				<td colspan="3">
					<input type="button" value="목록" onclick="history.back()" class="btn2">
	
				</td>
			</tr>
		</c:if>
	</table>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>