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

	<jsp:include page="../main/adminHeader.jsp"/>
	<c:set var="SUCCESS" value="1"/>
	<c:set var="FAIL" value="0"/>
		<c:if test="${not empty AdminloginErrorMsg }">
			<script>
				alert('${AdminloginErrorMsg}');
				history.back();
			</script>
		</c:if>

		<c:if test="${empty admin }">
			<div id="mainForm_wrap">
				<h2>Main</h2>
			</div>
		</c:if>
	
		<c:if test="${not empty admin }">
			<div id="mainForm_wrap">
				<table>
					<h2>전체회원보기</h2>
						<tr>
							<c:forEach var="dto" items="${mAllView }">
								<td>
									<img src="${conPath }/memberPhotoUp/${dto.mPhoto}" alt="사진" width="120" ><br>
									${dto.mName }<br>
									(${dto.mId })
								</td>
							</c:forEach>
						</tr>
				</table>
				<div class="paging">
					<a href="${conPath }/mAllView.do?pageNum=1">&lt;&lt;</a>
					&nbsp; &nbsp; &nbsp;
					<c:if test="${startPage>BLOCKSIZE }">
						<a href="${conPath }/mAllView.do?pageNum=${startPage-1}">&lt;</a>
					</c:if>
					<c:if test="${startPage<=BLOCKSIZE }">
						&lt;
					</c:if>
					&nbsp; &nbsp; &nbsp;
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:if test="${i == pageNum }">
							[ <b>${i }</b> ]
						</c:if>
						<c:if test="${i != pageNum }">
							[ <a href="${conPath }/mAllView.do?pageNum=${i}">${i }</a> ]
						</c:if>
					</c:forEach>
					&nbsp; &nbsp; &nbsp;
					<c:if test="${endPage < pageCnt }">
						<a href="${conPath }/mAllView.do?pageNum=${endPage+1}">&gt;</a>
					</c:if>
					<c:if test="${endPage == pageCnt }">
						&gt;
					</c:if>
					&nbsp; &nbsp; &nbsp;
					<a href="${conPath }/mAllView.do?pageNum=${pageCnt}">&gt;&gt;</a>
		</div>
			</div>		
		</c:if>
		<jsp:include page="../main/footer.jsp"/>
	</body>
</html>