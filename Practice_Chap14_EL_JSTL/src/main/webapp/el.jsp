<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL표기법</title>
</head>
<body>
	<%
		pageContext.setAttribute("scores",new int[]{10,20,30});
		int el = 10;
	%>
	표현식으로 출력한 내용 <br/>
	<%= el %><br/> <!-- 단순히 변수명을 주면 출력이 되지 아니한다. -->
	EL로 출력한 내용 <br/> <!-- EL표기법은 객체의 요소들의 값들을 간단한 코드로 가져올때 사용하면 유용하다. -->
	${scores[0]} <br/>
	${"이준성"} <br/>
	${100 } <br/>
	연산자 이용 <br/>
	${100+10} <br/>
	${(1>2)?"true" : "false"}<br/>
	${(1>2) || (1<2)} <br/>
	<%= (1>2) || (1<2) %><br/>
</body>
</html>