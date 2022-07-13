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
<link href="${conPath }/css/productGroup.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$("figure").mouseleave(
		  function () {
		  $(this).removeClass("hover");
		  }
		  );
</script>
</head>
<body>
	<c:if test="${not empty cartExistsResult }">
		<script>
			alert('${cartExistsResult}');
		</script>
	</c:if>
	<c:if test="${not empty cartAddProductErrorMsg }">
		<script>
			alert('${loginErrorMsg}');
		</script>
	</c:if>
	<c:if test="${not empty cartAddProductResult }">
		<script>
			alert('${cartAddProductResult}');
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="mainForm_wrap2">
	
				<h1><img src="${conPath }/img/monogram.PNG" ></h1>
			</div>
			<div id="mainForm_wrap3">
				<p>
					<b>SINCE 1605 <br> ITALY’S OLDEST <br> BALSAMIC VINEGAR PRODUCER</b>
				</p>
				<p>
					<br>Since the seventeenth century, the Giusti family has been producing balsamic vinegar, passing down a recipe that creates a complex harmony of flavors and a product of excellence, appreciated all over the world.
				</p>
			</div>
				
		<table>
			<tr>
			<c:set var="i" value="1"/>
				<c:forEach var="dto" items="${groups }">
					<td>
						<figure class="information">
						
						<img src="${conPath }/productImg/groupImg/${dto.pGroupImg }"/>
							<figcaption>
								<h2>${dto.pGroupName }</h2>
								<p>${dto.pGroupDesc }</p>
								<p><button onclick="location.href='${conPath }/productList.do?pGroup=${dto.pGroup }'">제품보기</button></p>
							</figcaption>
						</figure>
					</td>
					<c:if test="${i%2 == 0 }">
						</tr><tr>
					</c:if>
					
					<c:set var="i" value="${i+1 }"/>
				</c:forEach>
			</tr>
		</table>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>