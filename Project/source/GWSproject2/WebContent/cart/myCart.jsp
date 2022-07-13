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
	<script>
		function cartUpdate(cartNo){
			cartQuantity = document.getElementById('cartQuantity'+cartNo).value;
			location='${conPath }/cartUpdate.do?cartQuantity='+cartQuantity+'&cartNo='+cartNo;
		}
	</script>
	<script>
	    $(document).ready(function () {
	    	multInputs();
	        $(".txtMult").keyup(multInputs);
	        $(".txtMult").click(multInputs);
	        function multInputs() {
	            var mult = 0;
	           
	            // for each row:
	            $("ul.txtMult").each(function (idx, item) {
	                // get the values from this row:
	                var val1 = $('.val1', this).val();
	                var val2 = $('.val2', this).val();
	                var total = (val1 * 1) * (val2 * 1);
	                // set total for the row
	               
	                $('.multTotal', this).html("₩"+comma2(total));
	                mult += total;
	                
	            });
	            $('span').html("₩"+comma2(total));
	        }
	       
	        function comma2(x) {
				x = x+'';
				var tempStr = '';
			  var len = x.length;
			  for(var i=0 ; i<len ; i++){
				  tempStr += x[i];
				  if(((len-i-1)%3 == 0) && (i!=(len-1))){
					  tempStr += ",";
				  }
			  }
			  return tempStr;
			}
	    });  
		  
	    </script>
	    
</head>
<body>
<jsp:include page="../main/header.jsp"/>
		<c:if test="${not empty cartDelProductErrorMsg }">
			<script>
				alert('${cartDelProductErrorMsg}');
				history.back();
			</script>
		</c:if>
		<c:if test="${not empty cartDelProductResult }">
			<script>
				alert('${cartDelProductResult}');
			</script>
		</c:if>
		
<div id=cart_wrap>
	
		<c:if test="${empty carts }">
			<div id="empty">
			<table>
				<caption>장바구니가 비어있습니다</caption>
				<tr><td><button class="btn2" onclick="location.href='${conPath}/productGroup.do'">쇼핑하기</button></td></tr>
			</table>
			</div>
		</c:if>
		<c:if test="${not empty carts }">
		<table>
		<caption>${member.mName }님 장바구니</caption>
		
		<c:forEach var="dto" items="${carts }">
			
			<tr>
				<td>${dto.cartNo }<input type="hidden" value="${dto.cartNo }" class="cartNo"></td>
				<td><img src="${conPath }/productImg/${dto.pImage }"/></td>
				<td><h4>${dto.pName }</h4><br>
			
					<c:if test="${dto.pDiscount != 0}">
					<ul class="txtMult">
			            <li>
			                <b>PRICE :</b><fmt:setLocale value="ko_KR"/><input type="hidden" name="txtEmmail" readonly="readonly" value="${dto.pPrice }"/><fmt:formatNumber type="currency" value="${dto.pPrice }"/>
			            </li>
			             <li>
			                <b>DISCOUNT : </b><input name="txtEmmail"value='${dto.pDiscount }%'  readonly="readonly" />
			            </li>
			            <li>
			                <b style="color:red;">PRICE AFTER DISCOUNT : <fmt:setLocale value="ko_KR"/><input type="hidden" name="txtEmmail" class="val1" max="150" value='${dto.pPrice*(100-dto.pDiscount)/100 }'  readonly="readonly" /><fmt:formatNumber type="currency" value="${dto.pPrice*(100-dto.pDiscount)/100 }"/></b>
			            </li>
			            <li>
			               <b>QUANTITY : </b><input type="number" name="txtEmmail" class="val2" min="0" max="150" value="${dto.cartQuantity }" id="cartQuantity${dto.cartNo }"/>
			            	<button class="updateCartBtn" onclick="cartUpdate(${dto.cartNo })">UPDATE</button>
			            </li>
			            <li>
			                <br><b>TOTAL : </b><span class="multTotal">0.00</span>
			                
			            </li>
			        </ul>
						
					</c:if>
					<c:if test="${dto.pDiscount eq 0}">
					
					<ul class="txtMult">
			            <li>
			                 <b>PRICE :</b><fmt:setLocale value="ko_KR"/><input type="hidden" name="txtEmmail" readonly="readonly" class="val1" value="${dto.pPrice }"/><fmt:formatNumber type="currency" value="${dto.pPrice }"/>
			            </li>
			            <li>
			               <b>QUANTITY : </b><input type="number" name="txtEmmail" class="val2" min="0" value="${dto.cartQuantity }" id="cartQuantity${dto.cartNo }"/>
			               <button class="updateCartBtn" onclick="cartUpdate(${dto.cartNo })">UPDATE</button>
			            </li>
			            <li>
			               <br><b>TOTAL : </b><span class="multTotal">0.00</span>
			            </li>
			        </ul>
					</c:if>	
				</td>
				<td>
					
					<button class="btnDelete" onclick="location.href='${conPath}/cartDelete.do?cartNo=${dto.cartNo }&mId=${member.mId }'">삭제</button>
					
				</td>
		</c:forEach>
		<tr>
				<td colspan="4" >
					<button class="btn2" onclick="location.href='${conPath }/cartBuyView.do?mId=${member.mId }'">주문하기</button>
				</td>
		</tr>
	</table>
	</c:if>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>