<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="${conPath }/css/productDetail.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('.cartBtn').click(function(){
			var quant = $('.quant').val();
			location.href = '${conPath }/addCartView.do?mId=${member.mId }&pId=${product.pId }&cartQuantity='+quant;
		});
		$('.noCartBtn').click(function(){
			alert('로그인 후 이용 가능합니다')
			location.href = '${conPath }/loginView.do';
		});
	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id=content_wrap>
	<table>
		<tr>
			<td rowspan="10"><img src="${conPath }/productImg/${product.pImage }"/></td>
		</tr>
		<tr><td><br></td></tr>
		<tr>
			<td><h1>${product.pName }</h1></td>
		</tr>
		<tr>
			<td ><div class="description">${product.pDescription }</div></td>
		</tr>
		<tr>
			<td>
				<c:if test="${product.pDiscount != 0}">
					<b><del>${product.pPrice } 원</del></b><br>
						<div id="highlight">
						-${product.pDiscount }% &nbsp;&nbsp; <b> PRICE: ${product.pPrice*(100-product.pDiscount)/100 } 원 </b> <br>
							<c:if test="${not empty member }">
								<b>QUANTITY</b>
								<input type="number" style="width:50px; height:20px;" class="quant" name="cartQuantity">
								&nbsp;&nbsp;<button class="cartBtn" >장바구니 추가</button>
							</c:if>
							<c:if test="${empty member }">
								&nbsp;&nbsp;<button class="noCartBtn" >장바구니 추가</button>
							</c:if>
						</div>
				</c:if>
				<c:if test="${product.pDiscount eq 0}">
						<div id="highlight2">
							<b>PRICE : ${product.pPrice } 원 </b>
							<c:if test="${not empty member }">
								<br><b>QUANTITY&nbsp;&nbsp;</b>
								<input type="number" style="width:50px; height:20px;" min="1" max="100" class="quant" name="cartQuantity" value="1">
								&nbsp;&nbsp;<button  class="cartBtn">장바구니 추가</button>
							</c:if>
							<c:if test="${empty member }">
								&nbsp;&nbsp;<button class="noCartBtn" >장바구니 추가</button>
							</c:if>
						</div>
				</c:if>
			</td>
		</tr>
		
		<tr>
			<td>잔고: ${product.pStock }</td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="button" value="뒤로가기" onclick="history.go(-1)" class="btn2">
			</td>
		</tr>
		<tr><td><br></td></tr><tr><td><br></td></tr>
		<tr><td><br></td></tr>
	</table>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>