<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


<script>
	const nav = document.querySelector('.nav')
	window.addEventListener('scroll', fixNav)

	function fixNav() {
		if (window.scrollY > nav.offsetHeight + 150) {
			nav.classList.add('active')
		} else {
			nav.classList.remove('active')
		}
	}
	
	$(document).ready(function(){
	      $modal = $(".modal"); 
	       $(".notification").click(function(){
	           $modal.fadeIn('slow');
	          $.ajax({
	             url : '${conPath}/notification/notificationConfirmForm.do',
	             type : 'get',
	             dataType : 'html',
	             success : function(data){
	               $('.layerpop').html(data);
	             }
	           });
	          return false;
	      });
	        
	       $('.modal').click(function(e){
	         var target = e.target; // 이벤트가 적용된 부분
	           $('.modal').fadeOut('slow');
	           location.href='${conPath}/notification/updateUncheckNotification.do';
	      });
	});
</script>

<link href="${conPath }/css/main/main.css" rel="stylesheet">
</head>
<body>

	<c:if test="${modifyMemberResult eq 1 }">
		<script>
			alert('회원정보 수정 성공');
		</script>
	</c:if>

	<c:if test="${modifyMemberResult eq 0 }">
		<script>
			alert('회원정보 수정 실패');
		</script>
	</c:if>

	 <c:if test="${not empty mid }"><!-- 회원만 들어왔을 때 -->
     <nav class="header">
      <div class="container">
         <h1 class="logo">
            <a href="${conPath}/main/mainto.do">D<span>U</span></a>
         </h1>
         <c:if test="${param.windowType eq 0}">
              <div style="left: 250px; align-items: left; position: absolute;"class="section mt-5">
             <div class="row">
              <div class="col-12">
                <div id="switch">
                 <div id="circle"></div>
               </div>
              </div>
             </div>
           </div>  
            </c:if>
            <c:if test="${empty param.windowType}">
              <div style="left:250px; align-items: left; position:absolute;" class="section mt-5">
                <div class="row" >
                  <div class="col-12" >
                    <div id="switch" >
                      <div id="circle"></div>
                    </div>
                  </div>   
                </div>         
              </div>  
            </c:if>
            <c:if test="${param.windowType eq 1}">
              <div style="left:250px; align-items: left; position:absolute;" class="section mt-5">
                <div class="row" >
                  <div class="col-12" >
                    <div id="switch" class="switched" >
                      <div id="circle"></div>
                    </div>
                  </div>   
               </div>         
             </div>  
            </c:if>
         <ul>
              <li>
                <a href="#">${mid }님 ▶</a>
                <ul class="submenu">
                  <li><a href="${conPath}/member/modifyMemberForm.do?mid=${mid }">회원 정보 관리</a></li>
                   <li><a href="${conPath}/qboard/listQboardForMe.do?mid=${mid }">나의 문의 내역</a></li>
                  <!-- <li><a href="#">#</a></li> -->
                </ul>
              </li>
              <li>
               <a href="${conPath}/notification/notificationConfirmForm.do" class="notification">
                    <img src= "${conPath}/icon/noti.png" class="imgNoti" />
                    <div class="badge">${uncheckdNotificationCnt }</div>
                </a>
                </li>
                <!-- <li>
                <a href="#">공지사항</a>
              </li> -->
              <li>
               <a href="${conPath}/main/logoutForAdmin.do">
                  <img src= "${conPath}/icon/logout.png" class="imgLogout"/>
               </a>
              </li>
            </ul>
      </div>
     </nav>
   </c:if><!-- 회원만 들어왔을 떄 -->
   
   <c:if test="${not empty aid}"><!-- 관리자만 들어왔을 때 -->
     <nav class="header">
       <div class="container">
           <h1 class="logo"><a href="${conPath}/main/mainforAdmin.do">D<span>U</span></a></h1>
           <ul>
             <li>
               <a href="#">${aid }님 ▶</a>
                 <ul class="submenu">
                    <li><a href="${conPath}/qboard/listUncheckedQboardForAdmin.do">처리 대기 목록</a></li>
                     <li><a href="${conPath}/qboard/listCheckedQboardForAdmin.do">처리 완료 목록</a></li>
                  <li><a href="${conPath }/adminSearch/adminSearchMain.do">회원검색목록</a></li>
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
   </c:if>
