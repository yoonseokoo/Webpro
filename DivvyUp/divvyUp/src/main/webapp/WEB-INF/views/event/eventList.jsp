<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link href="${conPath}/css/event/eventList.css" rel="stylesheet">
<meta charset="UTF-8">
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
          <!-- <li>
            <a href="#">공지사항</a>
          </li> -->
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
		<h1>지출내역</h1>
		
			<table class="scrollable">
					<c:if test="${empty eventList }">
						<tr><td><h4 style="margin:0 auto;">지출없음</h4></td></tr>
					</c:if>	
					<c:if test="${not empty eventList }">
				<c:forEach var="event" items="${eventList }">
					<tr>
						<td colspan="3" class="ename">지출 (${event.erdate })</td>
					</tr>
					<tr>
						<td class="titles">지출명</td>
						<td class="values">${event.ename } </td>
						
							<td rowspan="6" >
								<img src="${conPath }/eventImgFileUpload/${event.eimage }">
							</td>
					</tr>
					<tr>
						<td class="titles">지출내용</td>
						<td class="scrollable2" >${event.econtent }</td>
					</tr>
					<tr>
						<td class="titles">총지출액</td>
						<td class="values">${event.eamount }</td>
					</tr>
					<tr>
						<td class="titles">주소</td>
						<c:if test="${event.eaddress eq null}">
						<td class="values" style="color:lightgrey">No address</td>
						</c:if>
						<c:if test="${event.eaddress  != null}">
						<td class="values">${event.eaddress }</td>
						</c:if>
						
					</tr>
					<tr>
						<td class="titles">참여자 수</td>
						<td class="values">${event.ecount }</td>
					</tr>
					<tr>
						<td class="titles">지불한 사람</td>
						<td class="values">${event.mid }</td>
					</tr>
					<c:if test="${check !=1 }">
						<tr>
							<td colspan="3"><input type="button" value="이벤트 정보수정" class="btn_style" 
								onclick="location='${conPath }/event/modifyEventForm.do?eid=${event.eid }&gid=${event.gid }'">
							</td>
						</tr>
					</c:if>
				</c:forEach>
				</c:if>	
			</table>
					<br><button class="btn_style2" onclick="history.back()">뒤로가기</button>
		</div>

	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>