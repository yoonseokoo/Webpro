<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		fieldset {
		width: 50%;
		margin:0 auto;
		}
	</style>
</head>
<body>
<% String num = request.getParameter("num"); %>
	<form action="">
	 <fieldset >
	 <legend>숫자입력</legend>
		<label for="num">숫자</label>
		<input type="number" name="num" value="<%if(num!=null) out.print(num);%>">
		<input type="submit" value="누적">
		</fieldset>
		<%
		if (num!=null && !num.equals("")){
		int n = Integer.parseInt(num);
		int tot = 0;
		for (int i=1 ; i<=n ; i++){
			tot+=i;
		}
		out.println("<h2>1 부터 " + n+ " 까지 누적합은 "+ tot+ "이다");
		}
		%>
	</form>
</body>
</html>