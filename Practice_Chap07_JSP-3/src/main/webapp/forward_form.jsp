<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼태그오 포워드</title>
</head>
<body>
	<h1>포워드와 폼을 이용한 테스트입니다.</h1>
	<form action="forward_form_result01.jsp" method ="post">
		<!-- hidden타입은 사용자로부터 입력을 받지 않는다. 특정값을 지정을 해서 숨겨서 페이지로 값을 전달하는 타입이다. -->
		<input type = "hidden" name= "forwardPage" value ="forward_form_result02.jsp">
		
		<table border = "1" bgcolor = "yellow">
			<tr>
				<td>이름</td>
				<td><input type ="text" name="name"></td>
			</tr>
			
			<tr>
				<td>나이</td>
				<td><input type ="text" name="age"></td>
			</tr>

			<tr>
				<td>주소</td>
				<td><input type ="text" name="address"></td>
			</tr>
			
			<tr>
				<td><input type ="submit" value="전송하기"></td>
			</tr>							
		</table>
	</form>
</body>
</html>