<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
<script>
	$(document).ready(function(){
		$('p').click(function() {
			$(this).hide();
		});
		$('button#hideP1').click(function() {
			$('#p1').hide();
		});
		$('button#hidePtag').click(function() {
			$('p').hide('fast');
		});
		$('button#showPtag').click(function() {
			$('p').show();
		});
	});
</script>
	
</head>
<body>
	<h1>HEADER</h1>
	<p>If P tag is clicked, it disappears</p>
	<p>If P tag is clicked, it disappears</p>
	<p id="p1">You can also make only p1 to disappear</p>
	
	<button id="hideP1">Hiding only P1</button>
	<button id="hidePtag">Hide all p tags</button>
	<button id="showPtag">Show all p tags</button>
	
</body>
</html>