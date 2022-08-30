<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="${conPath}/css/groups/groupInfo.css" rel="stylesheet">
<script>
		function confirmAction() {
			if (${check} == 0) {
				let confirmAction = confirm("정산하시겠습니까? 정산이 시작되면 지출추가가 불가합니다");
				if (confirmAction) {
					location='${conPath }/centralSystem/insertSplit.do?gid='+${groupInfo.gid };
				} 
			} else if (${check} == 1) {
				alert('이미 정산이 진행되었습니다')
			}
		}
	</script>
<script>
		function pay(gdbalance) {
			var child = open('${conPath }/centralSystem/payForm.do?gid=${groupInfo.gid }&mid=${member.mid }&gdbalance='+gdbalance, '', 'width=500, height=350');
			if (!child) {
				alert('Please allow pop-ups');
			}
		}
		function get(gdbalance) {
			if (${checkAllPaid } == 1) {
				var child = open('${conPath }/centralSystem/getForm.do?gid=${groupInfo.gid }&mid=${member.mid }&gdbalance='+gdbalance, '', 'width=500, height=350');
				if (!child) {
					alert('Please allow pop-ups');
				}
			} else if (${checkAllPaid } == 0) {
				alert('잔액 부족으로 정산을 진행할 수 없습니다');
			}
		}
	</script>



</head>
<body>

	<c:if test="${done eq 1 }">
		<script>alert('모든 정산이 끝났습니다');</script>
	</c:if>
	<c:if test="${modifyResult eq 1 }">
		<script>
			alert('그룹정보 수정 성공');
		</script>
	</c:if>

	<c:if test="${modifyResult eq 0 }">
		<script>
			alert('그룹정보 수정 실패');
		</script>
	</c:if>

	
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
			<div class="groupDetail">
				<table>
					<tr>
						<td colspan="2"><h1>그룹 정보</h1></td>
					</tr>
					<tr>
						<td class="titles">그룹 번호</td>
						<td>${groupInfo.gid }</td>
					<%-- 	<td rowspan="5">
								<c:if test="${not empty groupInfo.gimg }">
									<img src="${conPath }/groupsImgFileUpload/${groupInfo.gimg }">
								</c:if>
								<c:if test="${empty groupInfo.gimg }">
									<img style="width: 300px;"
										src="https://i0.wp.com/digital-photography-school.com/wp-content/uploads/2012/03/228076193_6ed6989589_z.jpg?fit=640%2C420&ssl=1">
								</c:if>
						</td> --%>
					</tr>
					<tr>
						<td class="titles">이름</td>
						<td>${groupInfo.gname }</td>
					</tr>
					<tr>
						<td class="titles">생성일</td>
						<td>${groupInfo.grdate }</td>
					</tr>

					<tr>
						<td class="titles">내용</td>
						<td><p>${groupInfo.gcontent }</p></td>
					</tr>
					<tr>
						<td class="titles">생성자</td>
						<td>${groupInfo.mid }</td>
					</tr>
					
					<c:if test="${member.mid eq groupInfo.mid }">
					<tr>
						<td colspan="2">
						<input type="button" value="그룹 정보수정" class="groupInfoBtn2" onclick="location='${conPath }/groups/modifyForm.do?gid=${groupInfo.gid }&mid=${member.mid }'">
						<input type="button" class="groupInfoBtn2" value="그룹 채팅" onclick="location.href='${conPath}/groupboard/groupChatBoard.do?gid=${groupInfo.gid }&mid=${member.mid }'"></td>
					</tr>
					</c:if>
					<c:if test="${member.mid != groupInfo.mid }">
					<tr>
						<td colspan="2">
						<input type="button" class="groupInfoBtn2" value="그룹 채팅" onclick="location.href='${conPath}/groupboard/groupChatBoard.do?gid=${groupInfo.gid }&mid=${member.mid }'"></td>
					</tr>
					</c:if>
				</table>
			</div>
			<div class="groupMember">
				<h4 style="margin-left:5px;">그룹 멤버 : </h4>
				<table class="scrollable" style="height:17vh; width: 100%;">
					<tr class="titles">
						<td class="titles">아이디</td>
						<td class="titles">정상잔액</td>
						<td class="titles">가입일</td>
					</tr>
					<c:set var="sum" value="0" />
					<c:forEach items="${groupDetailList }" var="gMems">
						<tr>
							<td >${gMems.mid }</td>
							<td>${gMems.gdbalance }<input type="hidden" id="gdbalance"
								value="${gMems.gdbalance }" /></td>
							<c:set var="sum" value="${sum + Math.abs(gMems.gdbalance) }" />
							<td>${gMems.gdrdate }</td>
							<c:if test="${check eq 1}">
								<c:if test="${member.mid eq gMems.mid}">
									<c:if test="${gMems.gdbalance < 0 }">
										<td><input type="button" value="내기" class="btn4"
											onclick="pay('${gMems.gdbalance }');"></td>
									</c:if>
									<c:if test="${gMems.gdbalance > 0 }">
										<td><input type="button" value="받기" class="btn4"
											onclick="get('${gMems.gdbalance }');"></td>
									</c:if>
								</c:if>
								<c:if test="${gMems.gdbalance eq 0 }">
									<td style="color: 'green';">정산완료</td>
								</c:if>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
			<table class="buttons">
				<tr>
					<c:if test="${done eq 0 }">
						<td colspan="3"><input type="button" value="이벤트 목록"
							class="groupInfoBtn"
							onclick="location='${conPath }/event/eventList.do?gid=${groupInfo.gid }&mid=${member.mid }'"></td>

						<c:if test="${check eq 0}">

							<td><input type="button" value="이벤트 추가" class="groupInfoBtn"
								onclick="location='${conPath }/event/selectEventType.do?gid=${groupInfo.gid }&mid=${member.mid }'"></td>
							
							<c:if test="${sum != 0}">
								<c:if test="${member.mid eq groupInfo.mid }">
									<!-- 그룹 생성자만 정산하기 버튼 보임 -->
									
									<td>
										<button class="groupInfoBtn"
											onclick=" return confirmAction();">정산하기</button>
									</td>

								</c:if>
							</c:if>
							<td><input type="button" class="groupInfoBtn" value="뒤로가기" onclick="location='${conPath }/main/mainto.do?windowType=${1}'"></td>
						</c:if>
					</c:if>
					
				</tr>
				<c:if test="${done eq 1 }">
					<tr>
						<td>정산이 끝났습니다</td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
