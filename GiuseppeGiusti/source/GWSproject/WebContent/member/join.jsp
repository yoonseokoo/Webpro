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
					var patternMail = /^[a-zA-Z0-9_]+@[a-zA-Z0-9]+(\.[a-zA-Z]+){1,2}$/;
					var mEmail = $('input[name="mEmail"]').val();
					if(patternMail.test(mEmail)){
						$.ajax({
							url : '${conPath}/emailConfirm.do',
							data : 'mEmail=' + mEmail,
							type: 'get',
							dataType:'html',
							success: function(data){
								$('#emailConfirmResult').html(data);			
							}
						});
					} else if (!mEmail) {
						$('#emailConfirmResult');
					} else {
						$('#emailConfirmResult').html('<b>메일 형식을 지켜주세요</b>');
					}
				});
						
				$('input[name="mPw"], input[name="mPwChk"]').keyup(function(){
					var mPw = $('input[name="mPw"]').val();
					var mPwChk = $('input[name="mPwChk"]').val();
					if(mPw == mPwChk){
						$('#pwChkResult').text('비밀번호 일치');
					}else{
						$('#pwChkResult').html('<b>비밀번호 불일치</b>');
					}
				});
				
				$('form').submit(function(){
					var idConfirmResult = $('#idConfirmResult').text().trim();
					var pwChkResult = $('#pwChkResult').text().trim();
					var emailConfirmResult = $('#emailConfirmResult').text().trim();
					if (idConfirmResult != "사용가능한 아이디입니다"){
						alert('다른 아이디를 선택해 주세요');
						$('#idConfirmResult').focus();
						return false;
					} else if (pwChkResult !='비밀번호 일치'){
						alert('비밀번호를 확인하세요');
						return false;
					} else if (emailConfirmResult != "사용가능한 이메일입니다") {
						alert('해당 이메일 주소를 사용할 수 없습니다. 다른 주소를 선택하십시오');
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
    	dayNamesMin:['Mon','Tues','Wed','Thur','Fri','Sat','Sun'],
			changeYear : true,
			minDate : '-100y',
			yearRange : 'c-100:c+0',
    });
  });
  </script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
</head>
<body>
		<jsp:include page="../main/header.jsp"/>
	
	
	<form action="${conPath }/join.do" method="post">
	<div id="totalJoin">
		<div id="joinForm_wrap1">
		<table>
			<caption>회원가입</caption>
			<tr>
				<th>아이디<b>&nbsp;*&nbsp;</b></th>
				<td>
					<input type="text" name="mId" required="required"  autofocus="autofocus" class="mId" >
					<div id="idConfirmResult"></div>
				</td>
			</tr>
				
			<tr>
				<th>비밀번호<b>&nbsp;*&nbsp;</b></th>
				<td>
					<input type="password" name="mPw" required="required"  autofocus="autofocus" class="mPw">
				</td>
			</tr>
			<tr>
				<th>비밀번호<b>&nbsp;*&nbsp;</b></th>
				<td>
					<input type="password" name="mPwChk" required="required"  autofocus="autofocus" class="mPwChk">
					<div id="pwChkResult"></div>
				</td>
			</tr>
			<tr>
				<th>이름<b>&nbsp;*&nbsp;</b></th>
				<td>
					<input type="text" name="mName" required="required"  autofocus="autofocus" class="mName">
				</td>
			</tr>
			<tr>
				<th>전화번호<b>&nbsp;*&nbsp;</b></th>
				<td>
					<input type="text" name="mPhone" required="required"  autofocus="autofocus" class="mPhone" placeholder="000-0000-0000" >
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="mAddress"  autofocus="autofocus" class="mAddress" id="address_kakao" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td>
					<input type="text" name="mAddressDetail" autofocus="autofocus"  class="mAddressDetail" ></textarea>
				</td>
			</tr>
			<tr>
				<th>생년월일<b>&nbsp;*&nbsp;</b></th>
				<td>
					<input type="text" name="mBirth"  required="required" autofocus="autofocus" id="datepicker" class="mBirth" placeholder="YYYY/MM/DD">
				</td>
			</tr>
			<tr>
				<th>이메일<b>&nbsp;*&nbsp;</b></th>
				<td>
					<input type="email" name="mEmail" required="required" autofocus="autofocus" class="mEmail">
					<div id="emailConfirmResult"></div>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="mGender" value="m" id="m" />
                    <label for="m">남자</label>
                    <input type="radio" name="mGender" value="f" id="f" />
                    <label for="f">여자</label>
                 </td>
			<tr>
				<td colspan="2">
					<input type="submit" value="회원가입"  class="joinBtn_style">
				</td>
			</tr>
		</table>
	</div>
	<div id="joinForm_wrap2">
			<img src="${conPath }/img/joinPage.jpg" >
		</div>
	</div>
	</form>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>
