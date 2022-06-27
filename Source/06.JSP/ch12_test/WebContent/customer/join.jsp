<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='<%=conPath %>/css/join.css' rel='stylesheet'>
<script>
	function infoConfirm(){
		if(join_frm.cpw.value!=join_frm.cpwChk.value){
			alert('비밀번호를 확인하세요');
			join_frm.cpw.value = '';
			join_frm.cpwChk.value = '';
			join_frm.cpw.focus();
			return false ;
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div id="joinForm_wrap">
		<form action="joinPro.jsp" method="post" name="join_frm" onsubmit="return infoConfirm()">
			<div id="join_title">회원가입</div>
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="cid" class="id" required="required"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="cpw"  class="pw" required="required"></td>
				</tr>
				<tr>
					<th>비밀번호확인</th>
					<td><input type="password" name="cpwChk" class="pwChk"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="cname" class="name" required="required" autofocus="autofocus"></td>
				</tr>
				<tr>
					<th>전화</th>
					<td><input type="text" name="ctel" class="tel" required="required" autofocus="autofocus" placeholder="010-"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" name="cemail" class="email" ></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="caddress" class="address"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="tempbirth" class="birth"  required="required" autofocus="autofocus"></td>
				</tr>
				
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="cgender" value="m" checked="checked">남자
						<input type="radio" name="cgender" value="f" >여자
					</td>
				</tr>
				<tr>
					<td colspan="2"> </td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="가입하기" class="joinBtn_style">
						<input type="reset" value="다시하기" class="joinBtn_style">
						<input type="button" value="로그인" class="joinBtn_style" 
											onclick="location.href='login.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>


