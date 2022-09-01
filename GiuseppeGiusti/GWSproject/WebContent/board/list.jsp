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
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;400&display=swap" rel="stylesheet">
	<style></style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	
	
	<c:if test="${not empty boardErrorMsg }">
		<script>
			alert('${boardErrorMsg}');
			history.back();
		</script>
	</c:if>
	<c:if test="${not empty boardResult }">
		<script>
			alert('${boardResult}');
		</script>
	</c:if>
		
	<c:if test="${not empty replyErrorMsg }">
		<script>
			alert('${replyErrorMsg}');
			history.back();
		</script>
	</c:if>
		<c:if test="${not empty replyResult }">
			<script>
				alert('${replyResult}');
			</script>
		</c:if>
		
		<c:if test="${not empty bDeleteErrorMsg }">
		<script>
			alert('${bDeleteErrorMsg}');
			history.back();
		</script>
	</c:if>
		<c:if test="${not empty bDeleteResult }">
			<script>
				alert('${bDeleteResult}');
			</script>
		</c:if>
		
	
	<div id="boardList_wrap">
	<table>
		<caption><a href=
					<c:if test="${empty member }">
						"${conPath }/loginView.do"
					</c:if>	
					<c:if test="${not empty member }">
						"${conPath }/write_view.do"
					</c:if>	
				>사용자 게시판</a></caption>

	</table>
	
	<table>
		<tr><th>글번호</th><th>작성자ID</th><th>글제목</th><th>작성일</th><th>조회수</th></tr>
		
		<c:if test="${list.size() eq 0 }">
			<tr><td colspan="7">해당 페이지 글이 없습니다</td></tr>
		</c:if>
		<c:if test="${list.size() != 0}">
			<c:forEach var="dto" items="${list }">
				<tr>
					<td>${dto.bId }</td>
					<td>${dto.mId }</td>
					<td class="titleCol">
						<c:forEach var="i" begin="1" end="${dto.bIndent }">
						  <c:if test="${i eq dto.bIndent }">
						  	&nbsp; &nbsp; └
						  </c:if>
						  <c:if test="${i != dto.bIndent }">
						  	&nbsp; &nbsp;
						  </c:if> 
						</c:forEach><!--  답변글 들여쓰기  -->
						<a href="${conPath }/contentView.do?bId=${dto.bId}&pageNum=${pageNum}&bId=${dto.mId}">
						${dto.bTitle }</a>
						<c:if test="${dto.bHit > 10 }">
							<b> * </b>
						</c:if>
					</td>
					<td><fmt:formatDate value="${dto.bRdate }" pattern="yy/MM/dd/(E)"/></td>

					<td>${dto.bHit }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

	</div>
	<div class = "paging">
		<c:if test="${startPage > BLOCKSIZE }">
		[ <a href="${conPath }/list.do?pageNum=${startPage -1}">이전</a> ]
		</c:if>
		<c:forEach var = "i" begin="${startPage }" end="${endPage }">
		<c:if test="${i eq pageNum }">
		[ <b> ${i } </b> ]
		</c:if>
		<c:if test="${i != pageNum }">
		[ <a href="${conPath }/list.do?pageNum=${i}">${i }</a> ]
		</c:if>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
		[ <a href="${conPath }/list.do?pageNum=${endPage + 1}">다음</a> ]	
		</c:if>
	</div>
		
		<jsp:include page="../main/footer.jsp"/>
	</body>
</html>