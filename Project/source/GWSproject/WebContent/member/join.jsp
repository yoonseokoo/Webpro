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
	<link href="${conPath }/css/join.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
				$('input[name="mId"]').keyup(function(){
					var mId = $('input[name="mId"]').val();
					$.ajax({
						url : '${conPath}/idConfirm.do',
						data : 'mId=' + mId,
						type: 'get',
						dataType:'html',
						success: function(data){
							$('#idConfirmResult').html(data);			
						}
				});
			});
				$('input[name="mEmail"]').keyup(function(){
					var mEmail = $('input[name="mEmail"]').val();
					$.ajax({
						url : '${conPath}/emailConfirm.do',
						data : 'mEmail=' + mEmail,
						type: 'get',
						dataType:'html',
						success: function(data){
							$('#emailConfirmResult').html(data);			
						}
				});
			});
				$('input[name="mPw"], input[name="mPwChk"]').keyup(function(){
					var mPw = $('input[name="mPw"]').val();
					var mPwChk = $('input[name="mPwChk"]').val();
					if(mPw == mPwChk){
						$('#pwChkResult').text('Passwords match!');
					}else{
						$('#pwChkResult').html('<b>Passwords do not match</b>');
					}
				});
				
				$('form').submit(function(){
					var idConfirmResult = $('#idConfirmResult').text().trim();
					var pwChkResult = $('#pwChkResult').text().trim();
					var emailConfirmResult = $('#emailConfirmResult').text().trim();
					if (idConfirmResult != "Available ID"){
						alert('Please use choose another ID');
						$('#idConfirmResult').focus();
						return false;
					} else if (pwChkResult !='Passwords match!'){
						alert('Please check your password');
						return false;
					} else if (emailConfirmResult != "Available email") {
						alert('This email is already used by another member. Please choose another email');
						$('#emailConfirmResult').focus();
						return false;
					}
				});
			});
	</script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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

</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="joinForm_wrap">
	<form action="${conPath }/join.do" method="post" enctype="multipart/form-data">
		<table>
			<caption>회원가입</caption>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="mId" required="required" class="id">
					<div id="idConfirmResult"></div>
				</td
			></tr>
				
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="mPw" required="required" class="pw">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="mPwChk" required="required" class="pwChk">
					<div id="pwChkResult"></div>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
				<input type="text" name="mName" required="required" class="name">
			</td></tr>
			<tr>
				<th>메일</th>
				<td>
					<input type="email" name="mEmail" class="email">
					<div id="emailConfirmResult"></div>
				</td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<input type="file" name="mPhoto" class="photo">
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="text" name="mBirth" id="datepicker" class="birth">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="mAddress" class="address">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="회원가입" class="joinBtn_style">
					<input type="button" value="로그인" onclick="location='${conPath}/loginView.do'" class="joinBtn_style">
				</td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>
