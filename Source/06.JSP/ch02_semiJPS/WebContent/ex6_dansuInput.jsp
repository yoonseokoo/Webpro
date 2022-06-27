<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
	window.onload = function() {
		document.querySelector('form').onsubmit = function(){
			var su = document.querySelector('input[name="su"]');
			var su2 = document.querySelector('input[name="su2"]');
			if (!su.value){
				alert('Please insert first number');
				su.focus();
				return false;
			} else if (!su2.value) {
				alert('Please insert second number');
				su2.focus();
				return false;
			}
			var s1 = Number(su.value);
			var s2 = Number(su2.value);
			if(s1>s2) {
				alert('The number2 must be larger or equal to number1');
				su.value = '';
				su2.value = '';
				su.focus();
				return false;
			}
		};
	};
	
	</script>
	<style>
	
		h1, p{
		text-align:center;
		}
		
		form {
		border: 1px solid black;
		margin: 0 auto;
		}
		
	
	</style>
</head>
<body>
		<h1>단수입력 </h1>
	<form action="ex6_gugudanOut.jsp" method="get">
		<p> 단수: <input type="number" name = "su" min="2" max="9">
		단 ~ : <input type="number" name = "su2" min=su max="9"> 
		단 까지</p>
		<p><input type="submit" value="구구단 출력"></p>
	</form>
</body>
</html>