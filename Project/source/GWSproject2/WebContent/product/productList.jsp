<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/productList.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;400&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>

			<div id="mainForm_wrap2">
				<h1><img src="${conPath }/img/monogram.PNG" ></h1>
			</div>
			<div id="mainForm_wrap3">
				<p>
					<h3> THE RESULTS OF A CENTURIES-OLD TRADITION </h3>
				</p>
				<p>
					A journey through the historicity of the Giusti Balsamic Vinegar of Modena collection, the nobility of the Traditional Balsamic Vinegar of Modena, and the innovation of condiments and Gourmet products. Result and pride of skills and experience handed down over four centuries of Giusti family
				</p>
			</div>
<div id="productList_wrap">
	<table>
		
		<tr>
			<c:set var="j" value="0"/>
				<c:forEach var="dto" items="${products }">
				<td>
					<a href="${conPath }/productDetail.do?pId=${dto.pId }">
						<div id="imgProducts">
							<img src="${conPath }/productImg/${dto.pImage }" width=400/>
							
						</div>
					</a>
					<div id="contents">
						<c:if test="${dto.pDiscount != 0}">
						<h2>${dto.pName }<br></h2>
							<b><del>${dto.pPrice } 원</del></b><br>
							<div id="highlight">
								<a href="${conPath }/producDetail.do"><b>&nbsp;&nbsp;&nbsp;-${dto.pDiscount }% &nbsp;&nbsp; ${dto.pPrice*(100-dto.pDiscount)/100 } 원 &nbsp; &nbsp;- BUY NOW </b></a>
							</div>
						</c:if>
						<c:if test="${dto.pDiscount eq 0}">
						<h2>${dto.pName }<br></h2>
							<div id="highlight2">
								<a href="${conPath }/producDetail.do"><b>&nbsp;&nbsp;&nbsp;${dto.pPrice } 원 - BUY NOW</b></a>
							</div>
						</c:if>
						</div>
				</td>
					
				<c:if test="${j%4 eq 3 }">
						</tr><tr>
				</c:if>
				<c:set var="j" value="${j+1 }"/>
			</c:forEach>
		</tr>
	</table>
	</div>
	<div class = "paging">
		<c:if test="${startPage > BLOCKSIZE }">
		[ <a href="${conPath }/productList.do?pGroup=${pGroup }&pageNum=${startPage -1}">이전</a> ]
		</c:if>
		<c:forEach var = "i" begin="${startPage }" end="${endPage }">
		<c:if test="${i eq pageNum }">
		[ <b> ${i } </b> ]
		</c:if>
		<c:if test="${i != pageNum }">
		[ <a href="${conPath }/productList.do?pGroup=${pGroup }&pageNum=${i}">${i }</a> ]
		</c:if>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
		[ <a href="${conPath }/productList.do?pGroup=${pGroup }&pageNum=${endPage + 1}">다음</a> ]	
		</c:if>
		<br><br><input type="button" value="목록 보기" onclick="location.href='${conPath }/productGroup.do'" class="btn2">
	</div>
		<jsp:include page="../main/footer.jsp"/>
</body>	
</html>