<!---------------------------------------------------- 여기까지 헤더 --------------------------------------------------------->
   <div class="modal">
       <div class="screen">
        <div class="layerpop">
               
       </div>
       </div>
   </div>
<!---------------------------------------------------- 여기까지 모달창 --------------------------------------------------------->




	<div class="mainSection">
		<div class="oldDiv">
         <!-- slide:before -->
         <c:if test="${not empty person }">
          <h1>${person.mname }님<span> 어서오세요<span></h1>
        </c:if>
        
        <c:if test="${not empty admin }">
          <h1>${aid }님<span> 관리자 모드 접속<span></h1>
        </c:if>
         <p>Keep track of your shared expenses and balances with
            housemates, trips, groups, friends, and family.</p>
      </div>


		<div class="newDiv">
			<div id="friends">
				<h3>Following (${myFollowingList.size()})</h3>
				<div class="scrollable" style="height: 15vh; width:330px;">
					<c:forEach items="${myFollowingList }" var="followingMember">
						<ul>
							<li>▶ ${followingMember.to_mid }
								<button class="friendsButton"
									onclick="location='${conPath}/follow/unfollowMember.do?from_mid=${mid }&to_mid=${followingMember.to_mid }&windowType=${param.windowType }'">UNFOLLOW</button>
							</li>
						</ul>
					</c:forEach>
				</div>
				<hr>
				<h3>Followers (${myFollowerList.size() })</h3>
				<div class="scrollable" style="height: 15vh;  width:330px;">
					<c:forEach items="${myFollowerList }" var="followerMember">
						<ul>
							<li>▶ ${followerMember.from_mid }</li>
						</ul>
					</c:forEach>
				</div>
				<hr>

				<form action="${conPath}/member/searchMemberList.do?mid=${mid}"
					method="get">
					<input type="hidden" name="startRow" value="1"> <input
						type="hidden" name="endRow" value="10"> <input
						type="hidden" name="windowType" id="windowType"
						value="${windowType}">
					<div id="findFriend">
						<h4>친구찾기</h4>
						<select name="schItem" class="schItem">
							<option value="mid"
								<c:if test="${schItem.mid eq 'mid'}">
                        selected="selected" style="background-color:black;"
                     </c:if>>아이디
								검색</option>
							<option value="mname"
								<c:if test="${schItem.mname eq 'mname'}">
                        selected="selected"
                     </c:if>>이름
								검색</option>
						</select>
					</div>
					<input type="text" name="schWord" class="schWord"
						value="${schItem.schWord }"> <input type="submit"
						value="검색" class="searchBtn" onclick="return showResult()">

				</form>

				<div class="scrollable" style=" width:330px;">
					<table>
						<c:forEach items="${searchedMemberList }" var="member">
							<c:set var="i" value="0" />
							<tr>
								<td style="font-weight: bold;">${member.mid }</td>
								<c:forEach items="${FollowingList }" var="Member">
									<c:if test="${member.mid eq Member.to_mid }">
										<td rowspan="2">
											<button style="color: red; margin-left: 3px;"
												class="friendsButton2"
												onclick="location='${conPath }/follow/unfollowMember.do?from_mid=${mid }&to_mid=${member.mid }&windowType=${param.windowType }'">-</button>
										</td>
										<c:set var="i" value="${i + 1 }" />
									</c:if>
								</c:forEach>
								<c:if test="${(i eq 0) and (Member.to_mid != member.mid) }">
									<td rowspan="2">
										<button style="color: #1DBF73;" class="friendsButton2"
											onclick="location='${conPath}/follow/followMember.do?from_mid=${mid }&to_mid=${member.mid }&windowType=${param.windowType }'">+</button>
									</td>
								</c:if>

							</tr>
							<tr>
								<td style="color: grey; font-size: 0.8em;">&nbsp;
									&nbsp;${member.mname }</td>
							</tr>
						</c:forEach>
					</table>
				</div>

			</div>
			<div id="groups">

				<c:forEach var="groups" items="${groupList }">
					<table >
						<tr
							onclick="location='${conPath }/groups/groupInfo.do?gid=${groups.gid }&mid=${member.mid}'">
							<td>${groups.gid }</td>
							<td>
								<p class="groupTitle">${groups.gname }</p>
								<p class="groupContent">${groups.gcontent }
							</td>

							<td>
								<p class="groupDate">${groups.grdate}
								<p>
							</td>
						</tr>
					</table>
				</c:forEach>

				<div class="paging">
					<c:if test="${paging.startPage > paging.blockSize }">
						<a
							href="${conPath }/main/mainto.do?pageNum=${paging.startPage-1}&windowType=${1}"
							class="btn">이전</a>
					</c:if>
					<c:forEach var="i" begin="${paging.startPage }"
						end="${paging.endPage }">
						<c:if test="${i eq paging.currentPage }">
							<a class="num2"> ${i } </a>
						</c:if>
						<c:if test="${i != paging.currentPage }">
							<a href="${conPath }/main/mainto.do?pageNum=${i}&windowType=${1}"
								class="num">${i }</a>
						</c:if>
					</c:forEach>
					<c:if test="${paging.endPage < paging.pageCnt }">
						<a
							href="${conPath }/main/mainto.do?pageNum=${paging.endPage+1}&windowType=${1}"
							class="btn">다음</a>
					</c:if>
					<div>&nbsp;</div>
					<c:if test="${empty member and empty admin }">
						<div class="bt_wrap">
							<input type="button" value="LOGIN" class="btn"
								onclick="location='${conPath}/member/loginForm.do'" />
						</div>
					</c:if>
				</div>
				<input type="hidden" name=mid value="${mid }"> <input
					type="button" value="그룹 생성" class="makeGroup"
					onclick="location='${conPath }/groups/groupInsertForm.do?mid=${mid}'">
			</div>

		</div>
		<!-- new -->
	</div>
	<c:if test="${not empty mid }">
     <div id="buttons">
        <input type="button" value="MY GROUPS" onclick="location='${conPath }/main/mainto.do?windowType=${1}'" class="btn1"> 
        <input type="button" value="FAQ" onclick="location='${conPath}/qboard/listQboardForMember.do'" class="btn2">
     </div>
   </c:if>


	<c:if test="${param.windowType eq 0}">
		<jsp:include page="../main/footer.jsp" />
	</c:if>
	<c:if test="${empty param.windowType}">
		<jsp:include page="../main/footer.jsp" />
	</c:if>
	<%-- <c:if test="${param.windowType eq 1}">
		<nav class="footer">
			<div class="container">
				<p>
					서울시 XX구 XX로 000 XXX빌딩 8F | TEL : 02-999-9999 | FAX : 02-999-9998
					사업자등록번호 : 000-12-00000 | 통신판매업신로 : 종로 제0000호 |
					<br>좋은시스템
					문의 메일 : webmaster@joeun.com <br>ⓒ2022 JOEUNSYSTEM.Co.,Ltd. All
					Rights Reserved.
				</p>
			</div>
		</nav>
	</c:if> --%>
