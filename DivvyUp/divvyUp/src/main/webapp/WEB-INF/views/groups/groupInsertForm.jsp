<%@ page language="java" contentType="text/html; charset= UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title></title>
<link href="${conPath}/css/groups/groupInsert.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
	$(document).ready(function() {
		var numberOfChecked = 1;
		$('.mids').click(function() {
			numberOfChecked = $('input:checkbox:checked').length;
			$('#msg').val(numberOfChecked + 1);
		});
		var g = document.getElementById("unclickable").disabled = false;
	});
</script>
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
		<form action="${conPath }/groups/groupInsert.do?mid=${member.mid  }&windowType=${2}"
			method="post" enctype="multipart/form-data">
			<c:set var="now" value="<%=new java.util.Date()%>" />
			<input type="hidden" name="method" value="insertEvent">
			<table>
				<tr><td colspan="2" style="text-align:left; padding-left: 20px;  padding-top: 20px;  color:#757877; font-weight:100; font-size:0.8em; " ><fmt:formatDate type="date" value="${now}" /></td></tr>
				<tr><td colspan="2"><h1>그룹 생성 : <span style="color:#1DBF73;">${nextGid}</span></h1></td></tr>
				<tr>
					<td class="titles" style="text-align:left; padding-left:40px;"> 그룹 아이디</td>
					<td>${nextGid}</td>
				</tr>
				<tr>
					<td class="titles" style="text-align:left; padding-left:40px;">그룹 이름<b>&nbsp;*&nbsp;</b></td>
					<td><input type="text" name="gname" class="gname" style="text-align:center;" required="required"></td>
				</tr>
				<tr>
					<td class="titles" style="text-align:left; padding-left:40px;">그룹 이미지 첨부</td>
					<td><input type="file" name="gimage" ></td>
				</tr>
				<tr>
					<td class="titles" style="text-align:left; padding-left:40px; ">그룹 설명</td>
					<td><textarea name="gcontent" rows="6" style=" border: 0.5px solid lightgrey; outline: none; text-align:center;" placeholder= "Please insert here"></textarea></td>
				</tr>
				<tr>
					<td class="titles" style="text-align:left; padding-left:40px;">그룹 멤버 추가<b>&nbsp;*&nbsp;</b></td>
					
					<td><div class="scrollable"><c:forEach items="${followList }" var="fids">
							
								<input type="checkbox" class="fids" name="fids" id="${fids}"
									value="${fids }"style="padding-bottom:5px;" 
									<c:if test="${fids eq member.mid }"> 
    																								onclick="return false" checked="checked"
    																								style="accent-color:grey; color:grey;"
    																							</c:if>>
								<label for="${fids }" >${fids }</label>
								<br>
						</c:forEach></div></td>
						
				</tr>
				<tr> 
					<td class="titles" style="text-align:left; padding-left:40px;">그룹 생성자</td>
					<td>${member.mid }</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="그룹생성" class="btn_style">
					<input type="button" value="뒤로가기" onclick="history.back()" class="btn_style"></td>
				</tr>
			</table>
		</form>
	</div>
	 <div id="content2">
			<img src="https://www.ox.ac.uk/sites/files/oxford/styles/ow_medium_feature/s3/field/field_image_main/shutterstock_360655751.jpg?itok=i-ChBNZC" >
	</div>
	</div> 
	<jsp:include page="../main/footer.jsp" />
</body>
</html>