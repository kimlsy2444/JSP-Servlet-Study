<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward태그,param태그 퀘스트</title>
</head>
<body>
	<h1>forward_param.jsp페이지 입니다.</h1>
	<% 
		System.out.println("페이지 이동하기전 forward_param.jsp페이지 입니다.");
	%>
<!-- 	아울러, 페이지 이동에 있어서 request객체는 서로 공유하기 때문에 forward_param_result.jsp
		페이지에서는 request를 이용하여 미래의 파라메터값을 참조하면 된다. -->
	<jsp:forward page="forward_param_result.jsp">
		<jsp:param value="abcde" name="id"/>
		<jsp:param value="12345" name="pw"/>
	</jsp:forward>
</body>
</html>