</body>
<script>
	(function($) {
		"use strict";
		$("#switch").on('click', function() {
			if ($(".mainSection").hasClass("change")) {
				$(".mainSection").removeClass("change");
				$("#switch").removeClass("switched");
				$(".mainSection").removeClass("change");
				$('.newDiv').css('display', 'none');
				$('.oldDiv').css('display', 'block');

			} else {
				$(".mainSection").addClass("change");
				$("#switch").addClass("switched");
				$('.newDiv').css('display', 'block');
				$('.oldDiv').css('display', 'none');

			}
			if ($(".header").hasClass("change")) {
				$(".header").removeClass("change");
				$(".footer").removeClass("change");
				$("#switch").removeClass("switched");

			} else {
				$(".header").addClass("change");
				$(".footer").addClass("change");
				$("#switch").addClass("switched");
			}
			if ($("#switch").hasClass("switched")) {
				$(".mainSection").addClass("change");
				$('.newDiv').css('display', 'block');
				$('.oldDiv').css('display', 'none');
			}
		});
	})(jQuery);
</script>

<script>
	/*  var windowType = Number('${param.windowType}'); */
	(function($) {
		"use strict";
		$(document).ready(function() {
			if ($("#switch").hasClass("switched")) {
				$(".mainSection").addClass("change");
				$('.newDiv').css('display', 'block');
				$('.oldDiv').css('display', 'none');
				$(".header").addClass("change");
				$('#windowType').val(1);
			} else {
				$('#windowType').val(0);
			}
		});
	})(jQuery);
</script>



<script>
	(function($) {
		$("#switch").on('click', function() {
			if ($(".mainSection").hasClass("change")) {
				$('#windowType').val(1);
			} else {
				$('#windowType').val(0);
			}
		});
	})(jQuery);
</script>



</html>
