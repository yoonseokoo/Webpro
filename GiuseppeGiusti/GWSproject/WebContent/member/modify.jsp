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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  	<script>
  $( function() {
    $( "#datepicker" ).datepicker({
    	dateFormat : 'yy-mm-dd',
    	changeMonth : true, 
    	monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    	showMonthAfterYear : true,
    	yearSuffix : '년',
    	showOtherMonths : true,
    	dayNamesMin:['일','월','화','수','목','금','토'],
			changeYear : true,
			minDate : '-100y',
			yearRange : 'c-100:c+0',
    });
  });
  </script>
  <script>
		$(document).ready(function(){
				$('input[name="mPw"], input[name="mPwChk"]').keyup(function(){
					var mPw = $('input[name="mPw"]').val();
					var mPwChk = $('input[name="mPwChk"]').val();
					if(mPw == mPwChk){
						$('#pwChkResultModify').text('비밀번호 일치');
					}else{
						$('#pwChkResultModify').html('<b>비밀번호 불일치</b>');
					}
				});
				
				$('form').submit(function(){
					var pwChkResultModify = $('#pwChkResultModify').text().trim();
					if (pwChkResultModify !='비밀번호 일치'){
						alert('비밀번호 불일치');
						return false;
					} 
				});
			});
	</script>
	<script>
	 function confirmAction() {
		 var pwChkResultModify = $('#pwChkResultModify').text().trim();
			if (pwChkResultModify !='비밀번호 일치'){
				alert('안전한 회원탈퇴를 위해, 비밀번호를 확인해주세요.');
				return false;
			}
	        let confirmAction = confirm("회원 탈토퇴를 하시겠습니까?");
	        if (confirmAction) {
	        	location='${conPath}/withdrawal.do';
	        } 
	 }
	</script>
	<link href="${conPath }/css/modify.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="modifyForm_wrap">
	<form action="${conPath }/modify.do" method="post" >
		<table>
			<caption>회원 정보 수정</caption>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="mId" value="${member.mId }" readonly="readonly" class="mId">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="mPw" required="required" value="${member.mPw }" class="mPw">
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" name="mPwChk" required="required"  autofocus="autofocus" class="mPwChk">
					<div id="pwChkResultModify"></div>
				</td>
			</tr>
			<tr>
			<th>이름</th>
				<td>
					<input type="text" name="mName" required="required" value="${member.mName } " autofocus="autofocus" class="mName">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="mPhone" value="${member.mPhone }" autofocus="autofocus" class="mPhone" >
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td colspan="2">
					<input type="text" name="mAddress" value="${member.mAddress }" class="mAddress">
				</td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td colspan="2">
					<input type="text" name="mAddressDetail" value="${member.mAddressDetail }" class="mAddressDetail">
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td colspan="2">
					<input type="text" name="mBirth" id="datepicker" value="${member.mBirth }" autofocus="autofocus" class="mBirth">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="email" name="mEmail" value="${member.mEmail }" autofocus="autofocus" class="mEmail"></td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="submit" value="정보수정" class="modifyBtn_style">
					<input type="reset" value="초기화" class="modifyBtn_style">
					<input type="button" value="이전" onclick="history.go(-1)" class="modifyBtn_style">
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<input type="button" value="회원탈퇴" onclick="return confirmAction()" class="modifyBtn_style2">
				</td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>