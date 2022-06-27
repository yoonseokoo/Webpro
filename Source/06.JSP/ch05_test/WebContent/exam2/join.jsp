<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
		function chkJoin(){
			if(pw.value != pwChk.value){
				alert('비밀번호를 확인하세요');
				pw.value = '';
				pwChk.value = '';
				pw.focus();
				return false;
			}
			var hobby = document.querySelectorAll('input[name="hobby"]');
			var cnt = 0;
			   for (var i = 0; i<hobby.length ; i++){
			        cnt += hobby[i].checked;
			         }
			   if(!cnt){
			        alert('You msut select atleast one hobby');
			            return false;
			  }
		}
	</script>
	<link href="../css/join.css" rel="stylesheet">
</head>
<body>
	<div id="joinForm_wrap">
		<form action="joinPro.jsp" name="frmJoin" onsubmit="return chkJoin()">
			<div id="join_title">회원가입</div>
			<table>
				<tr>
					<th><label for="name">이름</label></th>
					<td>
						<input type="text" name="name" id="name" class="name" 
							required="required" autofocus="autofocus">
					</td>
				</tr>
				<tr>
					<th><label for="id">아이디</label></th>
					<td>
						<input type="text" name="id" id="id" class="id" required="required">
					</td>
				</tr>
				<tr>
					<th><label for="pw">비밀번호</label></th>
					<td>
						<input type="password" name="pw" id="pw" class="pw" required="required">
					</td>
				</tr>
				<tr>
					<th><label for="pwChk">비밀번호확인</label></th>
					<td>
						<input type="password" name="pwChk" id="pwChk" class="pwChk" required="required">
					</td>
				</tr>
				<tr>
					<th><label for="birth">생년월일</label></th>
					<td>
						<input type="date" name="birth" id="birth" class="birth" required="required">
					</td>
				</tr>
				<tr>
					<th>취미</th>
					<td>
						<input type="checkbox" name="hobby" value="독서" id="reading">
						<label for="reading">독서</label>
						<input type="checkbox" name="hobby" value="요리" id="cooking">
						<label for="cooking">요리</label>
						<input type="checkbox" name="hobby" value="운동" id="exercise">
						<label for="exercise">운동</label>
						<input type="checkbox" name="hobby" value="취침" id="sleep">
						<label for="sleep">취침</label>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="gender" value="m" id="m" checked="checked">
						<label for="m">남자</label>
						<input type="radio" name="gender" value="f" id="f">
						<label for="f">여자</label>
					</td>
				</tr>
				<tr>
					<th><label for="email">이메일</label></th>
					<td>
						<input type="email" name="email" id="email" class="email" required="required">
					</td>
				</tr>
				<tr>
					<th>메일 수신</th>
					<td>
						<select name="mailSend" multiple="multiple" class="mailSend">
							<option>광고</option><option>배송</option><option>공지</option><option>댓글</option>
						</select>
					</td>
				</tr>
				<tr><td colspan="2"></td></tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="가입하기" class="joinBtn_style">
						<input type="reset" value="다시하기" class="joinBtn_style">
						<input type="button" value="뒤로가기" class="joinBtn_style" onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>