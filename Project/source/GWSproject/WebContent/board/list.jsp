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
	<style></style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
	<c:if test="${not empty modifyResult }">
		<script>
			alert('${modifyResult}');
		</script>
	</c:if>

	<c:if test="${deleteResult eq SUCCESS }">
		<script>
			alert('삭제 성공');
		</script>
	</c:if>
	<c:if test="${deleteResult eq FAIL }">
		<script>
			alert('글삭제  실패');
		</script>
	</c:if>
	<c:if test="${bModifyResult eq SUCCESS }">
		<script>
			alert('글수정 성공');
		</script>
	</c:if>
	<c:if test="${bModifyResult eq FAIL }">
		<script>
			alert('글수정  실패');
		</script>
	</c:if>
	<c:if test="${replyResult eq SUCCESS }">
		<script>
			alert('답글 달기 성공');
		</script>
	</c:if>
	<c:if test="${replyResult eq FAIL }">
		<script>
			alert('답글 달기   실패');
		</script>
	</c:if>
	<c:if test="${bDeleteResult eq SUCCESS }">
		<script>
			alert('글삭제 성공');
		</script>
	</c:if>
	<c:if test="${bDeleteResult eq FAIL }">
		<script>
			alert('글삭제  실패');
		</script>
	</c:if>
		<c:if test="${writeResult eq SUCCESS }">
		<script>
			alert('글쓰기 성공');
		</script>
	</c:if>
	<c:if test="${writeResult eq FAIL }">
		<script>
			alert('글쓰기  실패');
		</script>
	</c:if>
	<table>
		<c:if test="${empty member }">
			
				<tr><td><a href="${conPath }/loginView.do">글쓰기는 사용자 로그인 이후에만 가능합니다</a></td></tr>
		</c:if>
		
		<c:if test="${not empty member }">
				<tr><td><a href="${conPath }/write_view.do">글쓰기</a></td></tr>
		</c:if>

	</table>
	
	<table>
		<tr><th>글번호</th><th>작성자ID</th><th>글제목</th><th>사진</th><th>작성일</th><th>조회수</th></tr>
		<c:if test="${list.size() eq 0 }">
			<tr><td colspan="7">해당 페이지 글이 없습니다</td></tr>
		</c:if>
		<c:if test="${list.size() != 0}">
			<c:forEach var="dto" items="${list }">
				<tr>
					
					<td>${dto.bId }</td>
					<td>${dto.mId }</td>
					<td class="left">
						<c:forEach var="i" begin="1" end="${dto.bIndent }">
						  <c:if test="${i eq dto.bIndent }">
						  	└
						  </c:if>
						  <c:if test="${i != dto.bIndent }">
						  	&nbstp; &nbstp; 
						  </c:if> 
						</c:forEach><!--  답변글 들여쓰기  -->
						<a href="${conPath }/contentView.do?bId=${dto.bId}&pageNum=${pageNum}&mId=${member.mId}">
						${dto.bTitle }</a>
						<c:if test="${dto.bHit > 10 }">
							<b> * </b>
						</c:if>
					</td>
					<td>
						<img src="${conPath }/memberPhotoUp/${dto.bImage}" alt="사진" width="50" ><br>
					</td>
					<td><fmt:formatDate value="${dto.bRdate }" pattern="yy/MM/dd(E)"/></td>
					<td>${dto.bHit }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
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