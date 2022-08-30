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
	<c:if test="${not empty writeAboardResult}">
		<script>alert('답변글 작성 성공');</script>
	</c:if>
	
	<nav class="header">
	  <div class="container">
      	  <h1 class="logo"><a href="${conPath}/main/mainforAdmin.do">D<span>U</span></a></h1>
      	  <ul>
      	    <li>
      	      <a href="#">${aid }님 ▶</a>
      	        <ul class="submenu">
               	  <li><a href="${conPath}/qboard/listUncheckedQboardForAdmin.do">처리 대기 목록</a></li>
          	   	  <li><a href="${conPath}/qboard/listCheckedQboardForAdmin.do">처리 완료 목록</a></li>
                  <li><a href="${conPath}/adminSearch/adminSearchMain.do">회원검색목록</a></li>
             	</ul>
      	    </li>
      	    <li>
      	      <a href="${conPath}/main/logoutForAdmin.do">
                <img src= "${conPath}/icon/logout.png" class="imgLogout"/>
              </a>
      	    </li>
      	  </ul>
      	</div>
	</nav>
<!---------------------------------------------------- 여기까지 헤더 --------------------------------------------------------->		
	<c:set var="iNum" value="${paging.totCnt - paging.startRow + 1 }"/>
	
	<div class="board_list_wrap">
	<div class="main_title"><h1>문의글 처리 대기 목록</h1></div>
	<table class ="board_list">
	  <caption>처리 안된 문의글 게시판</caption>
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
	      <th colspan="6">문의 글이 없습니다</th>
	    </tr>
	  </c:if>
	  <c:if test="${paging.totCnt != 0 }">
	    <c:forEach items="${listUncheckedQboardForAdmin }" var="qboard">
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
			<a href="${conPath }/qboard/listUncheckedQboardForAdmin.do?pageNum=${paging.startPage-1}" class="btn"><</a>
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
			<c:if test="${i eq paging.currentPage }">
				<a class="num2"> ${i } </a>
			</c:if>
			<c:if test="${i != paging.currentPage }">
				<a href="${conPath }/qboard/listUncheckedQboardForAdmin.do?pageNum=${i}" class="num">${i }</a>
			</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			<a href="${conPath }/qboard/listUncheckedQboardForAdmin.do?pageNum=${paging.endPage+1}" class="btn">></a>
		</c:if>
	  </div>
	  
	</div>
	
	<nav class="footer2">
        <div class="container">
           <p>서울시 XX구 XX로 000 XXX빌딩 8F | TEL : 02-999-9999 | FAX : 02-999-9998
              사업자등록번호 : 000-12-00000 | 통신판매업신로 : 종로 제0000호 | <strong style="color: #1DBF73;">관리자모드 접속 중</strong>
              <br>좋은시스템 문의 메일 : webmaster@joeun.com
              <br>ⓒ2022 JOEUNSYSTEM.Co.,Ltd. All Rights Reserved.</p>
        </div>
     </nav>
</body>
</html>