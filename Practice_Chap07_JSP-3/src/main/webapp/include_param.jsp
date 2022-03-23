<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인클루드_패럼 테스트</title>
</head>
<body>
	<h1>include액션 태그 테스트</h1>
	<jsp:include page="inclde_param_result.jsp" flush="false">
		<jsp:param value="이순신" name="name"/>
		<jsp:param value="58" name="age"/>
	</jsp:include>
	<br/>
	<h2>다시 inclde_param.jsp페이지 입니다.</h2>
</body>
</html>