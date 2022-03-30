<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 저장값 출력하기</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>
	<!-- 표현식으로 값을 출력하는 부분 -->
	<p>아이디 : <%= id %>
	<p></p>비밀번호 : <%=pw %>
	<br/>
	<!-- El 태그의 내장객체 param객체를 이용하여 값을 출력하는 부분 -->
		<p>아이디 : ${param.id }
	<p></p>비밀번호 : ${param.pw}	
	
	<hr/>
	
	<!-- applicationScope내장객체는 웹프로젝트에 전부 적용이 되는값  -->
	<p> applicationScope : ${applicationScope.application_name }
	<!-- sesstionScope내장객체는 한 브라우저당 발생하므로 역시 값이 출력이 될 것이다.   -->
	<p> sessionScope : ${sessionScope.session_name }
	
	
	<!-- pageScope과 requestScope내장 객체는 현재 이 페이지에서 적용이 적용이 되지 않는다
		 innerObject에서 호출되고 있기 대문이다.   -->
	<p> pageScope : ${pageScope.page_name }
	<!-- sesstionScope내장객체는 한 브라우저당 발생하므로 역시 값이 출력이 될 것이다.   -->
	<p> requestScope : ${requestScope.request_name }
	
	

	<!-- 결론 : 실제 EL태그는 몰라도 상관은 없다 개발하는데 있어 단지 이런게 있다 정도만 알고 
		타인이 개발한 내용을 읽을 줄만 알면 될 것이다.
		아울러, EL태그를 잘 이용하면 코드의 양이 줄어들고 가독성도 높일 수 있을 것이다. 람다식을 쓰는 유 향상된 for문 생각 -->
	
	
	
</body>
</html>