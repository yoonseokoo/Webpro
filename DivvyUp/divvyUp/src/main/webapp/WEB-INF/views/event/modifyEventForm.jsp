<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath}/css/event/eventModify.css" rel="stylesheet">

<style>
#content {
	width: 800px;
	height: 350px;
	margin: 50px auto;
}
</style>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
	$(function() {
		$("#datepicker").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					showOtherMonths : true,
					selectOtherMonths : false,
					yearSuffix : '년',
				});
	});
</script>
<script>
	function confirmDeleteEvent() {
		let confirmDeleteEvent = confirm("이벤트를 삭제하시겠습니까? 삭제 후 복구 불가합니다");
		if (confirmDeleteEvent) {
			alert('확인');
			location.href = '${conPath}/event/deleteEvent.do?eid='+'${getEvent.eid }'+'&gid='+'${getEvent.gid }';
		}
	}
</script>

</head>
<body>
	<nav class="header" style="background-color: black;">
     <div class="container">
         <h1 class="logo">
            <a href="${conPath}/main/mainto.do">D<span>U</span></a>
         </h1>
      <ul>
          <li>
            <a href="#">${mid }님 ▶</a>
            <ul class="submenu">
              <li><a href="${conPath}/member/modifyMemberForm.do?mid=${mid }">회원 정보 관리</a></li>
               <li><a href="${conPath}/qboard/listQboardForMe.do?mid=${mid }">나의 문의 내역</a></li>
            </ul>
          </li>
          <li>
            <a href="${conPath}/main/mainto.do" class="notification">홈으로</a>
          </li>
          <li>
            <a href="${conPath}/main/logout.do">
              <img src= "${conPath}/icon/logout.png" class="imgLogout"/>
            </a>
          </li>
        </ul>
     </div>
   </nav>
<!---------------------------------------------------- 여기까지 헤더 --------------------------------------------------------->
	<div id="totalWrap">
		<div id="content">

			<form
				action="${conPath }/event/modifyEvent.do?eid=${getEvent.eid }&gid=${getEvent.gid}&mid=${mid}"
				method="post" enctype="multipart/form-data">
				<div class="eventDetail">
					<table>
						<tr>
							<td colspan="2"
							style="text-align: left; padding-top: 20px; width: 100%;color: #757877; font-weight: 100; font-size: 0.8em;">이벤트
							생성자 : ${getEvent.mid }</td>
						</tr>
						<tr>
							<td colspan="2"><h1 style="width: 100%;">
									지출정보 수정 <span>${getEvent.eid }</span>
								</h1></td>
						</tr>
						<tr>
							<td class="titles">이벤트 명</td>
							<td class="values"><input type="text" name="ename"
								value="${getEvent.ename }"></td>
						</tr>
						<tr>
							<td class="titles">설명</td>
							<td class="values"><textarea name="econtent"
									style="border: 0.5px solid grey; outline: none; text-align: center;">${getEvent.econtent }</textarea>
							</td>
						</tr>
						<tr>
							<td class="titles">사진</td>
							<td><input type="file" name="tempImage"
								value="${getEvent.eimage }" style="border:none; "></td>
						</tr>
						<tr>
							<td class="titles">총 금액</td>
							<td class="values">${getEvent.eamount }</td>
						</tr>
						<tr>
							<td class="titles">주소</td>
							<td class="values"><input type="text" name="eaddress"
								class="eaddress" readonly="readonly"
								value="${getEvent.eaddress }"></td>
						</tr>
						<%-- <tr>
							<td class="titles">날짜</td>
							<td class="values"><input type="date" name="erdate"
								id="datepicker" value="${getEvent.erdate }"></td>
						</tr> --%>
						<tr><td><input type="hidden" name="erdate" value="${getEvent.erdate }"></td></tr>
						<tr>
							<td colspan="3"><h4 style="text-align:left;">이벤트 참여자 : </h4></td>
						</tr>
					</table>
				</div>
				<div class="eventMember">
					<table>
						<tr>
							<td><b>멤버 아이디</b></td>
							<td><b>받을 금액</b></td>
							<td><b>낼 금액</b></td>
						</tr>
						<div id="scrollable">
						<c:forEach var="edDto" items="${getEventHistory }">
							<tr>
								<td>${edDto.mid }<input type="hidden" name="mids"
									value="${edDto.mid }">
								</td>
								<td><c:if test="${edDto.edshare > 0}"> 
								${edDto.edshare }
								<input type="hidden" name="share" value="${edDto.edshare }">
									</c:if> <c:if test="${edDto.edshare <= 0 }"> 
								0
	    					</c:if></td>
								<td><c:if test="${edDto.edshare < 0}"> 
								${edDto.edshare }
	    					</c:if> <c:if test="${edDto.edshare >= 0 }"> 
								0
	    					</c:if></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="3">
								<input type="submit" value="수정" class="groupModifyBtn">
								<input type="button" onclick="confirmDeleteEvent();"
									class="groupModifyBtn" value="이벤트 삭제"></td>

						</tr>
					</table>
				</div>
			</form>

		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>