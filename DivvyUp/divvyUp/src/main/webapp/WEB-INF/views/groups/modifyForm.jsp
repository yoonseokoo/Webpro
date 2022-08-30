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
<link href="${conPath}/css/groups/groupModify.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>


<script>
	function deleteMember(mid) {
		location = '${conPath }/groupDetail/deleteMember.do?gid=${groupInfo.gid }&mid='
				+ mid;
	}
</script>
<script>
	function confirmDeleteGroup() {
		let confirmDeleteGroup = confirm("그룹를 삭제하시겠습니까? 삭제 후 복구 불가합니다");
		if (confirmDeleteGroup) {
			location = '${conPath}/groups/deleteGroup.do?gid=${groupInfo.gid}';
		}
	}
</script>
</head>
<body>
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
			<form
				action="${conPath }/groups/modify.do?mid=${member.mid  }&gid=${groupInfo.gid }"
				method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<td colspan="2"><h1><span>${groupInfo.gid }</span>번 정보수정</h1></td>
					</tr>

					<tr>
						<td class="titles" style="text-align: left; padding-left: 40px;">그룹
							이름</td>
						<td><input type="text" name="gname" class="gname"
							value="${groupInfo.gname }"></td>
					</tr>
					<tr>
						<td class="titles" style="text-align: left; padding-left: 40px;">그룹
							이미지 첨부</td>
						<td><input type="file" name="tempImage">${groupInfo.gimg }</td>
					</tr>
					<tr>
						<td class="titles" style="text-align: left; padding-left: 40px;">그룹
							설명</td>
						<td><textarea name="gcontent" class="gcontent" rows="6"
								cols="30" 
								style="border: 0.5px solid lightgrey; outline: none; text-align: center;">${groupInfo.gcontent }</textarea></td>
					</tr>
					<tr>
						<td class="titles" style="text-align: left; padding-left: 40px;">그룹
							멤버 추가</td>
						<td><div class="scrollable"><c:forEach items="${followList }" var="fids">
								<div>
									<input type="checkbox" class="fids" name="fids" id="${fids}"
										value="${fids }"
										<c:forEach items="${groupDetailList }" var="mems" >
	    																									<c:if test="${fids eq mems.mid }"> 
	    																										checked="checked"
	    																										<c:if test="${mems.gdbalance eq 0 }">
	    																											checked="checked" onclick="deleteMember('${mems.mid }');"
	    																										</c:if>
	    																										<c:if test="${mems.gdbalance != 0 }">
	    																											onclick="return false" checked="checked"
    																												style="accent-color:grey; color:grey;"
	    																										</c:if>
	    																									</c:if>
	    																									
    																									</c:forEach>>
									<label for="${fids }">${fids }</label>
								</div>
							</c:forEach></div></td>
					</tr>
					<tr>
						<td class="titles" style="text-align: left; padding-left: 40px;">그룹
							생성자</td>
						<td>${groupInfo.mid }</td>
					</tr>
					<tr>
						<td class="titles" style="text-align: left; padding-left: 40px;">생성일</td>
						<td><fmt:formatDate type="date" value="${groupInfo.grdate}" /></td>
					</tr>


					<tr>
						<td colspan="3"><input type="submit" value="수정"
							class="btn_style"> <input type="button" value="뒤로가기"
							onclick="history.back()" class="btn_style">
							<input type="button" onclick=" return confirmDeleteGroup();" class="btn_style2" value="그룹삭제"></td>
					</tr>
				</table>
			</form>

		</div>
		<div id="content2">
			<c:if test="${not empty groupInfo.gimg }">
				<img src="${conPath }/groupsImgFileUpload/${groupInfo.gimg }">
			</c:if>
			<c:if test="${empty groupInfo.gimg }">
				<img 
					src="https://static.vecteezy.com/system/resources/previews/003/674/939/original/friendship-day-background-with-best-friends-free-vector.jpg">
			</c:if>


		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>