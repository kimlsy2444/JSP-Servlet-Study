<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:useBean id="customer" class="sec02_exam.Customer" scope="page"/>
<!-- 클라이언트가 입력한 값 전부를 저장하는 코드다. 사용을 안하면 일일히 프로퍼티를 다 만들어야한다. -->
<jsp:setProperty property="*" name="customer"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과</title>
</head>
<body>
	<h2>회원정보 출력</h2>
	<strong>아이디 : </strong> <%= customer.getId()%>
	<b>비밀번호 : </b> <%= customer.getPw()%>
	<b>이름 : </b> <%= customer.getName()%>
	<b>생년월일 : </b> <%= customer.getBirthday()%>
	<b>주소 : </b> <%= customer.getAddr()%>
	<b>이메일 : </b> <%= customer.getEmail()%>
</body>
</html>