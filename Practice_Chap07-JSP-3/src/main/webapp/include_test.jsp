<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인클루드 액션태그 테스트</title>
</head>
<body>
	<h1>include_test.jsp</h1>
	<!-- 앞서 include를 사용해 봤다 그때의 include는 페이지 지시자를 이용한 것이고
		 이번에 이용한것은 액션태그를 이용한 것이다.
		 차이점이다렴ㄴ 페이지 지시자는 소스 코드가 text로 포함이 되어진다. 그래서 조각 코드를 삽입할 용도로 많이 사용된다
		 flush속성을 true로 설정을 하면 포함될 페이지로 이동하기 전에 버퍼를 다 비워버린다. 
		 포함될 페이지로 이동한다. 통상 false로 설정해줘야 한다(기본값)
		 include액션 태그는 여러 페이지를 동적으로 하나의 페이지로 묶을 수 있으므로,
		 각각의 페이지를 기능별로 모듈화가 가능하다 이것이 템플릿 페이지라고 한다.-->
	<jsp:include page="incldue_test_samle.jsp" flush="false"/>
	<h1>다시 include_test.jsp페이지입니다.</h1>
</body>
</html>