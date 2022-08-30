
<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<meta charset="UTF-8">
<link href="${conPath }/css/event/select.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function() {

	});
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
	<div id="content">
		<input type="button" value="1/n 정산"
			onclick="location='${conPath }/event/insertEventForm.do?gid=${selectEventType }'">
		<input type="button" value="직접 입력"
			onclick="location='${conPath }/event/insertEventForm2.do?gid=${selectEventType }'">
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>