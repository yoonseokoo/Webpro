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
<style>
	tr td{
		text-align:center;
	}
	th{
		width:50px;
	}
</style>
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
					if (idConfirmResult != "Available ID"){
						alert('Please use choose another ID');
						$('#idConfirmResult').focus();
						return false;
					} else if (pwChkResult !='Passwords match!'){
						alert('Please check your password');
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
	<form action="">
		<table>
			<tr>
				<th>ID </th>
				<td>
					<input type="text" name="mId" required="required">
					<div id="idConfirmResult"></div>
				</td>
			</tr>
			<tr>
				<th>PW </th>
				<td>
					<input type="password" name="mPw" required="required">
				</td>
			</tr>
			<tr>
				<th>PW</th>
				<td>
					<input type="password" name="mPwChk" required="required">
					<div id="pwChkResult"></div>
				</td>
			</tr>
			<tr>
				<th>BIRTHDAY</th>
				<td><input type="text" name="mBirth" id="datepicker">
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="가입"></td>
			</tr>
		</table>
	</form>
</body>
</html>