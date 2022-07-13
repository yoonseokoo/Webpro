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
	<link href="${conPath }/css/myCart.css" rel="stylesheet">
	<style></style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	    
</head>
<body>
<jsp:include page="../main/header.jsp"/>
		
<div id=cart_wrap>
	
		<c:if test="${empty orders }">
			<div id="empty">
			<table>
				<caption>No past purchase</caption>
				<tr><td><button class="btn2" onclick="location.href='${conPath}/productGroup.do'">쇼핑하기</button></td></tr>
			</table>
			</div>
		</c:if>
		<c:if test="${not empty orders }">
		<table>
		<caption>${member.mName }님 주문 내역</caption>
		<c:forEach var="dto" items="${orders }">
			
			<tr>
				<td>
					${dto.oDate }
				</td>
				<td><img src="${conPath }/productImg/${dto.pImage }"/></td>
				<td><h4>${dto.pName }</h4><br>
			

					
					<ul class="txtMult">
			            <li>
			                 <b>PRICE :</b><fmt:setLocale value="ko_KR"/><input type="hidden" name="txtEmmail" readonly="readonly" class="val1" value="${dto.pPrice }"/><fmt:formatNumber type="currency" value="${dto.pPrice }"/>
			            </li>
			            <li>
			               <b>QUANTITY : ${dto.cartQuantity }

			            </li>
			            <li>
			               <br>TOTAL : ${dto.cartQuantity*dto.pPrice }
			            </li>
			        </ul>
				</td>
				
		</c:forEach>
	</table>
	</c:if>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>