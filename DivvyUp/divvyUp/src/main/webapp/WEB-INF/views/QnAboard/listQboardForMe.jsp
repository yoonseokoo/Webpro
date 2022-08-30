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
  <link href="${conPath }/css/board/boardList.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
  <script>
     $(document).ready(function(){
    	 $('tr').click(function() {
  			var qbid = Number($(this).children().eq(1).text());
  			if(!isNaN(qbid)) {
  				/* alert(qbid); */
   				location.href='${conPath}/qboard/viewQboard.do?qbid='+qbid+'&pageNum=${paging.currentPage}';
  			}
  		});
     });
  </script>
</head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Concert+One&family=Noto+Sans+KR:wght@500;700&display=swap" rel="stylesheet">
<body>
	<c:if test="${not empty modifyQboardResult}">
		<script>alert('문의글 수정 성공');</script>
	</c:if>
	
	<nav class="header">
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
              <li><a href="#">#</a></li>
            </ul>
          </li>
          <li>
            <%-- <a href="${conPath}/notification/notificationConfirmForm.do" class="notification"> --%>
            <a href="#" class="notification">
              <img src= "${conPath}/icon/noti.png" class="imgNoti" />
              <div class="badge">${uncheckdNotificationCnt }</div>
            </a>
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
	<c:set var="iNum" value="${paging.totCnt - paging.startRow + 1 }"/>
	
	<div class="board_list_wrap">
	<div class="main_title"><h1>나의 문의 내역</h1></div>
	<table class ="board_list">
	  <caption>문의 게시판</caption>
	  <thead>
	    <tr>
	      <th>NO.</th>
	      <th>글번호</th>
	      <th>제목</th>
	      <th>작성자</th>
	      <th>등록일</th>
	      <th>처리상태</th>
	  </tr>
	  </thead>
	  <tbody>
	  <c:if test="${paging.totCnt eq 0}">
	    <tr>
	      <th colspan="6">등록된 문의글이 없습니다</th>
	    </tr>
	  </c:if>
	  <c:if test="${paging.totCnt != 0 }">
	    <c:forEach items="${listQboardForMe }" var="qboard">
	      <tr onclick="trclicked(${qboard.qbid})">
	      	<td>${iNum }</td>
	        <td>${qboard.qbid }</td>
	        <td class="tit">${qboard.qbtitle }</td>
	        <td>${qboard.mid }</td>
	        <td>${qboard.qbrdate }</td>
	        <td>
	        <c:if test="${qboard.qbreplycheck == 1 }">
	            처리완료
	        </c:if>
	        <c:if test="${qboard.qbreplycheck == 0 }">
	            접수
	        </c:if>
	        </td>
	      </tr>
	      <c:set var="iNum" value="${iNum-1 }"/>
	    </c:forEach>
	  </c:if>
	  </tbody>
	</table>
	  
	  <div class="paging">
		<c:if test="${paging.startPage > paging.blockSize }">
			<a href="${conPath }/qboard/listQboardForMe.do?mid=${mid }&pageNum=${paging.startPage-1}" class="btn"><</a>
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${i eq paging.currentPage }">
				<a class="num2"> ${i } </a>
			</c:if>
			<c:if test="${i != paging.currentPage }">
				<a href="${conPath }/qboard/listQboardForMe.do?mid=${mid }&pageNum=${i}" class="num">${i }</a>
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			<a href="${conPath }/qboard/listQboardForMe.do?mid=${mid }&pageNum=${paging.endPage+1}" class="btn">></a>
		</c:if>
	    <div class="bt_wrap">
	      <%-- <input type="button" value="MAIN" class="btn" onclick="location='${conPath}/main/mainto.do'"/> --%>
	    </div>
	  </div>
	
	</div>
	<nav class="footer2">
        <div class="container">
           <p>서울시 XX구 XX로 000 XXX빌딩 8F | TEL : 02-999-9999 | FAX : 02-999-9998
              사업자등록번호 : 000-12-00000 | 통신판매업신로 : 종로 제0000호
              <br>좋은시스템 문의 메일 : webmaster@joeun.com
              <br>ⓒ2022 JOEUNSYSTEM.Co.,Ltd. All Rights Reserved.</p>
        </div>
     </nav>
</body>
</html>