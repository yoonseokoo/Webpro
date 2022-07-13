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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(function()
        {
            $('#TestId').keyup(function(e)
            {
                var maxLength = 100; 
                var textlength = this.value.length;
                if (textlength >= maxLength) {
                    $('#charStatus').html(maxLength + '초과');
                    this.value = this.value.substring(0, maxLength);
                    e.preventDefault();
                } else {
                    $('#charStatus').html(maxLength - textlength);
                }
            });
        });
    </script>
 
	<link href="${conPath }/css/myCartOrder.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
<form action="${conPath }/cartBuy.do?mId=${member.mId }" method="post" >
		<div id="cartView_wrap">
		<table>
			<caption>주문 내역</caption>
		
		<c:set var="total" value="0"/>
		<c:forEach var="dto" items="${carts }">
			<tr>
				<td>${dto.cartNo }<input type="hidden" value="${dto.cartNo }" name="cartNo"></td>
				
				<td><img src="${conPath }/productImg/${dto.pImage }" class="orderImg"/></td>
				<td><h4>${dto.pName }</h4><br>
					<c:if test="${dto.pDiscount != 0}">
					<ul>
			            <li>
			                PRICE : <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${dto.pPrice*(100-dto.pDiscount)/100 }"/> 원
			            </li>
			            <li>
			               QUANTITY : ${dto.cartQuantity }
			            </li>
			            <li class="tot">
			                <br><b>TOTAL : <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${dto.pPrice*(100-dto.pDiscount)/100*dto.cartQuantity }"/></b>
			          		<c:set var="total" value="${total = total + dto.pPrice*(100-dto.pDiscount)/100*dto.cartQuantity}"/>
			            </li>
			        </ul>
						
					</c:if>
					<c:if test="${dto.pDiscount eq 0}">
					
					<ul class="txtMult">
			            <li>
			                 PRICE : <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${dto.pPrice }"/> 원
			            </li>
			            <li>
			                QUANTITY : ${dto.cartQuantity }
			            </li>
			            <li class="tot">
			                <br><b>TOTAL : <fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${dto.pPrice*dto.cartQuantity }"/></b>
			           		<c:set var="total" value="${total = total + dto.pPrice*dto.cartQuantity}"/>
			            </li>
			        </ul>
					</c:if>	
				</td>
				
		</c:forEach>
			</tr>
			<tr>
				<td colspan="3" style="text-align:center;">
					<b style="color:#8E0D00;">TOTAL ORDER COST :<fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${total}"/> 원</b>
					<input type="hidden" name="total" value="${total}"> 
				</td>
			</tr>
		</table >
		</div>
		<div id="modifyForm_wrap">
		<table>
			<caption>배송 정보 확인</caption>
			<tr>
			<th>수령인</th>
				<td>
					<input type="text" name="mName" required="required" value="${member.mName } " autofocus="autofocus" class="mName">
					
				</td>
			</tr>
			<tr>
				<th>배송주소</th>
				<td colspan="2">
					<input type="text" name="mAddress" value="${member.mAddress }" class="mAddress">
				</td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td colspan="2">
					<input type="text" name="mAddressDetail" value="${member.mAddressDetail }" class="mAddressDetail">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="mPhone" value="${member.mPhone }" autofocus="autofocus" class="mPhone" >
				</td>
			</tr>
			<tr>
				<th>배송메모</th>
				
				<td>
					<pre><textarea name="oContent" rows="5" cols="33" maxlength ="150" id="TestId"></textarea></pre>
				    <span id="charStatus" style="right:5px; width: 300px; font-size:0.5em;"></span>   
				</td>
			</tr>
			
			<tr>
				<td colspan="3">
					<input type="submit" value="주문확인" class="btn2">
					
				</td>
			</tr>
		</table>
		</div>
	</form>
	
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>